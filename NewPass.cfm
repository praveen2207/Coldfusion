<cfif IsDefined("form.Submit")>
    <cfquery name = "fetchEmail" datasource = "employee">
        select * from user where email = '#form.forgotEmailText#';
    </cfquery>
    <cfif fetchEmail.recordCount gt 0>
        <cfmail to = "#form.forgotEmailText#" from = "praveentyk@gmail.com" subject = "Password Reset" type = "html">
            Hello! This is your temporary password : password
        <cfoutput>
        <br/><br/>
        <a href="http://localhost:8500/EmpLogin/NewPass.cfm">Click here</a> to reset your password.
        </cfoutput>
        </cfmail>
        <cfoutput>
        <div class = "newPassForm mt-5 ml-5">
            <form action = "PasswordChange.cfm?mail=#form.forgotEmailText#" method = "post" id = "passwordChangeForm">
                <div class="form-group">
                    <label for="forgotEmailText">Enter your email id</label>
                    <input type="email" class="form-control" name="forgotEmailText" placeholder="Enter your email" required value = #form.forgotEmailText#>
                </div><br>
                <div class="form-group">
                    <label for="newPassword">New Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="password" class="form-control" required name="newPassword" id="newPassword" placeholder="Password">
                    <small id="forgotpwdError" class="form-text"></small>
                </div><br>
                <div class="form-group">
                    <label for="cfmPassword">Confirm Password</label>&nbsp;
                    <input type="password" class="form-control" required name="cfmPassword" id="cfmPassword" placeholder="Password">
                    <small id="forgotcfmError" class="form-text"></small>
                </div><br>
                <button type="submit" class="btn btn-primary" name = "Submit" onclick = "return validateForgot()">Update</button>
            </form>
        </div>
        </cfoutput>
    <cfelse>
        <div class = "error mt-5">
            User not found!!
        </div>
    </cfif>
<cfelse>
    <cfoutput>
        <div class = "newPassForm mt-5 ml-5">
            <form action = "PasswordChange.cfm" method = "post">
                <div class="form-group">
                    <label for="forgotEmailText">Enter your email id</label>
                    <input type="email" class="form-control" name="forgotEmailText" placeholder="Enter your email" required>
                </div><br>
                <div class="form-group">
                    <label for="newPassword">New Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="password" class="form-control" required name="newPassword" id = "newPassword" placeholder="Password">
                    <small id="forgotpwdError" class="form-text"></small>
                </div><br>
                <div class="form-group">
                    <label for="cfmPassword">Confirm Password</label>&nbsp;
                    <input type="password" class="form-control" required name="cfmPassword" id = "cfmPassword" placeholder="Password">
                    <small id="forgotcfmError" class="form-text"></small>
                </div><br>
                <button type="submit" class="btn btn-primary" name = "Submit" onclick = "return validateForgot()">Update</button>
            </form>
        </div>
    </cfoutput>
</cfif>