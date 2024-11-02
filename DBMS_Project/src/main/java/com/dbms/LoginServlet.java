package com.dbms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long phone = Long.parseLong(request.getParameter("Phone"));
        String password = request.getParameter("password");
        String returnURL = request.getParameter("returnUrl");



        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db","tazeen","kitkat");

            // Prepare the SQL statement
            String sql = "SELECT * FROM customer_details WHERE Phone_No = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, phone);
            pstmt.setString(2, password);

            // Execute the query
            rs = pstmt.executeQuery();

            // Check if user exists
            if (rs.next()) {
                // Create a session and set the user attribute
                HttpSession session = request.getSession();
                session.setAttribute("Login", 1);
                session.setAttribute("Phone", phone);

                // Redirect to the success page
                response.sendRedirect(returnURL);
            } else {
                // Invalid credentials, show error message
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html><body><p>Invalid username or password.</p></body></html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Login failed", e);
        } finally {
            // Close the resources
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
}
