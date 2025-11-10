package com.gatedcommunity.servlet;

import java.io.IOException;

import com.gatedcommunity.dao.ComplaintDao;
import com.gatedcommunity.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpgradedComplaintServlet")
public class UpgradedComplaintServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int complaintId = Integer.parseInt(req.getParameter("complaintId"));
	    String category = req.getParameter("category");
	    String subject = req.getParameter("subject");
	    String description = req.getParameter("description");

	    Complaint complaint = new Complaint();
	    complaint.setComplaintId(complaintId);
	    complaint.setCategory(category);
	    complaint.setSubject(subject);
	    complaint.setDescription(description);
	    complaint.setStatus("Pending");

	    ComplaintDao dao = new ComplaintDao();
//	    System.out.println("Updating Complaint ID: " + complaintId);
	    boolean success = dao.updateComplaint(complaint);

	    if (success) {
	        req.setAttribute("message", "Complaint updated successfully!");
	        req.getRequestDispatcher("ResidentViewServlet").forward(req, resp);
	    } else {
	        req.setAttribute("error", "Failed to update complaint. Please try again.");
	        req.getRequestDispatcher("UpdateComplaint.jsp").forward(req, resp);
	    }

	}

}
