#!/bin/bash
# vim:fileencoding=utf-8:foldmethod=marker
# 
# ROFI CUSTOM WIFI MODI SCRIPT TO CONTROL WIFI CONNECTIONS
# 
# Author: Emilio Rivers (e-Rivers)
# Based on the code by @vlfldr

# Gets current WiFi status
CONSTATE=$(nmcli -fields WIFI g)
if [[ "$CONSTATE" =~ "enabled" ]]; then
	TOGGLE="Disable WiFi 睊"
elif [[ "$CONSTATE" =~ "disabled" ]]; then
	TOGGLE="Enable WiFi 直"
fi

# ONLY IF WIFI IS ENABLED, IT SCANS
if [[ "$TOGGLE" = "Disable WiFi 直" ]]; then
    nmcli -t dev wifi rescan
fi

# Gets a full list of the networks and their strength (bars) while adding
# a closed lock icon if they have security
FULL_LIST=$(nmcli --fields SSID,SECURITY,BARS device wifi list | sed '/--/d' | sed 1d | sed -E "s/WPA*.?\S/~~/g" | sed "s/~~ ~~/~~/g;s/802\.1X//g;s/--/~ ~/g;s/  *~/~/g;s/~  */~/g" | column -t -s '~')

# Only if wifi is enabled, it formats the output of FULL_LIST, cause otherwise
# it would be applying awk to empty strings
if [[ "$TOGGLE" = "Enable WiFi 直" ]]; then
    SSID_LIST=""
    DETS_LIST=""
else
    # This is a sublist of the FULL_LIST used to trim the networks' SSID if they
    # exceed certain length (in this case 20 chars)
    SSID_LIST=$(echo "$FULL_LIST" | awk '{$NF=$(NF-1)=""; print $0}' | awk -v len=20 '{if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }' )
    
    # This is a sublist just to extract the lock and bars icons
    DETS_LIST=$(echo "$FULL_LIST" | awk '{print $(NF-1),"",$NF}' )
fi

# This is the list now formatted
LIST=$(paste <(echo "$SSID_LIST") <(echo "$DETS_LIST") | column -t -s $'\t')

# This calls rofi's dmenu to display the SSID's list
CHENTRY=$(echo -e "$TOGGLE\n$LIST" | uniq -u | rofi -dmenu -u 0 -p "[ ]: " -selected-row 1 -theme /themes/eves-night-rofi_wifi_list.rasi)
# Store selected SSID
CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $1}')

if [[ "$CHENTRY" = "" ]]; then
    exit
elif [[ "$CHENTRY" = "Enable WiFi 直" ]]; then
	nmcli radio wifi on
elif [[ "$CHENTRY" = "Disable WiFi 睊" ]]; then
	nmcli radio wifi off
else
    # Get list of known connections
    KNOWNCON=$(nmcli connection show)
	
    # Verifies if the connection has security to call rofi for a password prompt
	if [[ "$CHENTRY" =~ "" ]]; then
		WIFIPASS=$(rofi -dmenu -password -p "[]: " -lines 1 -theme themes/eves-night-rofi_wifi_pass.rasi)
        # If the password introduced was nothing
        if [[ "$WIFIPASS" = "" ]]; then
            # Checks if it was a known connection and tries to connect
    	    if [[ $(echo "$KNOWNCON" | grep "$CHSSID") =~ "$CHSSID" ]]; then
                RESULT=$(nmcli dev wifi con "$CHSSID")
                if [[ $(echo "$RESULT" | grep "[sS]uccess") ]]; then 
                    notify-send "● CONNECTION SUCCESS" "Connected to $CHSSID"
                else
                    notify-send "● CONNECTION FAILED" "Wrong/Missing network's password"
                fi
            # If it wasn't a known connection then it fails
            else
                notify-send "● CONNECTION FAILED" "Wrong/Missing networks password"
            fi
        # If the used did introduce a password, then it tries to connect
        else
            RESULT=$(nmcli dev wifi con "$CHSSID" password "$WIFIPASS")
            if [[ $(echo "$RESULT" | grep "[sS]uccess") ]]; then 
                notify-send "● CONNECTION SUCCESS" "Connected to $CHSSID"
            else
                notify-send "● CONNECTION FAILED" "Wrong/Missing network's password"
            fi
        fi
    # If the network doesn't have security, it tries to connect
    else
        RESULT=$(nmcli dev wifi con "$CHSSID")
        if [[ $(echo "$RESULT" | grep "[sS]uccess") ]]; then 
            notify-send "● CONNECTION SUCCESS" "Connected to $CHSSID"
        else
            notify-send "● CONNECTION FAILED" "Wrong/Missing network's password"
        fi
    fi
fi
