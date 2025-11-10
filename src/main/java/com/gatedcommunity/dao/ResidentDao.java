package com.gatedcommunity.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gatedcommunity.model.Resident;
import com.gatedcommunity.utils.Constants;
import com.gatedcommunity.utils.DBConnection;

public class ResidentDao {

	public Resident isValid(String email, String password) {

		Resident resident = null;
		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(Constants.VALIDATE_RESIDENT);
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				resident = new Resident();
				resident.setUsername(rs.getString("username"));
				resident.setUserId(rs.getInt("userId"));
				resident.setEmail(rs.getString("email"));
				resident.setRole(rs.getString("role"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resident;
	}

	public boolean saveResident(Resident resident) {
		boolean status = false;
		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(Constants.INSERT_RESIDENT);
			statement.setString(1, resident.getUsername());
			statement.setString(2, resident.getEmail());
			statement.setString(3, resident.getPhone());
			statement.setString(4, resident.getRole());
			statement.setString(5, resident.getPassword());
			int rows = statement.executeUpdate();
			status = rows > 0;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

}
