package com.dbms;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CreateAccountServlet")
public class createAccountServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("Name");
        String password = request.getParameter("password");
        Long phone = Long.parseLong(request.getParameter("Phone"));
        boolean isValidUser=true;

        try {
        	isValidUser=com.dbms.UserDAO.validateUser(phone, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(!isValidUser) {
        	try {
				com.dbms.UserDAO.createUser(name,password,phone);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }

        response.sendRedirect("Login.jsp");
    }
}