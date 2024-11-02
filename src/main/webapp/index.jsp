<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grocery Store</title>
    <link rel="stylesheet" href="css/index.css">
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
        <a href="ProductList.jsp?search=%25&submit=Search">Shop</a>
        <a href="ContactUs.jsp">Contact</a>
    </nav>

    <section class="hero-section">
        <h1>Fresh Produce Delivered Daily</h1>
        <p>Your one-stop shop for fresh fruits, vegetables, and groceries</p>
        <a href="ProductList.jsp"><button class="cta-button">Shop Now</button></a>
        <form  method="GET" action="ProductList.jsp"  id="searchform"> 
	      <input placeholder="Search" type="text" name="search"> 
	      <input  type="submit" name="submit" value="Search"> 
	    </form>
    </section>

    <section class="product-showcase" id="shop">
        <h2>Featured Products</h2>
        <div class="product-list">
            <div class="product-card">
                <img src="images/apple.jpg" alt="Fresh Apples">
                <h3>Fresh Apples</h3>
                <p>₹150/kg</p>
            </div>
            <div class="product-card">
                <img src="images/banana.jpg" alt="Organic Bananas">
                <h3>Organic Bananas</h3>
                <p>₹50/dozen</p>
            </div>
            <div class="product-card">
                <img src="images/bread.jpg" alt="Whole Wheat Bread">
                <h3>Whole Wheat Bread</h3>
                <p>₹45/loaf</p>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Fresh Grocery Store. All rights reserved.</p>
    </footer>

</body>
</html>