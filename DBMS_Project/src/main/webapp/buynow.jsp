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
        <a href="index.jsp">Home</a>
        <a href="ProductList.jsp">Shop</a>
        <a href="ContactUs.jsp">Contact</a>
    </nav>

<!-- Signup Form -->
<%
        // Retrieve the username from the session
        PrintWriter out1 = response.getWriter();
		HttpSession session1 = request.getSession();
		 String id = request.getParameter("id");
		    String quantity = request.getParameter("quantity");
		    String mode = request.getParameter("mode");

		    if (id != null && quantity != null && mode != null) {
		        session1.setAttribute("id", id);
		        session1.setAttribute("quantity", quantity);
		        session1.setAttribute("mode", mode);
		    } 
		String display="none";
        Long phone = (Long)session.getAttribute("Phone");

        if (phone != null) {
            
            display="block";      
        } else {
            // Redirect to login page with return parameters
            String returnUrl = "buynow.jsp";
            response.sendRedirect("Login.jsp?returnUrl=" + returnUrl);
            return;
            
        }
    %>
<div id="Sign-Up" style="display:<%= display %>;"> 
	
    <fieldset>
    	<label><p>"Logged in as <%= phone %> !"</p></label>
        <form method="POST" action="groceryServlet"> 
        
            <table>
                
                <input type="hidden" value="<%= session1.getAttribute("id") %>" name="id"/>
                <input type="hidden" value="<%= session1.getAttribute("quantity") %>" name="quantity"/>
                <input type="hidden" value="<%= session1.getAttribute("mode") %>" name="mode"/>
                <input type="hidden" value="<%= phone %>" name="phone"/>
                <tr>
                    <td colspan="2"><input type="submit" name="submit" value="Checkout"></td>
                </tr>
            </table> 
        </form> 
    </fieldset> 
</div> 

</body>
</html>
