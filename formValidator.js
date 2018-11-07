function validate()
{
    if ($("#txtName").val() == "")
        $("#errName").html("Name cannot be blank!");
    else if($("#txtName").val().length<5||($("#txtName").val().length>25))
        $("#errName").html("Name should have between 5 to 25 characters")
    else if (!checkName($("#txtName").val()))
        $("#errName").html("Invalid format!");
    else
        $("#errName").html("");

    if ($("#txtEmail").val() == "")
        $("#errEmail").html("E-mail cannot be blank!");
    else if (!checkEmail($("#txtEmail").val()))
        $("#errEmail").html("Invalid format!");
    else
        $("#errEmail").html("");

    if ($("#txtMobile").val() == "")
        $("#errMobile").html("Mobile number cannot be blank!");
    else if(!checkMobile($("#txtMobile").val()))
        $("#errMobile").html("Mobile number should be 10 digits!");
    else
        $("#errMobile").html("");

    if ($("#txtPassword").val() == "")
        $("#errPassword").html("Password cannot be blank!");
    else if (!checkPassword($("#txtPassword").val()))
        $("#errPassword").html("Password should have atleast 1 special character, 1 uppercase character, 1 number.");
    else
        $("#errPassword").html("");

    if ($("#txtAddress").val() == "")
        $("#errAddress").html("Address cannot be blank!");
    else
        $("#errAddress").html("");

    if (!checkDate($("#cal").val()))
        $("#errDOB").html("Invalid date!");
    else
        $("#errDOB").html("");

    return false;
}

function checkName(name)
{
    var pattern = /^[a-zA-Z| ]+$/;
    return pattern.test(name);
}

function checkEmail(email)
{
    var pattern = /^[a-z|A-Z]+@[a-z|A-Z]+\.[a-z|A-Z]+$/;
    return pattern.test(email);
}

function checkMobile(number)
{
    var pattern = /^[0-9]{1,10}$/;
    return pattern.test(number);
}

function checkPassword(password)
{
    var pattern = /^[a-z]+|[A-Z]+|[0-9]+|[!|@|#|$|%|^|&|*|(|)]+$/;
    return pattern.test(password);
}

function checkDate(date)
{
    todayDate = getTodaysDate();
    if(date<todayDate)
        return true;
    else
        return false;
}

function getTodaysDate()
{
    date = new Date();
    day = date.getDate();
    month = date.getMonth+1;
    year = date.getFullYear();
    if(month<10) month = '0'+month;
    if(day<10) day = '0'+day;
    today = year+"-"+month+"-"+day;
    return today;
}