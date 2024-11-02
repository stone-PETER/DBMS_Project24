package com.dbms;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection conn;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");  
        	conn=DriverManager.getConnection(  
        	"jdbc:mysql://localhost:3306/grocery_db","tazeen","kitkat"); 
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
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pname = request.getParameter("pname");
		String desc = request.getParameter("desc");
		String img = request.getParameter("img");
		//request.getParameter("") returns a string so we need to use parseInt to typecast it into int 
		int cat = Integer.parseInt(request.getParameter("cat"));
		double price = Double.parseDouble(request.getParameter("price"));
		System.out.println(pname+","+desc+","+img+","+cat+","+price);
		String sql = "INSERT INTO product_details (product_id,product_name,product_description,category,price,stock,rating, prod_img) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			//PreparedStatement-can have an sql query and can be executed any number of times(one instance created and reused)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setString(2, img);
			pstmt.setString(3, desc);
			pstmt.setDouble(4, price);
			pstmt.setInt(5, cat);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("adminPage.jsp?select=1");
	}

	}
