<cfoutput>

<cfif IsDefined("form.Submit")>
    <cfquery name = "updateUser" datasource = "employee">
        UPDATE user
        SET first_name = "#form.fname#",
            last_name = "#form.lname#",
            username = "#form.username#",
            email = "#form.email#",
            dob = "#form.dob#"
        WHERE userID = "#url.id#";
    </cfquery>
    <cfquery name = "updateEmployee" datasource = "employee">
        UPDATE employee
        SET deptID = (SELECT deptID FROM departments WHERE dept_name = "#form.dept#")
        WHERE userID = "#url.id#";
    </cfquery>
    <cfquery name = "updateLogin" datasource = "employee">
        UPDATE login
        SET username = "#form.username#"
        WHERE userID = "#url.id#";
    </cfquery>
    <p class = "success" style = "font-size:15px">Profile updated successfully</p>
</cfif>

<cfquery name = "details" datasource = "employee">
    select u.userID, first_name, last_name, username, dob, email, d.dept_name from user u, departments d, employee e where u.userID = '#url.id#' and u.userID = e.userID and e.deptID = d.deptID;
</cfquery>

<div id = "details">
    <div class="signedIn">
        Welcome #details.first_name#!
    </div>
    <h2>My Profile :</h2>
    <cfif url.operation eq "view">
        <table border = "1">
        <tr><th>UserID</th><th>Firstname</th><th>Lastname</th><th>Username</th><th>Email</th><th>Date of Birth</th><th>Department</th><th>Edit</th></tr>
            <tr><td>#details.userID#</td><td>#details.first_name#</td><td>#details.last_name#</td><td>#details.username#</td><td>#details.email#</td><td>#details.dob#</td><td>#details.dept_name#</td>
                <td><a href = "Details.cfm?id=#url.id#&operation=edit">Edit</a></td></tr>
        </table>
    <cfelse>
        <form action = "Details.cfm?id=#url.id#&operation=view" method = "POST">
        <table border = "1">
        <tr><th>UserID</th><th>Firstname</th><th>Lastname</th><th>Username</th><th>Email</th><th>Date of Birth</th><th>Department</th><th>Submit</th></tr>
            <tr>
                <td>#details.userID#</td>
                <td><input type = "text" name = "fname" id = "fname" value = "#details.first_name#"></td>
                <td><input type = "text" name = "lname" id = "lname" value = "#details.last_name#"></td>
                <td><input type = "text" name = "username" id = "username" value = "#details.username#"></td>
                <td><input type = "text" name = "email" id = "email" value = "#details.email#"></td>
                <td><input type = "text" name = "dob" id = "dob" value = "#details.dob#"></td>
                <td><input type = "text" name = "dept" id = "dept" value = "#details.dept_name#"></td>
                <td><input type = "submit" name = "Submit" value = "Submit" class = "btn-primary"></td>
            </tr>
        </table>
        </form>
    </cfif>
</div><br>
    <div>
        <a href = "NewPass.cfm?mode=mail&id=#url.id#"><button class = "btn btn-primary">Reset Password</button></a>
        <cfif url.id eq 1>
            <form action = "showAll.cfm" style = "margin-top:50px">
                <input name = "showAll" type = "submit" id = "showAll" value = "Show All Users" class = "btn-primary">
            </form>
        </cfif>
    </div>
</cfoutput>