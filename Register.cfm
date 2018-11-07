<cftry>
    <cfquery name = "SaveUser" datasource = "employee">
        <cfset local.enc = Encrypt(#form.cfmpwdText#, "kiwi")>
        insert into user(first_name,last_name,username,dob,email,password) values('#form.firstNameText#','#form.lastNameText#','#form.usernameText#','#form.dobText#','#form.emailText#','#local.enc#')
    </cfquery>
    <cfquery name = "SaveEmployee" datasource = "employee">
        insert into employee(userID,deptID) values((select userID from user where username = '#form.usernameText#'),(select deptID from departments where dept_name = '#form.department#'))
    </cfquery>
    <cfquery name = "SaveLogin" datasource = "employee">
        insert into login values((select userID from user where username='#form.usernameText#'),'#form.usernameText#',(select password from user where username = '#form.usernameText#'))
    </cfquery>
    <div class = "mt-5">
        <p style = "color:green;">Data has been saved!</p><br/>
        <a href = "index.cfm">Click here</a> to go to login page.
        <cfmail to="#form.emailText#" from="praveentyk@gmail.com" subject="Successful registration">
            Congratulations! You have been successfully registered!
        </cfmail>
    </div>
    <cfcatch type = "Database">
        <cfquery name = "getUserID" datasource = "employee" result = "inc">
            select userID from user;
        </cfquery>
        <cfquery name = "ResetUserID" datasource = "employee">
            alter table user auto_increment = #getUserID.recordcount#;
        </cfquery>
        <div class = "mt-5">
            <p style = "color:tomato;">Error in saving data!</p>
            <a href = "Registration.cfm">Click here</a> to go back to registration page.
        </div>
    </cfcatch>
</cftry>