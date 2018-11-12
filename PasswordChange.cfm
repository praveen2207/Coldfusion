<cftry>   
    <cfquery name = "fetchUserID" datasource = "employee">
        select userID from user where email = "#url.mail#";
    </cfquery>
    <cfloop query = "fetchUserID">
        <cfset local.id = userID>
    </cfloop>
    <cfquery name = "updateUser" datasource = "employee">
        <cfset local.new_pwd = encrypt(#form.cfmPassword#, "kiwi")>
        update user set password = '#local.new_pwd#' where userID = '#local.id#';
    </cfquery>
    <cfquery name = "updateLogin" datasource = "employee">
        update login set password = '#local.new_pwd#' where userID = '#local.id#';
    </cfquery>
    <div class = "success mt-5">
        Password updated successfully!<br><br>
    </div>
    <p><a href = "/EmpLogin/index.cfm">Click here</a> to go to login page<p>
    <cfcatch type = "Database">
        <div class = "error mt-5">
            Error in updating password!
        </div>
    </cfcatch>
</cftry>