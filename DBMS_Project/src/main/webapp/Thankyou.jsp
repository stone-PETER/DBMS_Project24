<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement, java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        nav {
            background-color: #4CAF50;
            padding: 15px;
            text-align: center;
        }
        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
        }
        nav a:hover {
            color: #388E3C;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #4CAF50;
        }
        p {
            font-size: 1.2em;
            color: #333;
        }
        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }
        a:hover {
            color: #388E3C;
        }
    </style>
</head>
<body>
	<header>
    <% 	Long phone = (Long)session.getAttribute("Phone");
		if(phone == null) { %>
		
        <!-- Show login/signup buttons only if user is not logged in -->
        <a href="Login.jsp?returnUrl=ProductList.jsp" class="login-btn">Login</a>
        <a href="createAccount.jsp?returnUrl=ProductList.jsp" class="signup-btn">Sign Up</a>
    <% } else { System.out.println("Else"); %>
        <!-- Show user info and logout when logged in -->
        <div class="user-menu">
            <span class="user-phone"><%=phone%></span>
            <a href="LogoutServlet?returnUrl=index.jsp" class="logout-btn">Logout</a>
        </div>
    <% } %>
    </header>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="ProductList.jsp">Shop</a>
        <a href="ContactUs.jsp">Contact</a>
    </nav>

    <!-- Thank You Message -->
    <div class="container">
        <h1>Thank You!</h1>
        <p>Your order has been successfully placed.</p>
        <p><a href="index.html">Return to Homepage</a></p>
    </div>
     <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/grocery_db";
        String user = "tazeen";
        String password = "kitkat";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        PrintWriter out1 = response.getWriter();

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db","tazeen","kitkat");
			

            // Create a statement
            stmt = conn.createStatement();

            // Execute the query to get the last transaction details
            String sql = "SELECT * FROM transaction_details ORDER BY transaction_id DESC LIMIT 1";
            rs = stmt.executeQuery(sql);
            // Display the last transaction details
            if (rs.next()) {
                out1.println("<p>Transaction ID: " + rs.getInt("transaction_id") + "</p>");
                out1.println("<p>Amount: " + rs.getDouble("Total_amount") + "</p>");
                out1.println("<p>Date: " + rs.getDate("date") + "</p>");
                out1.println("<p>Payment mode: " + rs.getString("payment_mode") + "</p>");
            } else {
                out1.println("<p>No transaction details available.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out1.println("<p>Error retrieving transaction details.</p>");
        } finally {
            // Close the resources
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>

</body>
</html>
