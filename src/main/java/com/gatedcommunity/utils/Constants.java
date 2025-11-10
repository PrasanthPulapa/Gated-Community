package com.gatedcommunity.utils;

public class Constants {

	public static final String URL ="jdbc:mysql://localhost:3306/gated_community";
	public static final String USERNAME = "root";
	public static final String PASSWORD = "Prabha@132";
	public static final String INSERT_RESIDENT = "INSERT INTO residents (username, email, phone, role, password) VALUES(?,?,?,?,?)";
	public static final String VALIDATE_RESIDENT = "SELECT * FROM residents WHERE email = ? AND password = ?";
	public static final String VALIDATE_ADMIN = "SELECT * FROM residents WHERE email = ? AND password = ?";
	public static final String INSERT_ADMIN = "INSERT INTO residents (username, email, phone, role, password) VALUES(?,?,?,?,?)";
	public static final String GET_COMPLAINTS_BYUSERID = "select * from complaints WHERE userId = ?";
	public static final String INSERT_COMPLAINT = "INSERT INTO complaints (userId, category, subject, description, status) VALUES (?, ?, ?, ?, ?)";
	public static final String GET_COMPLAINTS_BYUSERID_AND_STATUS = "select * from complaints WHERE userId = ? and status = ?";
	public static final String GET_COMPLAINTS_BYCOMPLAINT_ID = "select * from complaints WHERE complaintId = ?";
	public static final String UPDATE_COMPLAINT = "UPDATE complaints SET category = ?, subject = ?, description = ?, status = ? WHERE complaintId = ?";
	public static final String DELETE_COMPLAINT = "DELETE FROM complaints WHERE complaintId = ?";
	public static final String GET_COMPLAINTS = "select * from complaints";
	public static final String UPDATE_STATUS = "UPDATE complaints SET status = ? WHERE complaintId=?";
}