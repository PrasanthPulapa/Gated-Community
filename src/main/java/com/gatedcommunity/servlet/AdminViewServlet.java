package com.gatedcommunity.servlet;

import java.io.IOException;
import java.util.List;

import com.gatedcommunity.dao.ComplaintDao;
import com.gatedcommunity.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/AdminViewServlet")
public class AdminViewServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ComplaintDao dao = new ComplaintDao();
		List<Complaint> complaintList = dao.getAllComplaints();

		req.setAttribute("complaints", complaintList);

		req.getRequestDispatcher("AdminViewComplaints.jsp").forward(req, resp);
	}

}
