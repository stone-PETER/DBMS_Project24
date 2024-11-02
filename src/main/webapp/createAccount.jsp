<!DOCTYPE html>
<html>
<head>
    <title>Create Account</title>
</head>
<body>

	<header>
	<% 
	String loginUrl="Login.jsp?returnUrl=" + request.getParameter("returnUrl");
	String SignupUrl="createAccount.jsp?returnUrl=" + request.getParameter("returnUrl");
	%>
        <h1>Welcome to Fresh Grocery Store</h1>
        <a href="loginUrl" class="login-btn">Login</a>
        <a href="createAccount.jsp" class="signup-btn">Sign Up</a>
    </header>
    <h2>Create Account</h2>
    <form action="createAccountServlet" method="post">
        <label for="username">Name:</label>
        <input type="text" id="username" name="Name" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <label for="Phone">Phone:</label>
        <input type="number" id="email" name="Phone" required><br>
        <input type="hidden" name="returnUrl" value="<%= request.getParameter("returnUrl") %>">
        <input type="submit" value="Create Account">
    </form>
</body>
</html>