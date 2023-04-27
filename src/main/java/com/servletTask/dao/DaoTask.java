package com.servletTask.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.jws.WebParam.Mode;

import org.omg.CORBA.Request;

import com.servletTask.model.ModelTask;

public class DaoTask implements TaskDao {
	String jdbcDriver = "org.postgresql.Driver";
	String jdbcURL = "jdbc:postgresql://localhost:5432/users";
	String jdbcUsername = "postgres";
	String jdbcPassword = "root";

	// Query
	private static final String registerUserSQL = "insert into customer (firstName, lastName, email, phoneNumber, genderRadios, languageCheck, dateOfBirth, education, address, city, state, zipCode, password, role) values(?,?,?,?,?,?,?,?,?,?,?,?,?,'user')";
	private static final String loginUserSQL = "select * from customer where email = ? and password = ?";
	private static final String selectUserSQL = "select * from customer";
	private static final String deleteUserSQL = "delete from customer where id=?";
	private static final String selectUserIdSQL = "select * from customer where id =?";
	private static final String selectUserMailSQL = "select * from customer where email =?";
	private static final String updateUserSQL = "update customer set firstName = ?,lastName = ?, email = ?, phoneNumber = ?,genderRadios= ?,languageCheck = ?, dateOfBirth = ?, education = ?, address = ?, city = ?, state = ?, zipCode = ? where email = ?";
	private static final String updatePasswordSQL = "update customer set password = ? where email = ?";

	// Connection
	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(jdbcDriver);
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Error");
			e.getMessage();
		}
