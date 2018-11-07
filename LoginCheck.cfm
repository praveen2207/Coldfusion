<cfquery name="LoginCheck" datasource="employee">
	SELECT userID,username,password FROM login WHERE Username = '#form.Username#';
</cfquery>
<cfloop query = "LoginCheck">
	<cfset local.pwd = Decrypt(password, "kiwi")>
</cfloop>
<div class = "row mt-5" style = "font-size:20px">
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