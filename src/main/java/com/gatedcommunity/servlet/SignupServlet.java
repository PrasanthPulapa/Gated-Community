package com.gatedcommunity.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.gatedcommunity.dao.AdminDao;
import com.gatedcommunity.model.Admin;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        try {
            if (!password.equals(confirmPassword)) {
                response.sendRedirect("admin.jsp?error=PasswordMismatch");
                return;
            }
            
            Admin admin = new Admin();
            admin.setUsername(name);
            admin.setEmail(email);
            admin.setPhone(phone);
            admin.setRole(role);
            admin.setPassword(password);
            
            AdminDao dao = new AdminDao();
            boolean isSaved = dao.saveAdmin(admin);

            if (isSaved) {
                response.sendRedirect("admin.jsp?message=RegistrationSuccess");
            } else {
                response.sendRedirect("admin.jsp?error=RegistrationFailed");
            }
        
        }
        catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?error=Exception");
        }
	}

}
