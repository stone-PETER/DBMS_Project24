<!DOCTYPE html>
<html>
<head>
    <title>Create Account</title>
</head>
<body>
    <h2>Create Account</h2>
    <form action="CreateAccountServlet" method="post">
        <label for="username">Name:</label>
        <input type="text" id="username" name="Name" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <label for="email">Phone:</label>
        <input type="email" id="email" name="Phone" required><br>
        <input type="submit" value="Create Account">
    </form>
</body>
</html>