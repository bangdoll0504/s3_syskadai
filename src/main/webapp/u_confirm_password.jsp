<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>パスワード確認</title>
</head>
<body>
    <h1>パスワード確認</h1>
    <p>新しいパスワードを確認してください。</p>
    <form action="u_change_password" method="post">
        <input type="hidden" name="newPassword" value="${param.newPassword}">
        <input type="hidden" name="confirmPassword" value="${param.confirmPassword}">
        新しいパスワード: ${param.newPassword}<br>
        <input type="submit" value="変更">
    </form>
</body>
</html>
