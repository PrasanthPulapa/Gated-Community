package com.gatedcommunity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gatedcommunity.model.Admin;
import com.gatedcommunity.utils.Constants;
import com.gatedcommunity.utils.DBConnection;

public class AdminDao {

	public Admin isValid(String email, String password) {
		Admin admin = null;
		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(Constants.VALIDATE_ADMIN);
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				admin = new Admin();
				admin.setUsername(rs.getString("userName"));
				admin.setEmail(rs.getString("email"));
				admin.setRole(rs.getString("role"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return admin;
	}

	public boolean saveAdmin(Admin admin) {
		boolean status = false;
		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(Constants.INSERT_ADMIN);
			statement.setString(1, admin.getUsername());
			statement.setString(2, admin.getEmail());
			statement.setString(3, admin.getPhone());
			statement.setString(4, admin.getRole());
			statement.setString(5, admin.getPassword());
			int rows = statement.executeUpdate();
			status = rows > 0;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

}
