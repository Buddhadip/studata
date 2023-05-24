<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
<!-- <link rel="stylesheet" href="views/public/styles/error.css">
<link rel="stylesheet" href="views/public/styles/login.css">
<link rel="stylesheet" href="views/public/styles/footer.css"> -->
<!-- <link rel="stylesheet" href="public/styles/header.css"> -->
 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>


@media screen{
      *,
*:before,
*:after{
    padding: 0;
    margin: 0;
    box-sizing: border-box;}
}
body{
background-color:#f8ecda;
}
 .background{
    width: 430px;
    height: 520px;
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 50%;
}
.background .shape{
    height: 200px;
    width: 200px;
    position: absolute;
    border-radius: 50%;
}
.shape:first-child{
    background: linear-gradient(
        #1845ad,
        #23a2f6
    );
    left: -80px;
    top: -80px;
}
.shape:last-child{
    background: linear-gradient(
        to right,
        #ff512f,
        #f09819
    );
    right: -30px;
    bottom: -80px;
}
form{
    height: 520px;
    width: 400px;
    background-color:#2c3131 ;
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    border-radius: 10px;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255,255,255,0.1);
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 50px 35px;
}
form *{
    font-family: 'Poppins',sans-serif;
    color: #fff;
    letter-spacing: 0.5px;
    outline: none;
    border: none;
}
form h3{
    font-size: 32px;
    font-weight: 500;
    line-height: 42px;
    text-align: center;
}

.pass{
	text-align:left;
	margin:10px 0;
}
.pass a{
	color: white;
	text-decoration:none;
	font-family:''Poppins', sans-serif;
}
.pass:hover a{
	text-decoration:underline;
}

.signup{
	font-size:12px;
	color:white;
	font-family:''Poppins', sans-serif;
}
.signup a{
	color:#3498db;
	text-decoration:none;
}
.signup a:hover{
	text-decoration:underline;
}
label{
    display: block;
    margin-top: 30px;
    font-size: 16px;
    font-weight: 500;
}
input{
    display: block;
    height: 50px;
    width: 100%;
    background-color: rgba(255,255,255,0.07);
    border-radius: 3px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: 300;
}

::placeholder{
    color: #e5e5e5;
}
input[type="submit"]{
    margin-top: 50px;
    width: 100%;
    background-color: #ffffff;
    color: #080710;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}
.social{
  margin-top: 30px;
  display: flex;
}
.social div{
  background: red;
  width: 150px;
  border-radius: 3px;
  padding: 5px 10px 10px 5px;
  background-color: rgba(255,255,255,0.27);
  color: #eaf0fb;
  text-align: center;
}
.social div:hover{
  background-color: rgba(255,255,255,0.47);
}
.social .fb{
  margin-left: 25px;
}
.social i{
  margin-right: 4px;
}
.modal.hide {
    display: none;
}


@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300);
.frame {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

.modal {
  background-color: #fff;
  padding: 20px;
  text-align: center;
  border-radius: 5px;
}

.hide {
  display: none;
}

.title {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 10px;
}

.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #333;
  color: #fff;
  cursor: pointer;
  border-radius: 5px;
}

.button:hover {
  background-color: #555;
}
</style>
</head>
<body>
<!-- <header>
  <img src="public/logo_opt.png" alt="INTERRAIT">
</header> -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   // Retrieve a session attribute
   String isNormal="true";
   String message = (String) request.getAttribute("message");
   Object isNormalAttribute = request.getAttribute("isNormal");
   if (isNormalAttribute != null) {
     isNormal = isNormalAttribute.toString();
   };
   String loggedInUser = (String) session.getAttribute("loggedInUser");

%>
    
		<form action="login.do" method="post" id="loginform" onsubmit="clearFormFields('loginform')">
		<h3 style="text-align:center;"> Login </h3>
		    <label>Username:</label>
		    <input type="text" placeholder="Email" name="username" /><br/>
		    <label>Password:</label>
		    <input type="password" placeholder="Password" name="password" />
		    <div class="pass">
		    	<a href="forgotPassword.do">Forgot Password?</a>
		    </div>
		    <input type="submit" value="Login" />
		    <div class="signup">
		    Don't have account?
		    <a href="NewRegisterPage.do">Signup Now</a>
		    </div>
		</form>

<c:if test='${!isNormal.equals("true")}'>
   <div class="frame">
	  <div class="modal">
	    <img src="public/ohno.png" width="44" height="38" />
			<span class="title">ERROR!!!</span>
			<p><%= message %></p>
			<div class="button">Go Back</div>
	  </div>
	</div>
</c:if>

<script type="text/javascript">
$('.button').on('click', function() {
    console.log("hide");
    $('.modal').addClass('hide');
    $('.frame').addClass('hide');
});
</script>


<!-- <footer>
    <div  > <h2>InterraIT Student Portal</h2></div>
    <div id="footer-text" >We are a Silicon Valley based IT services organization that provides cutting-edge business and technology solutions, as well as immersive digital experiences to our clients around the world.</div>
    <div id="socials">
       <div><span class="material-symbols-outlined"> EMAIL</span></div>
        <div><span class="material-symbols-outlined">PHONE</span></div>
        <div><span class="material-symbols-outlined"> CONTACT PAGE</span></div>
    </div>
    <div>All rights reserves @2023</div>
</footer> -->
</body>
</html>