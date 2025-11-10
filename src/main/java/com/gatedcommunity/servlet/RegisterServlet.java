package com.gatedcommunity.servlet;

import java.io.IOException;

import com.gatedcommunity.dao.ResidentDao;
import com.gatedcommunity.model.Resident;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        try {
            if (!password.equals(confirmPassword)) {
                response.sendRedirect("resident.jsp?error=PasswordMismatch");
                return;
            }
            
            Resident resident = new Resident();
            resident.setUsername(name);
            resident.setEmail(email);
            resident.setPhone(phone);
            resident.setRole(role);
            resident.setPassword(password);
            
            ResidentDao dao = new ResidentDao();
            boolean isSaved = dao.saveResident(resident);

            if (isSaved) {
                response.sendRedirect("resident.jsp?message=RegistrationSuccess");
            } else {
                response.sendRedirect("resident.jsp?error=RegistrationFailed");
            }
        
        }
        catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("resident.jsp?error=Exception");
        }
	}
}
