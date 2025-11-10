package com.gatedcommunity.servlet;

import java.io.IOException;

import com.gatedcommunity.dao.ComplaintDao;
import com.gatedcommunity.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int complaintId = Integer.parseInt(req.getParameter("complaintId"));
		String status = req.getParameter("status");
		
		ComplaintDao dao = new ComplaintDao();
		Complaint complaint =  dao.getComplaintsById(complaintId);
		complaint.setStatus(status);
		boolean updated = dao.UpdateComplaintStatus(complaint);

		req.getRequestDispatcher("AdminViewServlet").forward(req, resp);
	}

}
