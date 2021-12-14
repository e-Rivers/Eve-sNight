/* Author: Emilio Rios Ochoa aka. Emilio Rivers
 * Github: e-Rivers
 *
 * JavaScript file that contains the class definition for getting and displaying
 * date and time in the correct format, and also, to display the greeter initial message
 * such as 'Good Morning', 'Good Evening', etc.
 *
 */

var DateandTime = function() {
    this.welcomeMsg = document.getElementById("WelcomeMsg");
    this.clockText = document.getElementById("ClockText");
    this.calendarText = document.getElementById("CalendarText");
    this.date = null;
    this.time = null;
    this.months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    this.weekDays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
};

DateandTime.prototype.getTime = function() {
    this.time = new Date();
    let hour = this.time.getHours();
    let mins = this.time.getMinutes();
    let secs = this.time.getSeconds();
    if(hour >= 6 && hour < 12) WelcomeMsg.innerHTML = "G o o d&nbsp;&nbsp;&nbsp;M o r n i n g";
    else if(hour >= 12 && hour < 18) WelcomeMsg.innerHTML = "G o o d&nbsp;&nbsp;&nbsp;A f t e r n o o n";
    else if(hour >= 18 && hour < 21) WelcomeMsg.innerHTML = "G o o d&nbsp;&nbsp;&nbsp;E v e n i n g";
    else WelcomeMsg.innerHTML = "G o o d&nbsp;&nbsp;&nbsp;N i g h t";
    hour = (hour < 10) ? "0"+hour : hour;
    mins = (mins < 10) ? "0"+mins : mins;    
    secs = (secs < 10) ? "0"+secs : secs;    

    let formattedTime = "<u>&nbsp;"+hour+" : "+mins+"&nbsp;</u><br/><b id='secNumber'>"+secs+" secs.</b>";
    ClockText.innerHTML = formattedTime;

}; 

DateandTime.prototype.getDate = function() {
    this.date = new Date();
    let day = this.date.getDate();
    let weekDay = this.date.getDay();
    let month = this.date.getMonth();
    let year = this.date.getFullYear();

    let spc = (weekDay == 3) ? "&nbsp;" : "&nbsp;&nbsp;";
    let formattedDate = "<u>"+spc+this.weekDays[weekDay]+spc+"</u><br/><b id='dayNumber'>"+day+"</b><br/>"+this.months[month]+", "+year;
    CalendarText.innerHTML = formattedDate;

};
