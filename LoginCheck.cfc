<cfcomponent >
<cffunction name = "loginChecker">
	<cfquery name="LoginCheck" datasource="employee">
		SELECT userID,username,password FROM login WHERE Username = '#form.Username#';
	</cfquery>
	<cfloop query = "LoginCheck">
		<cfset local.pwd = Decrypt(password, "kiwi")>
	</cfloop>
	<div class = "row">
	<cfoutput>
		<cfif LoginCheck.Recordcount GT 0 and local.pwd eq #form.Password#>
			<cflocation url = "Details.cfm?id=#LoginCheck.userID#">
		<cfelse>
			<p class = "error" style = "font-size:15px;">Incorrect Username or password!</p>
		</cfif>
	</cfoutput>
	</div>
</cffunction>
</cfcomponent>