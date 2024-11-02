<%@ page import="java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipment</title>
<link rel="stylesheet" type="text/css" href="./css/sign_up.css">
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

    #Sign-Up {
        margin: 50px auto;
        width: 40%;
        padding: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    fieldset {
        border: none;
    }

    legend {
        font-size: 1.5em;
        color: #4CAF50;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        margin: 0 auto;
        text-align: left;
    }

    table td {
        padding: 10px 0;
    }

    input[type="text"], input[type="number"], input[type="tel"], input[type="email"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #388E3C;
    }

</style>
</head>
<body>

<!-- Navigation -->
<nav>
        <a href="index.html">Home</a>
        <a href="ProductList.jsp">Shop</a>
        <a href="ContactUs.html">About Us</a>
        <a href="ContactUs.html">Contact</a>
    </nav>

<!-- Signup Form -->
<%
        // Retrieve the username from the session
        PrintWriter out1 = response.getWriter();
		String display="none";
		String displaySubmit="none";
        Long phone = (Long)session.getAttribute("Phone");

        if (phone != null) {
            out1.println("<p>Logged in as " + phone + "!</p>");
            displaySubmit="block";
            
        } else {
            display="block";
        }
    %>
<div id="Sign-Up" style="display:<%= display %>;"> 
    <fieldset>
        <legend>Create an Account</legend> 
        <form method="POST" action="LoginServlet"> 
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" placeholder="Name" required></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><input type="tel" name="phone" placeholder="Phone" pattern="[0-9]{10}" required></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="pass" placeholder="Password" required></td>
                </tr>
                <input type="hidden" value="<%= request.getParameter("id") %>" name="id"/>
                <input type="hidden" value="<%= request.getParameter("quantity") %>" name="quantity"/>
                <input type="hidden" value="<%= request.getParameter("mode") %>" name="mode"/>
                <tr>
                    <td colspan="2"><input type="submit" name="submit" value="Login"></td>
                </tr>
            </table> 
        </form> 
    </fieldset> 
</div> 

</body>
</html>
