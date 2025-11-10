<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.gatedcommunity.model.Resident" %>
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
 <title>Resident Dashboard</title>
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

    <div class="header">
         Hello <%= resident.getUsername() %> Welcome to Resident Dashboard!
    </div>

    <div class="container">
        <a href="RaiseComplaint.jsp" class="dashboard-link">Raise Complaint</a>
        <a href="ResidentViewServlet" class="dashboard-link">View My Complaints</a>
        <a href="ComplaintHistoryServlet" class="dashboard-link">Complaints History</a>
        <a href="logout" class="dashboard-link logout">Logout</a>
    </div>

</body>
</html>