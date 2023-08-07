<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3 {
	background-color: light blue;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

input {
	padding: 6px 6px;
	border: 1px solid #ccc;
	front-size: 18px;
	width: 80%;
	margin-left: 10px
}

#gender {
	width: 10px;
}

form {
	width: 70%;
	padding-top: 15px;
	padding-bottom: 20px;
	margin-left: 20px
}

li {
	float: left;
}

li button {
	display: block;
	color: gray;
	font-weight: bold;
	text-align: center;
	padding: 12px 26px;
	text-decoration: none;
}

li a {
	display: block;
	color: gray;
	text-align: center;
	padding: 12px 16px;
	text-decoration: none;
}

li
 
button
:hover
:not
 
(
.active
 
)
{
background-color
:
 
lightgray
;


}
.active {
	background-color: lightblue;
}
</style>
</head>
<body>
	<h3>XXX INSURANCE Administrator Manage Helper</h3>
	<ul>
		<li><button class="tablinks"
				onclick="openCategory(event, 'manageemployees')" id="defaultOpen">ManageEmployee</button>
		</li>
		<li><button id="empbtn" class="tablinks"
				onclick="openCategory(event, 'manageclients')">ManageClients</button></li>
		<li style="position: absolute; right: 20px;"><a href="signout">Sign
				Out</a></li>
	</ul>
	<br />



	<div id="manageemployees" class="tabcontent">
		<h3>CDs</h3>
		<!-- add new employee form -->
		<button onclick="myFunction()" id="btn4form"
			style="background-color: lightblue">add new Employee</button>
		<br />
		<form id="asd"
			style="display: none; border: 2px solid black; border-radius: 5px;">
			&emsp;First Name<br /> <input type="text" name="firstName" required /><br />
			&emsp;Last Name<br /> <input type="text" name="lastName" required /><br />
			&emsp;Date Of Birth<br /> <input type="date" name="dob" required /><br />
			&emsp;Phone<br /> <input type="text" name="phone" required /><br />
			&emsp;Gender: <input type="radio" name="gender" value="Female"
				id="gender" required />Female <input type="radio" name="gender"
				value="Male" id="gender" required />Male<br /> &emsp;Email<br /> <input
				id="email" name="email" type="email" required /><br />
			&emsp;Password<br />
			<input type="password" id="password" name="password" minlength="8"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
				onkeyup="check();" required /><br /> &emsp;Confirm Password<br />
			<input type="password" id="confirm_password" name="confirm_password"
				id="confirm_password" minlength="8"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
				onkeyup="check();" required /> <span id='message'></span> <br /> <input
				type="submit" value="Submit" id="divbtn" style="margin-top: 10px">
		</form>
		<c:choose>
			<c:when test="${requestScope.employeelist.size() gt 0}">
				<table>
					<tr>
						<th>Employee ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>DateofBirth</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Gender</th>
					</tr>
					<c:forEach var="employee" items="${requestScope.employeelist}">
						<tr>
							<td><c:out value="${employee.geteId()}" /></td>
							<td><input type="text" value="${employee.getFirstName()" /></td>
							<td><input type="text" value="${employee.getLastName()" /></td>
							<td><input type="text" value="${employee.getDateOfBirth()" /></td>
							<td><input type="text" value="${employee.getEmail()" /></td>
							<td><input type="text" value="${employee.getPhone()" /></td>
							<td><input type="text" value="${employee.getGender()" /></td>
							<td>New password:<input type="text" /></td>
							<td>btn click to delete /update</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<c:out value="No Employees in record" />
				<br />

			</c:otherwise>
		</c:choose>
	</div>

	<div id="manageclient" class="tabcontent">
		<c:choose>
			<c:when test="${requestScope.clientlist.size() gt 0}">
				<table>
					<tr>
						<th>Client ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>DateofBirth</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Gender</th>
					</tr>
					<c:forEach var="client" items="${requestScope.clientlist}">
						<tr>
							<td><c:out value="${client.getClientId()}" /></td>
							<td><input type="text" value="${client.getFirstName()" /></td>
							<td><input type="text" value="${client.getLastName()" /></td>
							<td><input type="text" value="${client.getDateOfBirth()" /></td>
							<td><input type="text" value="${client.getEmail()" /></td>
							<td><input type="text" value="${client.getPhone()" /></td>
							<td><input type="text" value="${client.getGender()" /></td>
							<td>New password:<input type="text" /></td>
							<td>click to delete/update</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<c:out value="No Clients in record" />
				<br />

			</c:otherwise>
		</c:choose>
	</div>


	<script>
		function myFunction() {
			var x = document.getElementById("asd");
			if (x.style.display === "none") {
				x.style.display = "block";
				document.getElementById("btn4form").innerHTML = "Hide";
			} else {
				x.style.display = "none";
				document.getElementById("btn4form").innerHTML = "Add new Employee";
			}
		}

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