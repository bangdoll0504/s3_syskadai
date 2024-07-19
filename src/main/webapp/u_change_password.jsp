<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>パスワード変更</title>
</head>
<body>
    <h1>パスワード変更</h1>
    <form action="u_confirm_password.jsp" method="post">
        新しいパスワード: <input type="password" name="newPassword" required><br>
        パスワード確認: <input type="password" name="confirmPassword" required><br>
        <input type="submit" value="確認">
    </form>
</body>
</html>
