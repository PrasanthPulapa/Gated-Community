package com.gatedcommunity.servlet;

import java.io.IOException;

import com.gatedcommunity.dao.ComplaintDao;
import com.gatedcommunity.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/InitialUpdateStatusServlet")
public class InitialUpdateStatusServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int complaintId = Integer.parseInt(req.getParameter("complaintId"));
		ComplaintDao dao = new ComplaintDao();
		
		Complaint complaint = dao.getComplaintsById(complaintId);
		req.setAttribute("complaint", complaint);
		req.getRequestDispatcher("UpdateStatus.jsp").forward(req, resp);
	}

}
