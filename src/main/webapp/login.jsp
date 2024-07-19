<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <form action="login" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="empid"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="emppassword"><br><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
