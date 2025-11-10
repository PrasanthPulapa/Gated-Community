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

@WebServlet("/ResidentViewServlet")
public class ResidentViewServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("resident.jsp");
			return;
		}
		
		int userId = (int) session.getAttribute("userId");
		
		ComplaintDao dao = new ComplaintDao();
		List<Complaint> complaintList = dao.getComplaintsByUserId(userId);
		
		request.setAttribute("complaints", complaintList);
		
		request.getRequestDispatcher("ResidentViewComplaints.jsp").forward(request, response);
	}

}
