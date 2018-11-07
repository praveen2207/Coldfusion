firstname = document.getElementById("firstNameText");
firstnameError = document.getElementById("firstNameError");
lastname = document.getElementById("lastNameText");
lastnameError = document.getElementById("lastNameError");
username = document.getElementById("usernameText");
usernameError = document.getElementById("usernameError");
pass = document.getElementById("pwdText");
passError = document.getElementById("pwdError");
cfmpass = document.getElementById("cfmpwdText");
cfmpassError = document.getElementById("cfmpwdError");

function checkName(name) {
    var pattern = /^[a-zA-Z]+$/;
    return pattern.test(name);
}

function checkPassword(pwd) {
    var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[!@#$%^&*?])[A-Za-z\d!@#$%^&*?]{8,}$/;
    return pattern.test(pwd);
}

function validate() {
    if (firstname.value == ""){
        firstnameError.innerHTML = "Firstname cannot be blank!";
    }
    else if (!checkName(firstname.value)) {
        firstnameError.innerHTML = "Invalid format for Firstname!";
        firstname.focus();
    }
    else
        firstnameError.innerHTML = "";

    if (lastname.value == "")
        lastnameError.innerHTML = "Lastname cannot be blank!";
    else if (!checkName(lastname.value)) {
        lastnameError.innerHTML = "Invalid format for Lastname!";
        lastname.focus();
    }
    else
        lastnameError.innerHTML = "";

    if (username.value == "")
        usernameError.innerHTML = "Username cannot be blank!";
    else if (!checkName(lastname.value)) {
        usernameError.innerHTML = "Invalid format for Username!";
        username.focus();
    }
    else
        usernameError.innerHTML = "";

    if (pass.value == "")
        passError.innerHTML = "Password cannot be blank!";
    else if (!checkPassword(pass.value)) {
        passError.innerHTML = "Password should contain atleast one uppercase, one numeric and one special character";
    }
    else
        passError.innerHTML = "";

    if(cfmpass.value == "")
        cfmpassError.innerHTML = "Enter the password again!";    
    else if(pass.value != cfmpass.value){
        cfmpassError.innerHTML = "Passwords don't match!";
        return false;
    }
    else
        cfmpassError.innerHTML = "Passwords match!"
}

function clearError(){
    firstnameError.innerHTML = "";
    lastnameError.innerHTML = "";
    usernameError.innerHTML = "";
    passError.innerHTML = "";
    cfmpassError.innerHTML = "";
}