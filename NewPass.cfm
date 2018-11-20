<cfif IsDefined("form.Submit")>
    <cfif url.mode eq "forgot">
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
            User not found!!<br><br>
            <p><a href = "ForgotPass.cfm">Back</a><p>
        </div>
    </cfif>
    </cfif>
    
    <cfif url.mode eq "mail">
    <cfquery name = "fetchUsername" datasource = "employee">
        select * from user where userID = "#url.id#";
    </cfquery>
    <cfinvoke component = "TokenGenerator" method = "generate" returnVariable = "variables.myToken">
    <cfmail to = "#fetchUsername.email#" from = "praveentyk@gmail.com" subject = "Password Reset" type = "html">
        Dear #fetchUsername.first_name#,
        <cfoutput>
        <br/>         
        <a href = "http://localhost:8500/EmpLogin/NewPass.cfm?mode=reset&id=#url.id#&token=#variables.myToken#">Click here</a> to reset your password.
        </cfoutput>
    </cfmail>
    <cfoutput>
    <p class = "ml-5">
        Dear #fetchUsername.first_name#, <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a mail has been sent to your email id "<span>#fetchUsername.email#</span>" regarding password reset.
        <br><br>
        <a href = "index.cfm">Click here</a> to go back to the login page.
    </p>
    </cfoutput>
    </cfif>
</cfif>

<cfif url.mode eq "reset">
    <cfinvoke component = "TokenAuthenticator" method = "authenticator" returnVariable = "variables.validity">
    <cfset variables.validValues = variables.validity.split(":")>
    <cfif validValues[2] eq 'true'>
        <cfquery name = "fetchEmail" datasource = "employee">
        select email from user where first_name = "#variables.validValues[1]#";
        </cfquery>
        <cfloop query = "fetchEmail">
            <cfset Variables.mail = email>
        </cfloop>
        <cfoutput>
            <div class = "newPassForm mt-5 ml-5">
                <form action = "PasswordChange.cfm?mail=#Variables.mail#" method = "post" id = "passwordChangeForm">
                    <div class="form-group">
                        <label for="forgotEmailText">Enter your email id</label>
                        <input type="email" class="form-control" name="forgotEmailText" placeholder="Enter your email" required value = "#Variables.mail#">
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
                    <button type="submit" class="btn btn-primary" name = "Submit" onclick = "return validateReset()">Update</button>
                </form>
            </div>
        </cfoutput>
    <cfelse>
        <cfoutput>
            <h2>Token Invalid! Please generate the token again.</h2>
            <br>
            <a href = "index.cfm">Go back</a> to login page.
        </cfoutput>
    </cfif>
</cfif>