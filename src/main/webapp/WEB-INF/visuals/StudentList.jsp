<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudentPortal</title>
<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="css/footer.css">
<!-- <link rel="stylesheet" href="css/header.css"> -->

</head>
<header>
  <img src="public/logo_opt.png" alt="INTERRAIT">
</header>

<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   // Retrieve a session attribute
      String loggedInUser = (String) session.getAttribute("loggedInUser");
%>

<p>Welcome, <%= loggedInUser %>!</p>


<form action="logout.do" method="post">
  <button type="submit">Logout</button>
</form>
<a href="NewRegisterPage.do">Create a new user</a>
<c:if test="${not empty loggedInUser}">
        <a href="changePassword.do" class="head-button text">Change Password</a>
    </c:if>
<h1>Student List will be shown here</h1>
<div style="overflow: auto; max-height: 300px;">
<table>
  <tr>
    <th>Id</th>
    <th>Full Name</th>
    <th>College Name</th>
    <th>University Name</th>
    <th>Date of Birth</th>
    <th>Section</th>
    <th>Stream</th>
    <th>Gender</th>
    <th>Student Email</th>
    <th>Delete</th>
    <th>Update</th>
    
  </tr>
  <c:forEach var="student" items="${studentList}">
    <tr id="${student.studentId}-row"  > 
    	<td>${student.studentId}</td>    
      <td>${student.fullName}</td>
      <td>${student.collegeName}</td>
      <td>${student.universityName}</td>
      <td>${student.dateOfBirth}</td>
      <td>${student.section}</td>
      <td>${student.stream}</td>
      <td id="${student.studentId}gender-row" >${student.gender}</td>
      <td>${student.studentEmail}</td>
      <td>
      	<button onclick="deleteStudent('${student.studentId}')"   >Delete</button>
      </td>
      <td>
      	<button onclick="editStudent('${student.studentId}')"   >Edit</button>
      </td>
    </tr>
  	
  	<tr  class="hidden" id="${student.studentId}-form"  >
  	 
  	 <td> <input type="text" id="${student.studentId}student-id" name="fullName" value= " ${student.studentId}"  ></td>
      <td> <input type="text" id="${student.studentId}full-name" name="fullName" value= "${student.fullName}"  ></td>
      <td><input type="text" id="${student.studentId}college-name" name="collegeName" value="${student.collegeName}" ></td>
      <td><input type="text" id="${student.studentId}university-name" name="universityName" value="${student.universityName}" ></td>
      <td><input type="date" id="${student.studentId}date-of-birth" name="dateOfBirth" value="${student.dateOfBirth}" ></td>
      <td><input type="text" id="${student.studentId}section" name="section" value="${student.section}" ></td>
      <td> <input type="text" id="${student.studentId}department" name="stream" value="${student.stream}" ></td>
      <td class="radio-button" >
      	  <input  type="radio"   id="male" name="${student.studentId}gender" value="male">
		  <label for="male">male</label>
		  <input  type="radio"   id="female" name="${student.studentId}gender" value="female">
		  <label for="female">female</label>
	  </td>
      <td id="${student.studentId}email">${student.studentEmail}</td>
      <td>
      	 <button onclick="deleteStudent('${student.studentId}')"   ><span class="material-symbols-outlined">delete</span></button>
      </td>
      <td><button onclick="updateStudent('${student.studentId}')"   ><span class="material-symbols-outlined">update</span></button>
     
      	
      </td>
  
    </tr>
    
  
  </c:forEach>
</table>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

var isUpdateOn=false;
function deleteStudent(id){
	console.log(id)
	 $.ajax({
	    type: "GET",
	    url: "deleteStudent.do",
	    data: { id:id },
	    success: function(response) {
	      // handle success response
	      //location.reload();
	      document.getElementById(id+"-row").style.display="none";
	      document.getElementById(id+"-form").style.display="none";
	      console.log("Student deleted successfully.");
	      location.reload();
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      // handle error response
	      alert("Error deleting student:");
	    }
	  });	
}

function editStudent(id){
	if(!isUpdateOn){
		isUpdateOn=true;
		console.log("#"+id+"-row")
		document.getElementById(id+"-row").style.display="none";
		document.getElementById(id+"-form").style.display="table-row";
		gender=document.getElementById(id+"gender-row").innerHTML;
		console.log(gender)
		var genderRadio = document.querySelector('input[name="'+id+'gender"][value="' + gender + '"]');
		console.log(genderRadio)
		if (genderRadio) {
		  genderRadio.checked = true;
		}
	}else{
		alert("Update one row at one time")
	}
	
}
function updateStudent(id){
	
		isUpdateOn=false;
		
		var studentData=getData(id)
		console.log(studentData)
		console.log("date out",validate_date(studentData.studentId))
		if(!validate_date(studentData.studentId)){
			
			alert("Input date can't be greater than current date")
			return "failure";
		}
		var isOk=validate(studentData)
		
		
		if(!isOk) {
			alert("Field should not be empty")
			return "failure";
		}
		console.log(studentData)
		
		$.ajax({
	    type: "POST",
	    url: "updateStudent.do",
	    data: studentData,
	    success: function(response) {
	      // handle success response
		document.getElementById(id+"-row").style.display="table-row";
		document.getElementById(id+"-form").style.display="none";
	      location.reload();
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      // handle error response
	      alert("Error updating student:");
	    }
	  });	
		return "success";
		
		
		
		
		
	
}

function getData(id){
	var student = {};
	console.log(id)
	
	// get input fields using their name attribute and assign their values to object properties
	student.studentId=id;
	student.fullName = document.getElementById(id+"full-name").value;
	student.collegeName = document.getElementById(id+"college-name").value;
	student.universityName = document.getElementById(id+"university-name").value;
	student.dateOfBirth = document.getElementById(id+"date-of-birth").value;
	student.section = document.getElementById(id+"section").value;
	student.stream = document.getElementById(id+"department").value;
	student.gender = document.querySelector('input[name="'+id+'gender"]:checked').value;
	student.studentEmail = document.getElementById(id+"email").innerHTML;
	
	
	return student;
	
}
function validate(studentList){
	
	for (let key in studentList) {
		 if(studentList[key].length==0){
			 return false;
		 }
	}
	return true;
}

function  validate_date(id) {
	  // Get the date input field
	  var dateInput = $("#"+id+"date-of-birth");
	  // Add an event listener to the date input field
	 
	    // Get the value of the date input field
	    var inputValue = dateInput.val();
	    // Convert the input value to a Date object
	    var inputDate = new Date(inputValue);
	    // Get the current date
	    var currentDate = new Date();
	    // Compare the input date with the current date
	    console.log(inputDate , currentDate,inputDate > currentDate)
	    if (inputDate >= currentDate) {
	      // Show an error message
	      return false;
	    } else {
	      // Clear the error message
	     return true;
	    }
	 
	}	
	
	
</script>

<footer>
    <div  > <h2>InterraIT Student Portal</h2></div>
    <div id="footer-text" >We are a Silicon Valley based IT services organization that provides cutting-edge business and technology solutions, as well as immersive digital experiences to our clients around the world.</div>
    <div id="socials">
        <div><span class="material-symbols-outlined"> EMAIL</span></div>
        <div><span class="material-symbols-outlined">PHONE</span></div>
        <div><span class="material-symbols-outlined"> CONTACT PAGE</span></div>

    </div>
    <div>All rights reserves @2023</div>
</footer>
</body>
</html>