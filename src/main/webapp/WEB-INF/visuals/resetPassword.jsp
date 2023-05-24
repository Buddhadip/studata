<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            z-index: 9999;
            }
    form {
        width: 300px;
        margin: 0 auto;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>

      <script>
        function showPopup(message) {
            var popup = document.getElementById('popup');
            var popupMessage = document.getElementById('popupMessage');
            popupMessage.innerText = message;
            popup.style.display = 'block';
        }
    </script>
</head>
<body>
<h1>Reset Password</h1>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%-- Display any error messages if necessary --%>
   <c:if test="${not empty errorMessage}">
        <script>
            showPopup('${errorMessage}');
        </script>
    </c:if>
    <%-- Password reset form --%>
    <form action="resetPassword.do" method="post">
        <label for="otp">OTP:</label>
        <input type="text" id="otp" name="otp" required>
        <br><br>
        
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <br><br>
        
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="newPassword" required>
        <br><br>
        
        <input type="submit" value="Reset Password">
    </form>
    
    <div id="popup" class="popup">
        <p id="popupMessage"></p>
        <button onclick="document.getElementById('popup').style.display = 'none';">Close</button>
    </div>
</body>
</html>