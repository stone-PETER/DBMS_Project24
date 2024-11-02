package com.dbms;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class groceryServlet
 */
@WebServlet("/groceryServlet")
public class groceryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String URL = "jdbc:mysql://localhost:3306/grocery_db";
	    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	    private static final String USER = "tazeen";
	    private static final String PASS = "kitkat";
	    java.sql.Connection conn;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public groceryServlet() {
        super();
        try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(URL,USER,PASS);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			long phone = Long.parseLong(request.getParameter("phone"));
			int id = Integer.parseInt(request.getParameter("id"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String mode = request.getParameter("mode");
			
			String query1 = "INSERT INTO transaction_details (Phone_No, total_amount, payment_mode) VALUES (?, ?, ?)";
			String query2 = "INSERT INTO order_details (quantity, prod_ID, transaction_ID) VALUES (?, ?, ?)";
			ResultSet rs;
			PreparedStatement ps2 = conn.prepareStatement(query1);
			ps2.setLong(1, phone);
			ps2.setInt(2, 0);
			ps2.setString(3, mode);
			ps2.executeUpdate();
			
			Statement stmt=conn.createStatement();
			System.out.println("Here");
			rs=stmt.executeQuery("select MAX(transaction_id) from transaction_details"); 
			if (rs.next()) {
                int TID = rs.getInt(1);
                System.out.println(TID);

                // Insert into order_details
                PreparedStatement ps3 = conn.prepareStatement(query2);
                ps3.setInt(1, quantity);
                ps3.setInt(2, id);
                ps3.setInt(3, TID);
                ps3.executeUpdate();

                response.sendRedirect("Thankyou.jsp");
            }
			//System.out.println("Hi");
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
