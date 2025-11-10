<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.gatedcommunity.model.Resident"%>

<%
Resident resident = (Resident) session.getAttribute("loggedUser");
if (resident == null) {
	response.sendRedirect("resident.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Raise Complaint</title>

<style>
body {
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #74ebd5, #ACB6E5);
	margin: 0;
	padding: 0;
}


.container {
	width: 90%;
	max-width: 700px;
	background-color: #FFFAF0;
	margin: 50px auto;
	padding: 35px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.header {
	text-align: center;
	background-color: #34495e;
	color: white;
	padding: 15px 0;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	font-size: 22px;
	font-weight: bold;
}


h2 {
	text-align: center;
	color: #333;
	margin-top: 20px;
	margin-bottom: 25px;
}


form {
	width: 100%;
	display: flex;
	flex-direction: column;
}

label {
	font-weight: bold;
	color: #333;
	margin-bottom: 6px;
}

input[type="text"], textarea, select {
	width: 100%;
	padding: 12px;
	margin-bottom: 18px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
	transition: border-color 0.3s ease;
}

input:focus, textarea:focus, select:focus {
	border-color: #3498db;
	outline: none;
	box-shadow: 0 0 5px rgba(52, 152, 219, 0.4);
}

textarea {
	resize: vertical;
	min-height: 80px;
}


button {
	background-color: #3498db;
	color: white;
	border: none;
	padding: 12px;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #2980b9;
}


.back-btn {
	display: inline-block;
	text-align: center;
	margin-top: 20px;
	background-color: #34495e;
	color: white;
	padding: 10px 20px;
	border-radius: 6px;
	text-decoration: none;
	font-size: 15px;
	transition: background-color 0.3s ease;
}

.back-btn:hover {
	background-color: #2c3e50;
}


.alert {
	width: 90%;
	margin: 15px auto;
	padding: 12px 18px;
	border-radius: 8px;
	font-size: 16px;
	text-align: center;
	font-weight: 500;
	animation: fadeIn 0.5s ease-in;
	transition: opacity 0.5s ease-out;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.alert.success {
	background-color: #d4edda;
	color: #155724;
	border: 1px solid #c3e6cb;
}

.alert.error {
	background-color: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
}

@keyframes fadeIn {
	from {
		opacity: 0;
		transform: translateY(-10px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}
</style>
</head>

<body>

	<% if (request.getAttribute("message") != null) { %>
	<div id="successMessage" class="alert success">
		<%= request.getAttribute("message") %>
	</div>
	<% } %>

	<% if (request.getAttribute("error") != null) { %>
	<div id="errorMessage" class="alert error">
		<%= request.getAttribute("error") %>
	</div>
	<% } %>

	<div class="container">
		<div class="header">Raise a New Complaint</div>

		<h2>Hello, <span style="color:#2980b9;"><%= resident.getUsername() %></span></h2>

		<form action="RaiseComplaintServlet" method="post">
			<label for="category">Category</label>
			<select name="category" id="category" required>
				<option value="">-- Select Category --</option>
				<option value="electricity">Electricity</option>
				<option value="water">Water</option>
				<option value="security">Security</option>
				<option value="maintenance">Maintenance</option>
				<option value="other">Other</option>
			</select>

			<label for="subject">Subject</label>
			<input type="text" name="subject" id="subject" placeholder="Enter subject..." required>

			<label for="description">Description</label>
			<textarea name="description" id="description" placeholder="Describe your issue..." required></textarea>

			<button type="submit">Submit Complaint</button>
		</form>

		<div style="text-align:center;">
			<a href="residentDashboard.jsp" class="back-btn">← Back to Dashboard</a>
		</div>
	</div>

	<script>
	window.onload = function() {
		const successMsg = document.getElementById("successMessage");
		const errorMsg = document.getElementById("errorMessage");

		setTimeout(() => {
			if (successMsg) {
				successMsg.style.opacity = "0";
				setTimeout(() => successMsg.style.display = "none", 600);
			}
			if (errorMsg) {
				errorMsg.style.opacity = "0";
				setTimeout(() => errorMsg.style.display = "none", 600);
			}
		}, 3000);
	};
	</script>

</body>
</html>
