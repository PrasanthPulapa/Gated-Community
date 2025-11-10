package com.gatedcommunity.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.gatedcommunity.dao.ComplaintDao;
import com.gatedcommunity.model.Complaint;

@WebServlet("/RaiseComplaintServlet")
public class RaiseComplaintServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("resident.jsp");
			return;
		}

		int userId = (int) session.getAttribute("userId");
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String description = request.getParameter("description");

		if (category == null || category.trim().isEmpty() || subject == null || subject.trim().isEmpty()
				|| description == null || description.trim().isEmpty()) {

			request.setAttribute("error", "All fields are required. Please fill out the form.");
			request.getRequestDispatcher("RaiseComplaint.jsp").forward(request, response);
			return;
		}

		Complaint complaint = new Complaint();
		complaint.setUserId(userId);
		complaint.setCategory(category);
		complaint.setSubject(subject);
		complaint.setDescription(description);
		complaint.setStatus("pending");

		ComplaintDao complaintDao = new ComplaintDao();
		boolean success = complaintDao.raiseComplaint(complaint);

		if (success) {
			request.setAttribute("message", "Complaint raised successfully!");
			request.getRequestDispatcher("ResidentViewServlet").forward(request, response);
		}
	}

}
