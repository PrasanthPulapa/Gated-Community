<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.gatedcommunity.model.Complaint"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Complaint</title>
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
	margin-bottom: 6px;
	display: block;
}

input[type="text"], textarea {
	width: 100%;
	padding: 12px;
	border-radius: 8px;
	border: 1px solid #ccc;
	margin-bottom: 15px;
	font-size: 15px;
	transition: border-color 0.3s;
}

input:focus, textarea:focus {
	border-color: #3498db;
	outline: none;
	box-shadow: 0 0 5px rgba(52, 152, 219, 0.4);
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
	width: 100%;
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
		<h2>Update Complaint</h2>
		<form action="UpgradedComplaintServlet" method="post">
			
			<input type="hidden" name="complaintId" value="<%= complaint.getComplaintId() %>">

			<label for="category">Category</label>
			<input type="text" name="category" value="<%= complaint.getCategory() %>" required>

			<label for="subject">Subject</label>
			<input type="text" name="subject" value="<%= complaint.getSubject() %>" required>

			<label for="description">Description</label>
			<textarea name="description" id="description" required><%= complaint.getDescription() %></textarea>

			<button type="submit">Update Complaint</button>
		</form>
		<%
			} else {
		%>
		<p style="color:red;text-align:center;">No complaint found.</p>
		<%
			}
		%>
	</div>
</body>
</html>
