<cfquery name = "details" datasource = "employee">
    select u.userID, first_name, last_name, username, dob, email, d.dept_name from user u, departments d, employee e where u.userID = e.userID and e.deptID = d.deptID;
</cfquery>

<div id = "details" style = "margin-top:40px;margin-left:30px">
    <h2 style="color:steelblue">User details:</h2>
    <table border = "1">
        <tr><th>UserID</th><th>Firstname</th><th>Lastname</th><th>Username</th><th>Email</th><th>Date of Birth</th><th>Department</th></tr>
        <cfoutput query = "details">
            <tr><td>#details.userID#</td><td>#details.first_name#</td><td>#details.last_name#</td><td>#details.username#</td><td>#details.email#</td><td>#details.dob#</td><td>#details.dept_name#</td></tr>
        </cfoutput>
    </table>
</div>
