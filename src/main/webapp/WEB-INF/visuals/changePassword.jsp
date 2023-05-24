<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="css/error.css">
   <!--  <link rel="stylesheet" href="css/footer.css"> -->
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div id="main">
        <div id="header">
              <img src="css/logo_opt.png" alt="INTERRAIT">
    <div>
        <c:if test="${sessionScope.loggedInUser == null}">
            <a href="login.do" class="head-button text">LOGIN</a>
            <a href="NewRegisterPage.do" class="head-button text">CREATE NEW USER</a>
        </c:if>
    </div>
</div>
        <div id="user-text">
            <c:if test="${not empty isNormal && isNormal == 'false' }">
                <span style="color: red;">Error, Invalid username or password</span>
            </c:if>
        </div>
        <div id="login-body">
            <div id="logImg">
                <img src="public/images/office.png" alt="">
                <div id="logForm">
                    <h1>Change Password</h1>
                    <form action="updatePassword.do" method="post" id="loginform" onsubmit="clearFormFields('loginform')">
                        <label>Old Password:</label>
                        <input type="password" name="oldpassword" placeholder="Old Password" /><br/>
                        <label>New Password:</label>
                        <input type="password" name="newpassword" placeholder="New Password" /><br/>
                        <input type="submit" value="Update" />
                    </form>
                    <br>
                    <a href="login.do">Login</a>
                    <a href="">Forgot your password?</a>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div><h2>InterraIT student Portal</h2></div>
        <div id="footer-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nobis molestiae exercitationem dolor dolore voluptate tempore corrupti eligendi modi consequuntur quidem adipisci, deleniti sapiente? Vel inventore quo eos unde vitae.</div>
        <div id="socials">
            <div><span class="material-symbols-outlined"> mail</span></div>
            <div><span class="material-symbols-outlined">phone_in_talk</span></div>
            <div><span class="material-symbols-outlined"> sms</span></div>
            <div><span class="material-symbols-outlined">contact_page</span></div>
        </div>
        <div>All rights reserves @2023</div>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>