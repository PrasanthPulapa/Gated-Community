<%@page import="com.gatedcommunity.model.Resident"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.gatedcommunity.model.Complaint"%>
<%@ page import="java.util.List"%>
<%@ page import="com.gatedcommunity.model.Resident"%>

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
<title>Resident Complaints</title>


<style>

.back-btn {
    display: inline-block;
    background: linear-gradient(135deg, #3498db, #2ecc71);
    color: white;
    padding: 10px 20px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    font-size: 15px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease;
}

.back-btn:hover {
    background: linear-gradient(135deg, #2ecc71, #27ae60);
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.25);
}

body {
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #74ebd5, #ACB6E5);
	margin: 0;
	padding: 0;
}

h2 {
	text-align: center;
	color: #333;
	margin-top: 20px;
}

.container {
	width: 90%;
	max-width: 900px;
	background-color: #fff;
	margin: 40px auto;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 25px;
}

th {
	background-color: #2c3e50;
	color: #fff;
	padding: 12px;
	text-align: left;
	font-size: 16px;
}

td {
	padding: 10px;
	text-align: left;
	color: #333;
	font-size: 15px;
	border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e0f7fa;
}

.no-data {
	text-align: center;
	font-size: 18px;
	color: #555;
	margin-top: 20px;
}

.header {
	text-align: center;
	background-color: #34495e;
	color: white;
	padding: 15px 0;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	font-size: 22px;
}

.username {
	color: #2980b9;
	font-weight: bold;
}

.status {
	font-weight: bold;
	text-transform: capitalize;
}

.status.pending {
	color: #e67e22;
}

.status.resolved {
	color: #27ae60;
}

.status.inprogress {
	color: #3498db;
}
</style>

<style>
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

@
keyframes fadeIn {from { opacity:0;
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
	
	<div style="text-align: center; margin-bottom: 15px;">
    <a href="residentDashboard.jsp" class="back-btn">← Back to Dashboard</a>
	</div>

	<% if (request.getAttribute("message") != null) { %>
	<div id="successMessage" class="alert success">
		<%= request.getAttribute("message") %>
	</div>

	<% 
		}
	%>

	<% if (request.getAttribute("error") != null) { %>
	<div id="errorMessage" class="alert error">
		<%= request.getAttribute("error") %>
	</div>
	<% 
		}
	%>
	
		

	<div class="container">
		
		<div class="header">Resident Complaint Dashboard</div>
		<h2>
			Hello, <span class="username"><%= resident.getUsername() %></span>
		</h2>
		<h2>Your Complaints</h2>

		<%
        List<Complaint> complaintList = (List<Complaint>) request.getAttribute("complaints");
        if (complaintList != null && !complaintList.isEmpty()) {
        %>

		<table>
			<tr>
				<th>Complaint ID</th>
				<th>User ID</th>
				<th>Category</th>
				<th>Subject</th>
				<th>Description</th>
				<th>Status</th>
				<th>Update</th>
				<th>Cancel</th>
			</tr>

			<%
                for (Complaint complaint : complaintList) {
            %>
			<tr>
				<td><%= complaint.getComplaintId() %></td>
				<td><%= complaint.getUserId() %></td>
				<td><%= complaint.getCategory() %></td>
				<td><%= complaint.getSubject() %></td>
				<td><%= complaint.getDescription() %></td>
				<td class="status <%= complaint.getStatus().toLowerCase() %>">
					<%= complaint.getStatus() %>
				</td>
				<td><a
					href="UpdateComplaintServlet?complaintId=<%=complaint.getComplaintId() %>">Edit</a>
				</td>
				<td>
				<a href="CancelComplaintServlet?complaintId=<%= complaint.getComplaintId() %>"
					onclick="return confirm('Are you sure you want to delete this complaint?');"
					style="color: white; background-color: #e74c3c; padding: 6px 12px; border-radius: 6px; text-decoration: none; font-weight: bold;">
						Delete </a>
				</td>

			</tr>
			<%
                }
            %>
		</table>

		<%
        } else {
        %>
		<p class="no-data">No Complaints Found.</p>
		<%
        }
        %>
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
