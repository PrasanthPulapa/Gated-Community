<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.gatedcommunity.model.Resident" %>
<%
	Resident admin = (Resident) session.getAttribute("loggedUser");
	if (admin == null) {
		response.sendRedirect("admin.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashbaord</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #74ebd5, #ACB6E5);
	margin: 0;
	padding: 0;
}

.header {
	background-color: #2c3e50;
	padding: 20px;
	text-align: center;
	color: white;
	font-size: 26px;
	font-weight: bold;
	letter-spacing: 1px;
}

.container {
	margin: 60px auto;
	width: 50%;
	text-align: center;
}

.dashboard-link {
	display: block;
	margin: 20px auto;
	padding: 14px 25px;
	width: 250px;
	text-decoration: none;
	background-color: #2980b9;
	color: white;
	font-size: 18px;
	border-radius: 8px;
	transition: 0.3s;
}

.dashboard-link:hover {
	background-color: #1abc9c;
	transform: scale(1.05);
}

.logout {
	margin-top: 40px;
	background-color: #c0392b;
}

.logout:hover {
	background-color: #e74c3c;
}
</style>
</head>
<body>

	<div class="header">Hello <%= admin.getUsername() %> Welcome to Admin Dashboard!</div>

	<div class="container">
		<a href="AdminViewServlet" class="dashboard-link">View All Complaints</a>
		<a href="logout.jsp" class="dashboard-link logout">Logout</a>
	</div>

</body>
</html>