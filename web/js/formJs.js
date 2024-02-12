function showPassLog() {
    var x = document.getElementById("logPass");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function showPassReg() {
    var x = document.getElementById("regPass");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function successReg() {
    Swal.fire({
        icon: 'success',
        title: 'Great!',
        text: 'You have registered successfully!',
        footer: '<a href="">Why do I have this issue?</a>'
    })
}

function successLog() {
    Swal.fire({
        icon: 'success',
        title: 'Great!',
        text: 'You have logged in successfully!',
        footer: '<a href="">Why do I have this issue?</a>'
    })
}


