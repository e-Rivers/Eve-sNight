/* Author: Emilio Rios Ochoa aka. Emilio Rivers
 * Github: e-Rivers
 *
 * JavaScript file that instantiates all objects and initializes the values that
 * need to be set inmediately when the page loads
 *
 */

const PATH = window.location.pathname.replace("index.html", "");

var dateandtime = new DateandTime();
var sessions = new Sessions();
var users = new Users();
var authentication = new Authentication();

// Initial values initialization
window.onload = function() {
    // Initializes clock and automates the process to be done every second
    dateandtime.getTime();
    setInterval(dateandtime.getTime, 1000);
    // Preloads the values of the default user and session
    sessions.displayValues();
    users.displayValues();
    // Begins authentication with the default user and loads the required lightdm methods
    authentication.startAuth();
    authentication.lightdmRequiredPrompt();
    authentication.lightdmRequiredMessage();
    authentication.resetAuthAfterAutologinExpires();
    authentication.onAuthCompleted();
};
