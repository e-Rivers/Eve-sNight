var currentScreen = 0;

document.addEventListener("keydown", function() {
    if(event.which == 27) {
        currentScreen++;
        if(currentScreen%2 != 0) {
            document.getElementById("WelcomeMsg").style.opacity = 0;
            document.getElementById("BackgroundImage").style.filter = "blur(10px)";
            document.getElementById("LoginScreen").style.opacity = 1;
        } else {
            document.getElementById("WelcomeMsg").style.opacity = 1;
            document.getElementById("BackgroundImage").style.filter = "blur(0px)";
            document.getElementById("LoginScreen").style.opacity = 0;
       }
    }
})
