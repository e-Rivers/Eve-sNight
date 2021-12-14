/* Author: Emilio Rios Ochoa aka. Emilio Rivers
 * Github: e-Rivers
 *
 * JavaScript file that contains the class definition for managing the sessions and
 * selecting the one the user will log-in to
 *
 */

var Sessions = function() {
    this.selected = 0;
    this.sufix = "<br/><hr color='#00FF00'/>";
    this.mouseOver = false;
};

Sessions.prototype.setSession = function(next, flag=null) {
    switch(flag) {
        case "MAX":
            this.selected = lightdm.sessions.length-1; break;
        case "MIN":
            this.selected = 0; break;
        case null:
            this.selected += next; break;
    }
};

Sessions.prototype.getSession = function(flag=null) {
    return (flag==null) ? lightdm.sessions[this.selected].name : this.selected;
};

Sessions.prototype.displayValues = function() {
    document.getElementById("SessionName").innerHTML = this.getSession()+this.sufix;
    document.getElementById("SessionPicture").src = PATH+"assets/images/sessions/"+lightdm.sessions[this.selected].key+".png";
};

Sessions.prototype.isMouseOver = function() {
    return this.mouseOver;
};

Sessions.prototype.setMouseOver = function(value) {
    this.mouseOver = value;
};
