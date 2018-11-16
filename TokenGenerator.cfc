<cfcomponent>
    <cffunction name = "generate" returnType = "any" access = "public" description = "passwordResetTokenGeneration">
        <cfquery name = "fetchUsername" datasource = "employee">
            select username from user where userID = "#url.id#";
        </cfquery>
        <cfloop query = "fetchUsername">
            <cfset user = username>
        </cfloop>
        <cfset today = Now()>
        <cfset myKey = GenerateSecretKey("AES")>
        <cfset token = #user#&"/"&#today#>
        <cfset hashedToken = Encrypt(token, myKey, 'AES', 'Base64')>
        <cfreturn hashedToken&"/key/"&myKey>
    </cffunction>
</cfcomponent>