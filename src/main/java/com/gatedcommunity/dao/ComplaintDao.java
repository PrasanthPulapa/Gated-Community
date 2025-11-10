package com.gatedcommunity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gatedcommunity.model.Complaint;
import com.gatedcommunity.utils.Constants;
import com.gatedcommunity.utils.DBConnection;

public class ComplaintDao {

	List<Complaint> complaints;

	public List<Complaint> getComplaintsByUserId(int userId) {
		complaints = new ArrayList<>();

		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement(Constants.GET_COMPLAINTS_BYUSERID);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Complaint complaint = new Complaint();
				complaint.setComplaintId(rs.getInt("complaintId"));
				complaint.setUserId(rs.getInt("userId"));
				complaint.setCategory(rs.getString("category"));
				complaint.setSubject(rs.getString("subject"));
				complaint.setDescription(rs.getString("description"));
				complaint.setStatus(rs.getString("status"));

				complaints.add(complaint);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return complaints;
	}

	public boolean raiseComplaint(Complaint complaint) {
		boolean isInserted = false;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(Constants.INSERT_COMPLAINT)) {

			ps.setInt(1, complaint.getUserId());
			ps.setString(2, complaint.getCategory());
			ps.setString(3, complaint.getSubject());
			ps.setString(4, complaint.getDescription());
			ps.setString(5, complaint.getStatus());

			int rows = ps.executeUpdate();
			isInserted = (rows > 0);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isInserted;
	}

	public List<Complaint> getComplaintsByUserIdAndStatus(int userId, String status) {
		complaints = new ArrayList<>();

		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement(Constants.GET_COMPLAINTS_BYUSERID_AND_STATUS);
			ps.setInt(1, userId);
			ps.setString(2, status);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Complaint complaint = new Complaint();
				complaint.setComplaintId(rs.getInt("complaintId"));
				complaint.setUserId(rs.getInt("userId"));
				complaint.setCategory(rs.getString("category"));
				complaint.setSubject(rs.getString("subject"));
				complaint.setDescription(rs.getString("description"));
				complaint.setStatus(rs.getString("status"));

				complaints.add(complaint);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return complaints;
	}

	public Complaint getComplaintsById(int complaintId) {

		Complaint complaint = null;

		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement(Constants.GET_COMPLAINTS_BYCOMPLAINT_ID);
			ps.setInt(1, complaintId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				complaint = new Complaint();
				complaint.setComplaintId(rs.getInt("complaintId"));
				complaint.setUserId(rs.getInt("userId"));
				complaint.setCategory(rs.getString("category"));
				complaint.setSubject(rs.getString("subject"));
				complaint.setDescription(rs.getString("description"));
				complaint.setStatus(rs.getString("status"));

			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return complaint;

	}

	public boolean updateComplaint(Complaint complaint) {
		boolean isUpdated = false;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(Constants.UPDATE_COMPLAINT)) {

			ps.setString(1, complaint.getCategory());
			ps.setString(2, complaint.getSubject());
			ps.setString(3, complaint.getDescription());
			ps.setString(4, complaint.getStatus());
			ps.setInt(5, complaint.getComplaintId());

			int rows = ps.executeUpdate();
			isUpdated = (rows > 0);

//			System.out.println("Rows updated: " + rows);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isUpdated;
	}

	public boolean cancelComplaint(Complaint complaint) {
		boolean isDeleted = false;

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement ps = connection.prepareStatement(Constants.DELETE_COMPLAINT)) {

	        ps.setInt(1, complaint.getComplaintId());

	        int rows = ps.executeUpdate();
	        isDeleted = (rows > 0);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isDeleted;
	}
	
	public List<Complaint> getAllComplaints() {
		
		List<Complaint> complaints = new ArrayList<>();

		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement(Constants.GET_COMPLAINTS);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Complaint complaint = new Complaint();
				complaint.setComplaintId(rs.getInt("complaintId"));
				complaint.setUserId(rs.getInt("userId"));
				complaint.setCategory(rs.getString("category"));
				complaint.setSubject(rs.getString("subject"));
				complaint.setDescription(rs.getString("description"));
				complaint.setStatus(rs.getString("status"));

				complaints.add(complaint);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return complaints;
	}

	public boolean UpdateComplaintStatus(Complaint complaint) {
		boolean isUpdated = false;

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement ps = connection.prepareStatement(Constants.UPDATE_STATUS)) {

	    	ps.setString(1, complaint.getStatus());
	    	ps.setInt(2, complaint.getComplaintId());

	        int rows = ps.executeUpdate();
	        isUpdated = (rows > 0);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isUpdated;
		
	}

}
