<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <label for="username">Phone:</label>
        <input type="text" id="name" name="Phone" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="hidden" name="returnUrl" value="<%= request.getParameter("returnUrl") %>">
        <input type="submit" value="Sign In">
    </form>
</body>
</html>