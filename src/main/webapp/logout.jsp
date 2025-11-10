<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
    
    session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }

    // Prevent caching so user can't go back after logout
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0); 

    
    response.sendRedirect("admin.jsp");
%>

</body>
</html>