/* Author: Emilio Rios Ochoa aka. Emilio Rivers
 * Github: e-Rivers
 *
 * JavaScript file to link all HTML elements that require an event listener
 * such as mouse over or a key press.
 *
 */

// Event for displaying date when mouse is over the Calendar Field
document.getElementById("CalendarField").addEventListener("mouseover", () => {
    dateandtime.getDate();
});

// Event for sleeping the computer when the Sleep Field is double-clicked
document.getElementById("SleepField").addEventListener("dblclick", () => {
    lightdm.suspend();
});

// Event for rebooting the computer when the Reboot Field is double-clicked
document.getElementById("RebootField").addEventListener("dblclick", () => {
    lightdm.restart();
});

// Event for shutting down the computer when the Shutdown Field is double-clicked
document.getElementById("ShutdownField").addEventListener("dblclick", () => {
    lightdm.shutdown();
});

// Event for changing the screen displayed when the 'ESC' key is pressed
document.addEventListener("keydown", () => {
    if(event.which == 27) {
        if(document.getElementById("LoginScreen").style.opacity == 0) {
            document.getElementById("WelcomeMsg").style.opacity = 0;
            document.getElementById("BackgroundImage").style.filter = "blur(10px)";
            document.getElementById("LoginScreen").style.opacity = 1;
        } else {
            document.getElementById("WelcomeMsg").style.opacity = 1;
            document.getElementById("BackgroundImage").style.filter = "blur(0px)";
            document.getElementById("LoginScreen").style.opacity = 0;
       }
    }
});

// Events for changing the selected session
document.getElementById("SessionField").addEventListener("mouseover", () => sessions.setMouseOver(true));
document.getElementById("SessionField").addEventListener("mouseout", () => sessions.setMouseOver(false));

document.addEventListener("keydown", () => {
    if(sessions.isMouseOver()) {
        if(event.which == 72 || event.which == 104) {
            if(sessions.getSession("NUM") == 0) sessions.setSession(0, "MAX");
            else sessions.setSession(-1);
            sessions.displayValues();
        } else if(event.which == 76 || event.which == 108) {
            if(sessions.getSession("NUM") == (lightdm.sessions.length-1)) sessions.setSession(0, "MIN");
            else sessions.setSession(1);
            sessions.displayValues();
        }
    }
});

// Events for changing the selected user 
document.getElementById("UsersField").addEventListener("mouseover", () => users.setMouseOver(true));
document.getElementById("UsersField").addEventListener("mouseout", () => users.setMouseOver(false));

document.addEventListener("keydown", () => {
    if(users.isMouseOver()) {
        if(event.which == 72 || event.which == 104) {
            if(users.getUser("NUM") == 0) users.setUser(0, "MAX");
            else users.setUser(-1);
            users.displayValues();
            authentication.startAuth();
        } else if(event.which == 76 || event.which == 108) {
            if(users.getUser("NUM") == (lightdm.num_users-1)) users.setUser(0, "MIN");
            else users.setUser(1);
            users.displayValues();
            authentication.startAuth();
        }
    }
});

// Event to indicate if CapsLock is active and submit the password
document.getElementById("LoginPassword").addEventListener("keydown", () => {
    if(event.key == "Enter") authentication.verifyPassword();
});

// Events to focus and blur password field when mouse is not over the Login Box
document.getElementById("LoginField").addEventListener("mouseover", () => {
    document.getElementById("LoginPassword").focus();
});

document.getElementById("LoginField").addEventListener("mouseout", () => {
    document.getElementById("LoginPassword").blur();
});

// Events to set a default profile picture if the current user doesn't have one
document.getElementById("LoginPicture").addEventListener("error", () => {
    document.getElementById("LoginPicture").src = PATH+"assets/images/default-profile-picture.png";
});

document.getElementById("UserPicture").addEventListener("error", () => {
    document.getElementById("UserPicture").src = PATH+"assets/images/default-profile-picture.png";
});

// Event to set a default session image if the current session doesn't have one
document.getElementById("SessionPicture").addEventListener("error", () => {
    document.getElementById("SessionPicture").src = PATH+"assets/images/sessions/unknown.png";
});
