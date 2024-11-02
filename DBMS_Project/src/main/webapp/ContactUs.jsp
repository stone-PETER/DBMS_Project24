<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css" href="./css/grocery.css">
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
		<form  method="GET" action="ProductList.jsp"  id="searchform"> 
	      <input  type="text" name="search"> 
	      <input  type="submit" name="submit" value="Search"> 
	    </form>  
	    <h1><font color=red>Contact Us</font></h1>
	    <p><center><font color="white">If you like our work, please feel free to email us. Our details are:</font></center></p>
	    <p><strong><center><font color="white">Alan : voa.alan@gmail.com</font></center></strong></p>
	    <p><strong><center><font color="white">Chackochan : chackochanme@gmail.com</font></center></strong></p>
	    <p><strong><center><font color="white">Bhanumathy : bhanu@gmail.com</font></center></strong></p>
	
</body>
</html>

<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css" href="./css/grocery.css">
</head>
<body>
	<ul class="nav">
			<li><a href="index.html" target="">Home</a></li>
			<li><a href="categories.jsp" target="">Categories</a></li>
			<li><a href="About Us.html" target="">About Us</a></li>
			<li><a href="" target="">Contact Us</a></li>
		</ul>
		<form  method="GET" action="ProductList.jsp"  id="searchform"> 
	      <input  type="text" name="search"> 
	      <input  type="submit" name="submit" value="Search"> 
	    </form>  
	    <h1>Contact Us</h1>
	    <p>If you like our work, please feel free to email us. Our details are:</p>
	    <p><strong>Prakruthi S : prakruthi@gmail.com</strong></p>
	    <p><strong>Palak : palak@gmail.com</strong></p>
	    <p><strong>Tazeen : tazeen@gmail.com</strong></p>
	
</body>
</html> -->