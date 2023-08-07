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
	<h3>XXX INSURANCE Hi <c:out value="${session.curclient.getFirstName()}" /></h3>
	<ul>
		<li><button class="tablinks"
				onclick="openCategory(event, 'viewhome')" id="defaultOpen">ManageEmployee</button>
		</li>
		<li><button id="empbtn" class="tablinks" 
				onclick="openCategory(event, 'manageinsurance'); barclick('getallinsurance.htm');">Insurance/Policy</button></li>
		<li><button id="empbtn" class="tablinks" 
				onclick="openCategory(event, 'manageclaims'); barclick('getallclaims.htm');">Your Claims</button></li>
		<li style="position: absolute; right: 20px;"><a href="signout">Sign
				Out</a></li>
	</ul>
	<br />



	<div id="manageinsurance" class="tabcontent">
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
				value="Male" id="gender" required />Male<br /> &emsp;Email<br />
			<input id="email" name="email" type="email" required /><br /> 
			<input type="submit" value="Submit" id="divbtn" style="margin-top: 10px">
		</form>
		<table id="insurancemanagetb">
			<thead>
				<tr>
					<th>Policy ID</th>
					<th>Policy Type</th>
					<th>Address</th>
					<th>Operation</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

	<div id="manageclaims" class="tabcontent">
		<table id="claimsmanagetb">
			<thead>
				<tr>
					<th>Cliams ID</th>
					<th>Policy ID</th>
					<th>Policy Type</th>
					<th>Address</th>
					<th>Status</th>
					<th>Operation</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

	<script>
		function barclick(btnvalue){
			const objjson=ajax(btnvalue);
			if(btnvalue=="getallinsurance.htm"){
				setTabel(objjson,"insurancemanagetb");
			}else{
				setTabel(objjson,"claimsmanagetb");
			}
			
		}
	
		function ajax(htmurl){
			var xhttp=new XMLHttpRequest();
			xhttp.onreadystatechange=function (){
				if(xhttp.readyState==4&&xhttp.status==200){
					var objjs=JSON.parse(xhttp.responseText);
					return objjs;
				}
			}
			xhttp.open("POST",htmurl,true);
			xhttp.send();
		}
		
		function setTabel(objjs,tableid){
			const tablebody=document.querySelector("#"+tableid+" > tbody");
		
			while(tablebody.firstChild){
				tablebody.removeChild(tablebody.firstChild);
			}
			
			objjs.forEach(function(row){
				var tr=document.createElement("tr");
				row.forEach(function(cell) {
					var td=document.createElement("td");
					td.textContent =cell;
					tr.appendChild(td);
				});
				tablebody.appendChild(tr);
			});
		}
			
		
	</script>

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

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>
</body>
</html>