//		finally {
//			try {
//				connection.close();
//			} catch (SQLException e) {
//				e.getMessage();
//				e.getErrorCode();
//			}
//		}
		return connection;
	}

	// Registration
	public String registerUser(ModelTask modelTask) {
		String result = "Data enter";
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(registerUserSQL);
			preparedStatement.setString(1, modelTask.getFirstName());
			preparedStatement.setString(2, modelTask.getLastName());
			preparedStatement.setString(3, modelTask.getEmail());
			preparedStatement.setLong(4, modelTask.getPhoneNumber());
			preparedStatement.setString(5, modelTask.getGenderRadios());
			preparedStatement.setString(6, modelTask.getLanguageCheck());
			preparedStatement.setDate(7, modelTask.getDateOfBirth());
			preparedStatement.setString(8, modelTask.getEducation());
			preparedStatement.setString(9, modelTask.getAddress());
			preparedStatement.setString(10, modelTask.getCity());
			preparedStatement.setString(11, modelTask.getState());
			preparedStatement.setInt(12, modelTask.getZipCode());
			preparedStatement.setString(13, modelTask.getPassword());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Error");
			e.getMessage();
			result = "Not enter";
		}
		return result;
	}

	// Valid login & List all user
	public boolean listUser(ModelTask modelTask) {
		boolean status = false;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(loginUserSQL);
			preparedStatement.setString(1, modelTask.getEmail());
			preparedStatement.setString(2, modelTask.getPassword());
			ResultSet resultSet = preparedStatement.executeQuery();
			status = resultSet.next();
		} catch (SQLException e) {
			System.out.println("error");
			e.getMessage();
			e.getErrorCode();
		}
		return status;
	}

	// list all user
	public List<ModelTask> adminDashboard() {
		List<ModelTask> userData = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(selectUserSQL);) {
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String firstName = resultSet.getString("firstName");
				String lastName = resultSet.getString("lastName");
				String email = resultSet.getString("email");
				long phoneNumber = resultSet.getLong("phoneNumber");
				String genderRadios = resultSet.getString("genderRadios");
				String languageCheck = resultSet.getString("languageCheck");
				Date dateOfBirth = resultSet.getDate("dateOfBirth");
				String education = resultSet.getString("education");
				String address = resultSet.getString("address");
				String city = resultSet.getString("city");
				String state = resultSet.getString("state");
				int zipCode = resultSet.getInt("zipCode");
				String password = resultSet.getString("password");
				userData.add(new ModelTask(id, firstName, lastName, email, phoneNumber, genderRadios, languageCheck,
						dateOfBirth, education, address, city, state, zipCode, password));
			}
		} catch (SQLException e) {
			System.out.println("error");
			e.getMessage();
			e.getErrorCode();
		}
		return userData;
	}

	// Delete user
	public boolean deleteUser(int id) {
		boolean dataDeleted = false;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(deleteUserSQL)) {
			preparedStatement.setInt(1, id);
			dataDeleted = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dataDeleted;
	}

	// Edit user form
	public List<ModelTask> editUser(int id) {
		List<ModelTask> user = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(selectUserIdSQL)) {
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				String firstName = resultSet.getString("firstName");
				String lastName = resultSet.getString("lastName");
				String email = resultSet.getString("email");
				long phoneNumber = resultSet.getLong("phoneNumber");
				String genderRadios = resultSet.getString("genderRadios");
				String languageCheck = resultSet.getString("languageCheck");
				Date dateOfBirth = resultSet.getDate("dateOfBirth");
				String education = resultSet.getString("education");
				String address = resultSet.getString("address");
				String city = resultSet.getString("city");
				String state = resultSet.getString("state");
				int zipCode = resultSet.getInt("zipCode");
				String password = resultSet.getString("password");
				user.add(new ModelTask(id, firstName, lastName, email, phoneNumber, genderRadios, languageCheck,
						dateOfBirth, education, address, city, state, zipCode, password));
			}
		} catch (SQLException e) {
			System.out.println("error");
			e.getMessage();
		}
		return user;
	}

	// Update user form at User DashBoard
	public List<ModelTask> userForm(String email) {
		List<ModelTask> user = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(selectUserMailSQL)) {
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String firstName = resultSet.getString("firstName");
				String lastName = resultSet.getString("lastName");
				long phoneNumber = resultSet.getLong("phoneNumber");
				String genderRadios = resultSet.getString("genderRadios");
				String languageCheck = resultSet.getString("languageCheck");
				Date dateOfBirth = resultSet.getDate("dateOfBirth");
				String education = resultSet.getString("education");
				String address = resultSet.getString("address");
				String city = resultSet.getString("city");
				String state = resultSet.getString("state");
				int zipCode = resultSet.getInt("zipCode");
				String password = resultSet.getString("password");
				user.add(new ModelTask(id, firstName, lastName, email, phoneNumber, genderRadios, languageCheck,
						dateOfBirth, education, address, city, state, zipCode, password));
			}
		} catch (SQLException e) {
			System.out.println("error");
			e.getMessage();
		}
		return user;
	}

	// Update user
	public boolean updateUser(ModelTask modelTask) {
		boolean dataUpadated = false;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(updateUserSQL)) {
			preparedStatement.setString(1, modelTask.getFirstName());
			preparedStatement.setString(2, modelTask.getLastName());
			preparedStatement.setString(3, modelTask.getEmail());
			preparedStatement.setLong(4, modelTask.getPhoneNumber());
			preparedStatement.setString(5, modelTask.getGenderRadios());
			preparedStatement.setString(6, modelTask.getLanguageCheck());
			preparedStatement.setDate(7, modelTask.getDateOfBirth());
			preparedStatement.setString(8, modelTask.getEducation());
			preparedStatement.setString(9, modelTask.getAddress());
			preparedStatement.setString(10, modelTask.getCity());
			preparedStatement.setString(11, modelTask.getState());
			preparedStatement.setInt(12, modelTask.getZipCode());
			preparedStatement.setString(13, modelTask.getEmail());
			dataUpadated = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			System.out.println("Error");
			e.getMessage();
		}
		return dataUpadated;
	}

	// Forget Password
	public boolean forgetPassword(ModelTask modelTask) {
		boolean passwordUpdated = false;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(updatePasswordSQL);) {
			preparedStatement.setString(1, modelTask.getPassword());
			preparedStatement.setString(2, modelTask.getEmail());
			passwordUpdated = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			System.out.println("Error");
			e.getMessage();
		}
		return passwordUpdated;
	}

	public boolean uniqueMail(String email) {
		boolean status = false;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(selectUserMailSQL);
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			status = resultSet.next();
		} catch (SQLException e) {
			System.out.println("Error at query");
			e.getMessage();
		}
		return status;
	}
}
