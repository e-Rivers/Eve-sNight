/* Author: Emilio Rios Ochoa aka. Emilio Rivers
 * Github: e-Rivers
 *
 * JavaScript file that contains the class definition for managing the users and
 * selecting the default ones 
 *
 */

var Users = function() {
    this.selected = 0;
    this.prefix = "Welcome Back,<br/><i id='UserToLogIn'>";
    this.mouseOver = false;
};

Users.prototype.setUser = function(next, flag=null) {
    switch(flag) {
        case "MAX":
            this.selected = lightdm.num_users-1; break;
        case "MIN":
            this.selected = 0; break;
        case null:
            this.selected += next; break;
    }
};

Users.prototype.getUser = function(flag=null) {
    return (flag==null) ? lightdm.users[this.selected] : this.selected;
};

Users.prototype.displayValues = function() {
    document.getElementById("UserName").innerHTML = this.getUser().display_name;
    document.getElementById("UserPicture").src = this.getUser().image;
    document.getElementById("LoginMsg").innerHTML = this.prefix+this.getUser().display_name+"</i>";
    document.getElementById("LoginPicture").src = this.getUser().image;
};

Users.prototype.isMouseOver = function() {
    return this.mouseOver;
};

Users.prototype.setMouseOver = function(value) {
    this.mouseOver = value;
};
