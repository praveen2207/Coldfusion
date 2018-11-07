<!-- Registration form start -->
    <div class="mt-3 ml-5">
        <h1 style="color: steelblue">Enter your details:</h1>
        <form action="Register.cfm" method="POST" id = "registrationForm">
            <div class="form-group">
                <label for="firstNameText">First Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" class="form-control" name="firstNameText" id = "firstNameText" placeholder="Enter Firstname" required = "yes">
                <small id="firstNameError" class="form-text"></small>
            </div><br>
            <div class="form-group">
                <label for="lastNameText">Last Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" class="form-control" name="lastNameText" id = "lastNameText" placeholder="Enter Lastname" required = "yes">
                <small id="lastNameError" class="form-text"></small>
            </div><br>
            <div class="form-group">
                <label for="usernameText">Username</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" class="form-control" name="usernameText" id = "usernameText" placeholder="Enter your username" required = "yes">
                <small id="usernameError" class="form-text"></small>
            </div><br>
            <div class="form-group">
                <label for="usernameText">Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="email" class="form-control" name="emailText" id = "emailText" placeholder="Enter your email id" required = "yes">
                <small id="emailHelp" class="form-text" style = "color:black">(abc@example.com)</small>
            </div><br>
            <div class="form-group">
                <label for="department">Department</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <select class="custom-select" name = "department" id = "department">
                    <option selected>--- Select department ---</option>
                    <option value="transport">Transport</option>
                    <option value="security">Security</option>
                    <option value="development">Development</option>
                    <option value="admin">Admin</option>
                </select>
            </div><br>
            <div class="form-group">
                <label for="dobText">Date of Birth</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" class="form-control" name="dobText" id = "dobText" placeholder = "Select Date of Birth" data-role = "date">
            </div><br>
            <div class="form-group">
                <label for="pwdText">Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="password" class="form-control" name="pwdText" id = "pwdText" placeholder="Enter password" required = "yes">
                <small id="pwdError" class="form-text"></small>
            </div><br>
            <div class="form-group">
                <label for="cfmpwdText">Confirm Password</label>
                <input type="password" class="form-control" name="cfmpwdText" id = "cfmpwdText" placeholder="Enter password again" required = "yes">
                <small id="cfmpwdError" class="form-text"></small>
            </div><br>
            <input type="submit" class="btn-primary" value = "Sign Up" id = "submit" name = "submit" onclick = "return validate()">
            <input type="reset" class="btn-primary ml-5" value = "Clear" name = "clear" onclick = "return clearError()">
        </form>
    </div>
<!-- Registration form end -->