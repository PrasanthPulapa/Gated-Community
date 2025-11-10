package com.gatedcommunity.servlet;

import java.io.IOException;

import com.gatedcommunity.dao.ComplaintDao;
import com.gatedcommunity.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateComplaintServlet")
public class UpdateComplaintServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idParam = req.getParameter("complaintId");
	    if (idParam == null || idParam.isEmpty()) {
	        req.setAttribute("error", "Complaint ID is missing!");
	        req.getRequestDispatcher("ResidentViewComplaints.jsp").forward(req, resp);
	        return;
	    }

	    try {
	        int complaintId = Integer.parseInt(idParam);
	        ComplaintDao dao = new ComplaintDao();
	        Complaint complaint = dao.getComplaintsById(complaintId);
	        req.setAttribute("complaint", complaint);
	        req.getRequestDispatcher("UpdateComplaint.jsp").forward(req, resp);
	    } catch (NumberFormatException e) {
	        req.setAttribute("error", "Invalid complaint ID format.");
	        req.getRequestDispatcher("ResidentViewComplaints.jsp").forward(req, resp);
	    }

	}
	
}
