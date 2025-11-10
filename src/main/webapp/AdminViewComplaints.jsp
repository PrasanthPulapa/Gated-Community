<%@page import="com.gatedcommunity.model.Complaint"%>
<%@page import="java.util.List"%>
<%@page import="com.gatedcommunity.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Residents Complaints | Admin Dashboard</title>

<style>
/* Global Styling */
body {
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #74ebd5, #ACB6E5);
    margin: 0;
    padding: 0;
}

/* Container */
.container {
    width: 90%;
    max-width: 1000px;
    background-color: #fff;
    margin: 40px auto;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}

/* Header */
.header {
    text-align: center;
    background-color: #34495e;
    color: white;
    padding: 15px 0;
    border-radius: 12px;
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 25px;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
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
    font-size: 15px;
    border-bottom: 1px solid #ddd;
    transition: background-color 0.3s ease;
}

/* Row Hover */
tr:hover {
    background-color: #f1faff;
}

/* Status Color Coding */
.status {
    font-weight: bold;
    text-transform: capitalize;
    padding: 6px 10px;
    border-radius: 6px;
    display: inline-block;
    min-width: 100px;
    text-align: center;
}

.status.pending {
    background-color: #fff3cd;
    color: #856404;
}

.status["in progress"], .status.inprogress {
    background-color: #cce5ff;
    color: #004085;
}

.status.resolved {
    background-color: #d4edda;
    color: #155724;
}

/* Buttons */
a.update-btn {
    text-decoration: none;
    color: white;
    background-color: #3498db;
    padding: 8px 14px;
    border-radius: 6px;
    transition: background-color 0.3s;
}

a.update-btn:hover {
    background-color: #2980b9;
}

a.back-btn {
    display: inline-block;
    margin: 20px 0;
    text-decoration: none;
    background-color: #34495e;
    color: white;
    padding: 10px 18px;
    border-radius: 8px;
    transition: background-color 0.3s ease;
}

a.back-btn:hover {
    background-color: #2c3e50;
}

/* Empty State */
.no-data {
    text-align: center;
    font-size: 18px;
    color: #555;
    margin-top: 20px;
}

/* Alert Messages */
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
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>

<body>

    <!-- Back Button -->
    <div style="text-align: center; margin-top: 15px;">
        <a href="adminDashboard.jsp" class="back-btn">← Back to Dashboard</a>
    </div>

    <!-- Alert Messages -->
    <% if (request.getAttribute("message") != null) { %>
    <div id="successMessage" class="alert success">
        <%= request.getAttribute("message") %>
    </div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div id="errorMessage" class="alert error">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <div class="container">
        <div class="header">Residents Complaint Dashboard</div>

        <h2 style="text-align:center;">All Residents Complaints</h2>

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
            </tr>

            <% for (Complaint complaint : complaintList) { %>
            <tr>
                <td><%= complaint.getComplaintId() %></td>
                <td><%= complaint.getUserId() %></td>
                <td><%= complaint.getCategory() %></td>
                <td><%= complaint.getSubject() %></td>
                <td><%= complaint.getDescription() %></td>
                <td>
                    <span class="status <%= complaint.getStatus().toLowerCase().replace(" ", "") %>">
                        <%= complaint.getStatus() %>
                    </span>
                </td>
                <td>
                    <a href="InitialUpdateStatusServlet?complaintId=<%= complaint.getComplaintId() %>" class="update-btn">Update</a>
                </td>
            </tr>
            <% } %>
        </table>

        <% } else { %>
            <p class="no-data">No Complaints Found.</p>
        <% } %>
    </div>

    <script>
        // Auto-hide alert messages
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
