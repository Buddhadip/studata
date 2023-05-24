<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="public/styles/ForgotPass.css">
<title>Forgot Password</title>
</head>
<body>
    <h1>Forgot Password</h1>
    
    <%-- Display any error messages --%>
    <p>${errorMessage}</p>
    
    <form action="updatePass.do" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br><br>
        <input type="submit" value="Submit">
    </form>
    
</body>
</html>