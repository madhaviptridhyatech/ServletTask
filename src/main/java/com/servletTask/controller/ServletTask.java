package com.servletTask.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servletTask.dao.DaoTask;
import com.servletTask.model.ModelTask;

@WebServlet("/")
public class ServletTask extends HttpServlet implements TaskServlet {
	private static final long serialVersionUID = 1L;
	private DaoTask daoTask;

	public ServletTask() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		switch (action) {
		case "/":
			login(request, response);
			break;
		case "/register":
			registerUser(request, response);
			break;
		case "/user":
			listUser(request, response);
			break;
		case "/wrongLogin":
			wrongLogin(request, response);
			break;
		case "/adminDashboard":
			adminDashboard(request, response);
			break;
		case "/userDashboard":
			userDashboard(request, response);
			break;
		case "/editUser":
			editUser(request, response);
			break;
		case "/updateUserInAdmin":
			updateUserInAdmin(request, response);
			break;
		case "/updateUser":
			updateUser(request, response);
			break;
		case "/deleteUser":
			deleteUser(request, response);
			break;
		case "/forget":
			forgetPassword(request, response);
			break;
		default:
			adminDashboard(request, response);
		}
	}

	// Reset Password
	private void forgetPassword(HttpServletRequest request, HttpServletResponse response) {
		try {
			DaoTask userDao = new DaoTask();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			ModelTask userModel = new ModelTask(email, password);
			userDao.forgetPassword(userModel);
			boolean status = userDao.uniqueMail(email);
			HttpSession session = request.getSession();
			if (status == false) {
				response.sendRedirect("forget.jsp");
			} else {
//				session.setAttribute("forgot", "");
//				session.setMaxInactiveInterval(1 * 1);
				response.sendRedirect("/ServletTask/");
			}
		} catch (IOException e) {
			System.out.println("Error");
			e.getMessage();
		}
	}

	// Update user at User Dashboard
	private void updateUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			DaoTask userDao = new DaoTask();
			String email = request.getParameter("email");
			List<ModelTask> user = userDao.userForm(email);
			request.setAttribute("userData", user);
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
			String genderRadios = request.getParameter("genderRadios");
			String language[] = request.getParameterValues("languageCheck");
			String languages = "";
			for (int i = 0; i < language.length; i++) {
				languages += language[i] + " ";
			}
			String dateOfBirth = request.getParameter("dateOfBirth");
			java.util.Date date = null;
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfBirth.toString());
			java.sql.Date mySqlDate = new java.sql.Date(date.getTime());
			String education = request.getParameter("education");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int zipCode = Integer.parseInt(request.getParameter("zipCode"));
			ModelTask userModel = new ModelTask(firstName, lastName, email, phoneNumber, genderRadios, languages,
					mySqlDate, education, address, city, state, zipCode);
			userDao.updateUser(userModel);
			response.sendRedirect("userDashboard?email=" + email);
		} catch (ParseException | IOException e) {
			e.getMessage();
		}
	}

	// Update user at Admin Dashboard
	private void updateUserInAdmin(HttpServletRequest request, HttpServletResponse response) {
		try {
			DaoTask userDao = new DaoTask();
			String email = request.getParameter("email");
			List<ModelTask> user = userDao.userForm(email);
			request.setAttribute("userData", user);
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
			String genderRadios = request.getParameter("genderRadios");
			String language[] = request.getParameterValues("languageCheck");
			String languages = "";
			for (int i = 0; i < language.length; i++) {
				languages += language[i] + " ";
			}
			String dateOfBirth = request.getParameter("dateOfBirth");
			java.util.Date date = null;
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfBirth.toString());
			java.sql.Date mySqlDate = new java.sql.Date(date.getTime());
			String education = request.getParameter("education");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int zipCode = Integer.parseInt(request.getParameter("zipCode"));

			ModelTask userModel = new ModelTask(firstName, lastName, email, phoneNumber, genderRadios, languages,
					mySqlDate, education, address, city, state, zipCode);
			userDao.updateUser(userModel);
			response.sendRedirect("adminDashboard");
			request.setAttribute("userData", user);
		} catch (ParseException | IOException e) {
			System.out.println("Error");
			e.getMessage();
		}
	}

	// Delete User
	private int deleteUser(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			DaoTask userDao = new DaoTask();
			userDao.deleteUser(id);
			response.sendRedirect("adminDashboard");
		} catch (IOException e) {
			System.out.println("Error");
			e.getMessage();
		}
		return id;
	}

	// Edit user form method
	private void editUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			DaoTask userDao = new DaoTask();
			int id = Integer.parseInt(request.getParameter("id"));
			List<ModelTask> user = userDao.editUser(id);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("update.jsp");
			request.setAttribute("userData", user);
			requestDispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			System.out.println("Error");
			e.getMessage();
		}
	}

	// User Dashboard
	private void userDashboard(HttpServletRequest request, HttpServletResponse response) {
		try {
			DaoTask userDao = new DaoTask();
			ModelTask userModel = new ModelTask();
			String email = request.getParameter("email");
			List<ModelTask> user = userDao.userForm(email);
			request.setAttribute("userData", user);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("user.jsp");
			request.setAttribute("userData", user);
			requestDispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			System.out.println("Error");
			e.getMessage();
		}
	}

	// Admin DashBoard
	private void adminDashboard(HttpServletRequest request, HttpServletResponse response) {
		try {
			DaoTask userDao = new DaoTask();
			List<ModelTask> userData = userDao.adminDashboard();
			request.setAttribute("userData", userData);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			System.out.println("Error");
			e.getMessage();
		}
	}

	// Invalid Login
	private void wrongLogin(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.sendRedirect("login.jsp");
		} catch (IOException e) {
			System.out.println("Error");
			e.getMessage();
		}
	}

	// Display all user at admin Dashboard
	private void listUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			DaoTask userDao = new DaoTask();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String email1 = "madhaviptridhyatech@gmail.com";
			String password1 = "Madhavi1";
			ModelTask userModel = new ModelTask();
			userModel.setEmail(email);
			userModel.setPassword(password);
			HttpSession session = request.getSession();
			if (userDao.listUser(userModel)) {
				if (email.equals(email1) & password.equals(password1)) {
//					session.setAttribute("incorrect", "");
//					session.setMaxInactiveInterval(1 * 1);
					
					response.sendRedirect("adminDashboard");
				} else {
//					session.setAttribute("incorrect", "");
//					session.setMaxInactiveInterval(1 * 1);
					RequestDispatcher dispatcher = request.getRequestDispatcher("userDashboard?" + email);
					dispatcher.forward(request, response);
				}
			} else {
				session.setAttribute("error", "Invalid Account.");
				response.sendRedirect("wrongLogin");
			}

		} catch (IOException | ServletException e) {
			System.out.println("Error");
			e.getMessage();
		}
	}

	// Registration
	private void registerUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
			String genderRadios = request.getParameter("genderRadios");
			String language[] = request.getParameterValues("languageCheck");
			String languages = "";
			for (int i = 0; i < language.length; i++) {
				languages += language[i] + " ";
			}
			String dateOfBirth = request.getParameter("dateOfBirth");
			java.util.Date date = null;
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfBirth.toString());
			java.sql.Date mySqlDate = new java.sql.Date(date.getTime());
			String education = request.getParameter("education");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int zipCode = Integer.parseInt(request.getParameter("zipCode"));
			String password = request.getParameter("password");
			ModelTask userModel = new ModelTask(firstName, lastName, email, phoneNumber, genderRadios, languages,
					mySqlDate, education, address, city, state, zipCode, password);
			DaoTask userDao = new DaoTask();
			boolean status = userDao.uniqueMail(email);
			HttpSession session = request.getSession();
			if (status == false) {
				String result = userDao.registerUser(userModel);
				response.sendRedirect("/ServletTask/");
//				session.setAttribute("registered", "");
//				session.setMaxInactiveInterval(1 * 1);
			}else {
				response.sendRedirect("register.jsp");
			}
		} catch (ParseException | IOException e) {
			System.out.println("Error");
			e.getMessage();
		}
	}

	// Login
	private void login(HttpServletRequest request, HttpServletResponse response) {
		try {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.getMessage();
		}
	}
}
