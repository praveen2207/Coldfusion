<!-- Login form start -->
<div class="mt-5">
    <center>
    <form action="index.cfm" method="POST">
        <div class="form-group">
            <label for="usernameText">Username</label>
            <input type="text" class="form-control" name="Username" placeholder="Enter your username" required>
        </div>
        <br>
        <div class="form-group">
            <label for="passwordText">Password</label>&nbsp;
            <input type="password" class="form-control" required name="Password" placeholder="Password">
        </div>
        <div class="forgot"><a href = "ForgotPass.cfm">Forgot Password?</a></div><br>
        <cfif IsDefined("form.Login")>
            <cfinvoke component = "LoginCheck" method = "loginChecker">    
        </cfif>
        <button type="submit" class="btn-primary" name = "Login">Login</button>
    </form>
    <br>
    <p style="font-size: 20px">
        Not a registered user? <a href="Registration.cfm">Click here</a> to get registered.
    </p>
    </center>
</div>
<!-- Login form end -->