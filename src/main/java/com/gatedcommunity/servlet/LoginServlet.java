package com.gatedcommunity.servlet;

import java.io.IOException;

import com.gatedcommunity.dao.ResidentDao;
import com.gatedcommunity.model.Resident;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		ResidentDao rDao = new ResidentDao();
		Resident resident = rDao.isValid(email, password);
		if (resident != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loggedUser", resident);
			session.setAttribute("userId", resident.getUserId());

			if ("admin".equalsIgnoreCase(resident.getRole())) {
				resp.sendRedirect("adminDashboard.jsp");
			} else if ("resident".equalsIgnoreCase(resident.getRole())) {
				resp.sendRedirect("residentDashboard.jsp");
			}

		} else {
			String referer = req.getHeader("referer");
			if (referer != null && referer.contains("admin.jsp")) {
				resp.sendRedirect("admin.jsp?error=InvalidCredentials");
			} else {
				resp.sendRedirect("resident.jsp?error=InvalidCredentials");
			}
		}

	}
}
