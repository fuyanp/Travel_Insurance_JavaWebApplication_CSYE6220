<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Spring Web MVC project</title>
<style>
* {
	box-sizing: border-box
}

.tab {
	float: left;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	width: 15%;
	height: 100%;
}

a {
	font-size: 20px;
	float: right
}

.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 16px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 17px;
}

.tab button:hover {
	background-color: #ddd;
}

.tab button:active {
	background-color: #ddd;
}

.tabcontent {
	float: left;
	padding: 0px 12px;
	border: 1px solid #ccc;
	width: 70%;
	border-left: none;
	height: 100%;
}

#divbtn {
	font-size: 17px;
	background-color: lightgray;
}

#divbtn:hover {
	background-color: azure
}
</style>
</head>
<body>

	<h2>XXX Insurance</h2>

	<div class="tab">
		<button class="tablinks"
			onclick="openCategory(event, 'customersignin')" id="defaultOpen">Customer</button>
		<button id="empbtn" class="tablinks"
			onclick="openCategory(event, 'employeesignin')">Employee</button>
		<span><c:out value="${requestScope.errormsg.toString()}" /></span>
	</div>

	<div id="customersignup" class="tabcontent">
		<h3>Customer Sign Up</h3>

		<form action="clientsignup.htm">
			First Name: <input type="text" name="firstName" required /><br />
			Last Name: <input type="text" name="lastName" required /><br />
			Date Of Birth: <input type="date" name="dob" required /><br />
			Phone: <input type="text" name="phone" required /><br /> Gender: <input
				type="radio" name="gender" value="Female" id="gender" required />Female
			<input type="radio" name="gender" value="Male" id="gender" required />Male<br />
			Email: <input id="email" name="email" type="email" required /><br />
			Password:<input type="password" id="password" name="password"
				minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
				onkeyup="check();" required /><br /> Confirm Password:<input
				type="password" id="confirm_password" name="confirm_password"
				id="confirm_password" minlength="8"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
				onkeyup="check();" required /> <span id='message'></span> <br /> <input
				type="submit" value="SignUp" id="divbtn">
		</form>
		<label>Already have Account? Click below button to sign in!</label><br />
		<button class="tablinks"
			onclick="openCategory(event, 'customersignin')">Sign In</button>

	</div>
	<div id="customersignin" class="tabcontent">
		<h3>Customer Sign In</h3>

		<form action="customersignin.htm">
			Customer ID:<input type="text" name="customerid" id="customerid"
				required /><br /> Password:<input type="password" id="password"
				name="password" minlength="8"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
				onkeyup="check();" required /><br /> <span id='message'></span> <br />
			<input type="submit" value="SignIn" id="divbtn">
		</form>
		<label>No Account? Click below button to sign up!</label><br />
		<button class="tablinks"
			onclick="openCategory(event, 'customersignup')">Sign Up</button>

	</div>

	<div id="employeesignin" class="tabcontent">
		<h3>Employee Sign In</h3>
		<form action="employeesignin.htm">
			Employee ID: <input type="text" name="employeeid" id="employeeid"
				required /><br /> 
			Password: <input type="password" id="password"
				name="password" minlength="8"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
				onkeyup="check();" required /><br /> <span id='message'></span> <br />
			<input type="submit" value="Sign In" id="divbtn">
		</form>
		<button class="tablinks" onclick="openCategory(event, 'adminsignin')">Sign
			in As Administrator</button>
	</div>

	<div id="adminsignin" class="tabcontent">
		<h3>Administrator Sign In</h3>
		<form action="adminsignin.htm">
			Administrator ID: <input type="text" name="employeeid"
				id="employeeid" required /><br /> 
			Password: <input type="password"
				id="password" name="password" minlength="8"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
				onkeyup="check();" required /><br /> <span id='message'></span> <br />
			<input type="submit" value="Sign In" id="divbtn">
		</form>
		<button class="tablinks"
			onclick="openCategory(event, 'employeesignin')">Sign in As
			Employee</button>
	</div>

	

	<script>
		function openCategory(evt, cateName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cateName).style.display = "block";
			evt.currentTarget.className += " active";
		}
		function check() {
			if (document.getElementById('password').value == document
					.getElementById('confirm_password').value) {
				document.getElementById('message').style.color = 'green';
				document.getElementById('message').innerHTML = 'matching';
			} else {
				document.getElementById('message').style.color = 'red';
				document.getElementById('message').innerHTML = 'not matching';
			}
		}
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>

</body>
</html>
