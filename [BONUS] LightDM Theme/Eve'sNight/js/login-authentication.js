/* Author: Emilio Rios Ochoa aka. Emilio Rivers
 * Github: e-Rivers
 *
 * JavaScript file of the definition of the class needed for
 * user authentications
 *
 */

var Authentication = function() {
    this.password = document.getElementById("LoginPassword");
};

Authentication.prototype.startAuth = function() {
    this.password.style.backgroundImage = "linear-gradient(to right, rgba(0,0,0,1), rgba(7,7,137,0.75))";
    lightdm.cancel_autologin();
    lightdm.cancel_authentication();
    lightdm.authenticate(users.getUser().username);
};

Authentication.prototype.verifyPassword = function() {
    if(this.password.value.trim() != "") lightdm.respond(this.password.value);
};

Authentication.prototype.resetAuthAfterAutologinExpires = function() {
    window.autologin_timer_expired = function() {
        authentication.startAuth(users.getUser().username);
    };
};

Authentication.prototype.lightdmRequiredPrompt = function() {
    window.show_prompt = function() {
        // Do nothing, but this is required by lightdm
    };
};

Authentication.prototype.lightdmRequiredMessage = function() {
    window.show_message = function() {
        // Do nothing, but this is required by lightdm
    };
};

Authentication.prototype.onAuthCompleted = function() {
    let password = this.password;
    window.authentication_complete = function() {
        if(lightdm.is_authenticated) {
            password.style.backgroundImage = "linear-gradient(to right, rgba(0,0,0,1), rgba(7,137,7,0.75))";
            document.getElementById("BlackFade").style.zIndex = 100;
            document.getElementById("BlackFade").style.opacity = 1;
            setTimeout(() => {
                lightdm.start_session_sync(lightdm.sessions[sessions.getSession("KEY")].key);
            }, 1250);
        } else {
            lightdm.authenticate(users.getUser().username);
            password.value = "";
            password.style.backgroundImage = "linear-gradient(to right, rgba(0,0,0,1), rgba(137,7,7,0.75))";
        }
    };
};



