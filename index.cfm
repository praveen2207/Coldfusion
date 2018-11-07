<!-- Login form start -->
<div class="mt-5">
    <center>
    <form action="index.cfm" method="POST">
        <div class="form-group" style="font-size: 20px">
            <label for="usernameText">Username</label>
            <input type="text" class="form-control" name="Username" placeholder="Enter your username" required>
            <small id="usernameError" class="form-text text-muted" style="color: tomato"></small>
        </div>
        <br>
        <div class="form-group" style="font-size: 20px">
            <label for="passwordText">Password</label>&nbsp;
            <input type="password" class="form-control" required name="Password" placeholder="Password">
        </div><br>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
    <br><br>
    <p style="font-size: 20px">
        Not a registered user? <a href="Registration.cfm">Click here</a> to get registered.
    </p>
    </center>
</div>
<!-- Login form end -->

<cfquery name="LoginCheck" datasource="employee">
	SELECT userID,username,password FROM login WHERE Username = '#form.Username#';
</cfquery>
<cfloop query = "LoginCheck">
	<cfset local.pwd = Decrypt(password, "kiwi")>
</cfloop>

<cfoutput>
	<cfif LoginCheck.Recordcount GT 0 and local.pwd eq #form.Password#>
	<div class = "ml-3">
		You logged in successfully.<br/>
		<a href="details.cfm?id=#LoginCheck.userID#">Click Here to Continue...</a>
	</div>
	<cfelse>
	<div class = "ml-3">
		Incorrect Username or password.<br/> 
		<a href="index.cfm">Click Here to go to login Page.</a><br/><br/>
		New user? <a href="Registration.cfm">Click here</a> to get registered.
	</div>
	</cfif>
</cfoutput>
</div>