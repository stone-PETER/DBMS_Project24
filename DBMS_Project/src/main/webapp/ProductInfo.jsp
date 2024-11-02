<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db", "tazeen", "kitkat");

    response.setContentType("text/html");
    String prodId = request.getParameter("id");
    ps = con.prepareStatement("select * from product_details where product_id=?");
    ps.setString(1, prodId);
    rs = ps.executeQuery();
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/desc.css">
<title>Order Summary</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        background-color: #4CAF50;
        text-align: center;
    }

    nav ul li {
        display: inline;
        margin-right: 15px;
    }

    nav ul li a {
        text-decoration: none;
        color: white;
        padding: 10px 15px;
        display: inline-block;
        font-weight: bold;
    }

    nav ul li a:hover {
        background-color: #388E3C;
        color: white;
    }

    h1 {
        text-align: center;
        color: #4CAF50;
        margin-top: 30px;
    }

    .product-details {
        text-align: center;
        margin: 20px auto;
        width: 80%;
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .product-details img {
        width: 250px;
        height: 250px;
        object-fit: contain;
    }

    .product-details h3 {
        color: #333;
        margin-bottom: 10px;
    }

    form {
        margin-top: 20px;
    }

    form label {
        font-size: 1.2em;
        margin-right: 10px;
    }

    form input[type="number"], form input[type="text"] {
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
        width: 100%;
        max-width: 300px;
    }

    form input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
    }

    form input[type="submit"]:hover {
        background-color: #388E3C;
    }

</style>
</head>
<body>

<!-- Navigation -->
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

<!-- Search Form -->
<form method="GET" action="ProductList.jsp" id="searchform" style="text-align: center; margin: 20px;">
    <input type="text" name="search" placeholder="Search Products..." style="padding: 10px; width: 300px; border-radius: 5px; border: 1px solid #ccc;">
    <input type="submit" name="submit" value="Search" style="padding: 10px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer;">
</form>

<!-- Product Details Section -->
<%
while(rs.next()){
%>
<div class="product-details">
    <img src="./images/<%=rs.getString("product_name")%>.jpg" alt="<%=rs.getString("product_name") %>"/>
    <h3>Product Chosen: <%=rs.getString("product_name") %></h3>
    <h3>Description: <%=rs.getString("product_description") %></h3>
    <h3>Price: Rs. <%=rs.getString("price") %></h3>
    <form action="buynow.jsp" method="GET">
        <label>Quantity: <input type="number" name="quantity" min="1" max="<%=rs.getString("stock") %>" required></label><br/>
        <input type="text" name="mode" placeholder="Payment Method" required><br/>
        <input type="hidden" value="<%=rs.getInt("product_id") %>" name="id"/>
        <input type="submit" value="Buy Now"/>
    </form>
</div>
<%
} 
%>

</body>
</html>
<%
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
