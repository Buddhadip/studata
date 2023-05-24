<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Account</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="css/error.css">

<link rel="stylesheet" href="css/createUser.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
   isNormal = (String) request.getAttribute("isNormal");
   String username = (String) session.getAttribute("username");
%>


	
<div class="container">
	<div class ="title">Registration</div>
	<div class="content">
		<form action="newregistration.do" method="POST" class="student-form">
			<input type="hidden" name="studentId" value="1">
  				<div class="user-details">
  					<div class="input-box">
    				<label for="full-name">Full Name:</label>
    				<input type="text" id="full-name" name="fullName" placeholder="Enter your name" required>
  					</div>

					<div class="input-box">
					    <label for="college-name">College Name:</label>
					    <input type="text" id="college-name" name="collegeName" placeholder="Enter your college name" required>
					</div>
	
					<div class="input-box">
					    <label for="university-name">University Name:</label>
					    <input type="text" id="university-name" name="universityName" placeholder="Enter your university name" required>
					</div>
	
					  <div class="input-box">
					    <label for="date-of-birth">Date of Birth:</label>
					    <input type="date" id="date-of-birth" name="dateOfBirth" placeholder="Enter your DOB" required>
					  </div>
	
					  <div class="input-box">
					    <label for="section">Section:</label>
					    <input type="text" id="section" name="section" placeholder="Enter your section" required>
					  </div>
	
					  <div class="input-box">
					    <label for="department">Stream/Department:</label>
					    <input type="text" id="department" name="stream" placeholder="Enter your name of department" required>
					  </div>
					  
					  <div class="input-box">
	    				<label for="student-email">Email:</label>
	    				<input type="email" id="student-email" name="studentEmail" placeholder="Enter your email" required>
	  				  </div>
				</div>
				  <div class="gender-details">
				  	<input type="radio" id="male" name="gender" value="male">
				  	<input type="radio" id="female" name="gender" value="female">
				  	<span class="gender-title">Gender</span>
					  	<div class="category">
					  		<label for="male">
								<span class="male"></span>
								<span class="gender"> Male </span>
							</label>
							<label for="female">
								<span class="female"></span>
								<span class="gender"> Female </span>
							</label>
					  	</div>
				  	</div>

					<div class="button">
					    <input type="submit" value="Register">
					</div>
					</form>
				</div>
			</div>

	
	

<c:if test='${!isNormal.equals("true") && isNormal==null  }'>
	  		 <c:if test='${username!=null  }'>
			  	Hello 	<%= username %>
			</c:if>
			<c:if test='${username==null  }'>
			  	<script>
                showAlert('User with same username found! Login to our portal');
            </script>
			</c:if>
		</c:if>
      	<c:if test='${isNormal.equals("true") || isNormal!=null  }'>
	  		 <script>
            showAlert('Email already exists!');
        </script>
		</c:if>


	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function showAlert(message) {
    alert(message);
}

 $('.button').bind('click', function() {
	 console.log("hide")
 
	$('.modal').addClass('hide');
});
 $(document).ready(function() {
	  // Get the date input field
	
	  // Add an event listener to the form submit event
	  $('form').on('submit', function(event) {
		  var dateInput = $('#date-of-birth');
	    // Get the value of the date input field
	    var inputValue = dateInput.val();
	    // Convert the input value to a Date object
	    var inputDate = new Date(inputValue);
	    // Get the current date
	    var currentDate = new Date();
	    // Compare the input date with the current date
	    if (inputDate > currentDate) {
	      // Show an error message
	      alert('Please enter a date that is not greater than the current date.');
	      // Prevent the form from being submitted
	      event.preventDefault();
	    } else {
	      // Clear the error message
	      $('#date-of-birth').text('');
	    }
	  });
	});
</script>
<!-- 	<footer>
    <div  > <h2>InterraIT Student Portal</h2></div>
    <div id="footer-text" >We are a Silicon Valley based IT services organization that provides cutting-edge business and technology solutions, as well as immersive digital experiences to our clients around the world.</div>
    <div id="socials">
    <div><span class="material-symbols-outlined"> EMAIL</span></div>
        <div><span class="material-symbols-outlined">PHONE</span></div>
        <div><span class="material-symbols-outlined"> CONTACT PAGE</span></div>

    </div>
    <div>All rights reserves @2023</div> -->
</footer>
</body>
</html>