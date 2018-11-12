<cfcomponent >
<cffunction name = "loginChecker">
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
			<p class = "success">You logged in successfully.</p>
			<a href="details.cfm?id=#LoginCheck.userID#">Click Here to Continue...</a>
		</div>
		<cfelse>
		<div class = "ml-3">
			<p class = "error">Incorrect Username or password.</p>
		</div>
		</cfif>
	</cfoutput>
	</div>
</cffunction>
</cfcomponent>