document.addEventListener('click', function (event) {
    var userNav = document.getElementById('user-nav');
    var headerToggle = document.getElementById('header-toggle');
    var targetElement = event.target;

    if (targetElement !== headerToggle && !userNav.contains(targetElement)) {
        userNav.classList.remove('active');
    }
});

function toggleHeaderInfo() {
    var userNav = document.getElementById('user-nav');
    userNav.classList.toggle('active');
}

function toggleSettingsPopup() {
    var popup = document.getElementById("settingsPopup");
    popup.classList.toggle("show");
}
function exitToggleSettingsPopup() {
    var popup = document.getElementById("settingsPopup");
    popup.classList.remove("show");
}