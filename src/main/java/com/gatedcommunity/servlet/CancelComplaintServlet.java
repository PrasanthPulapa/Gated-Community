package com.gatedcommunity.servlet;

import java.io.IOException;

import com.gatedcommunity.dao.ComplaintDao;
import com.gatedcommunity.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CancelComplaintServlet")
public class CancelComplaintServlet extends HttpServlet {

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
			req.getRequestDispatcher("ResidentViewServlet").forward(req, resp);
			return;
		}

		int complaintId = Integer.parseInt(idParam);

		Complaint complaint = new Complaint();
		complaint.setComplaintId(complaintId);

		ComplaintDao dao = new ComplaintDao();
		boolean cancelled = dao.cancelComplaint(complaint);

		if (cancelled) {
			req.setAttribute("message", "Complaint deleted successfully!");
		} else {
			req.setAttribute("error", "Failed to delete complaint. Please try again.");
		}

		req.getRequestDispatcher("ResidentViewServlet").forward(req, resp);

	}
}
