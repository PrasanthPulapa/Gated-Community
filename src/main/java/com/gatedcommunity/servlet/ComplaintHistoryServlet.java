package com.gatedcommunity.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.gatedcommunity.dao.ComplaintDao;
import com.gatedcommunity.model.Complaint;

@WebServlet("/ComplaintHistoryServlet")
public class ComplaintHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("resident.jsp");
			return;
		}

		int userId = (int) session.getAttribute("userId");

		ComplaintDao dao = new ComplaintDao();
		List<Complaint> complaintList = dao.getComplaintsByUserIdAndStatus(userId, "resolved");

		request.setAttribute("complaints", complaintList);

		request.getRequestDispatcher("ComplaintHistory.jsp").forward(request, response);
	}

}
