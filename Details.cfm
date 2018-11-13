<cfquery name = "details" datasource = "employee">
    select u.userID, first_name, last_name, username, dob, email, d.dept_name from user u, departments d, employee e where u.userID = #url.id# and u.userID = e.userID and e.deptID = d.deptID;
</cfquery>

<div id = "details">
    <cfoutput>
    <div class="signedIn">
        Welcome #details.first_name#!
    </div>
    </cfoutput>
    <h2>My Profile :</h2>
    <table border = "1">
        <tr><th>UserID</th><th>Firstname</th><th>Lastname</th><th>Username</th><th>Email</th><th>Date of Birth</th><th>Department</th></tr>
        <cfoutput query = "details">
            <tr><td>#details.userID#</td><td>#details.first_name#</td><td>#details.last_name#</td><td>#details.username#</td><td>#details.email#</td><td>#details.dob#</td><td>#details.dept_name#</td></tr>
        </cfoutput>
    </table>
</div><br>
<cfoutput>
    <div>
        <a href = "NewPass.cfm?mode=reset&id=#url.id#"><button class = "btn btn-primary">Reset Password</button></a>
        <cfif url.id eq 1>
            <form action = "showAll.cfm" style = "margin-top:50px">
                <input name = "showAll" type = "submit" id = "showAll" value = "Show All Users" class = "btn-primary">
            </form>
        </cfif>
    </div>
</cfoutput>