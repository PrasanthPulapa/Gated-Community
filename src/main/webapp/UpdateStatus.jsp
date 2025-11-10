<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.gatedcommunity.model.Complaint"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Complaint Status</title>
<style>
body {
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #74ebd5, #ACB6E5);
	margin: 0;
	padding: 0;
}

.container {
	width: 90%;
	max-width: 600px;
	background-color: #fff;
	margin: 50px auto;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 25px;
}

label {
	font-weight: bold;
	color: #333;
	margin-bottom: 8px;
	display: block;
}

input[type="radio"] {
	margin-right: 8px;
}

button {
	width: 100%;
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
</style>
</head>
<body>

	<div class="container">
		<%
        Complaint complaint = (Complaint) request.getAttribute("complaint");
        if (complaint != null) {
    %>

		<h2>Update Complaint Status</h2>
		<form action="UpdateStatusServlet" method="post">
			<input type="hidden" name="complaintId" value="<%= complaint.getComplaintId() %>">
			<label>Status</label>
			<label><input type="radio" name="status" value="Pending">Pending</label>
			<label><input type="radio" name="status" value="In Progress">InProgress</label> 
			<label><input type="radio" name="status" value="Resolved">Resolved</label>

			<button type="submit">Update Status</button>
		</form>
		
		<br>
		<a href="AdminViewServlet" style="text-decoration:none; color:#3498db;">← Back to Complaints</a>

		<% } else { %>
		<p style="text-align: center; color: red;">No complaint found!</p>
		<% } %>
	</div>

</body>
</html>
