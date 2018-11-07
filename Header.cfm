<html>
    <head>
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width = device-width, initial-scale = 1">
        <title>Employee Login</title>
        <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css">
        <link href = "myStyle.css" rel = "stylesheet"/>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Navbar Start -->
            <div class="row">
                <nav class="navbar navbar-dark bg-dark col-12">
                    <a class="navbar-brand" href="index.cfm">Employee Login</a>
                    <cfif not (cgi.script_name eq '/EmpLogin/index.cfm' or cgi.script_name eq '/EmpLogin/LoginCheck.cfm' or cgi.script_name eq '/EmpLogin/Registration.cfm' or cgi.script_name eq '/EmpLogin/Register.cfm')>
                        <a class="nav-item" style = "color:white" href="index.cfm">Logout</a>
                    </cfif>
                </nav>
            </div>
            <!-- Navbar End -->