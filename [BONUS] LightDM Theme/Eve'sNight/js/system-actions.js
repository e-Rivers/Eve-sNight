document.getElementById("SleepField").addEventListener("dblclick", function(event) {
    lightdm.suspend();
});

document.getElementById("RebootField").addEventListener("dblclick", function(event) {
    lightdm.restart();
});

document.getElementById("ShutdownField").addEventListener("dblclick", function(event) {
    lightdm.shutdown();
});

