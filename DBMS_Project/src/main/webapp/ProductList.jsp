<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%
System.out.println("ProductList");
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
String query;
String search="";
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db", "tazeen", "kitkat");

    response.setContentType("text/html");
    search = request.getParameter("search");
    query="select * from product_details where product_name like \"%"+search+"%\"";
    ps = con.prepareStatement(query);
    
    rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/ProductList.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<title>Fruits and Vegetables</title>
</head>
<body>
    <header>
    <% 	Long phone = (Long)session.getAttribute("Phone");
		if(phone == null) { %>
		
        <!-- Show login/signup buttons only if user is not logged in -->
        <a href="Login.jsp?returnUrl=ProductList.jsp?search=%25&submit=Search" class="login-btn">Login</a>
        <a href="createAccount.jsp?returnUrl=ProductList.jsp?search=%25&submit=Search" class="signup-btn">Sign Up</a>
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
    <form method="GET" action="ProductList.jsp" id="searchform">
        <input type="text" name="search"> <input type="hidden" name="returnUrl" value="<%= request.getParameter("returnUrl") %>"><input type="submit" name="submit" value="Search">
    </form>
    
    <section class="product-showcase" id="shop">
        <h2>Products</h2>
        <div class="product-list">
        <%
            while (rs.next()) {
                int id = rs.getInt("product_id");
                System.out.println(id);
                System.out.println(rs.getString("product_name"));
        %>    
            <div class="product-card">
                <a href="ProductInfo.jsp?id=<%=id%>">
                    <img src="images/<%=rs.getString("product_name")%>.jpg" alt="<%=rs.getString("product_name")%>"></a>
                    <h3><%=rs.getString("product_name")%></h3>
                    <p><%=rs.getString("price")%></p>
            </div>
        <%
            }
        %>
        </div>
    </section>
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