<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>パスワード変更</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h1>パスワード変更</h1>
    <form action="confirm_password.jsp" method="post">
        <label for="userid">ユーザーID:</label>
        <input type="text" name="userid" id="userid" required><br>

        <label for="current_password">現在のパスワード:</label>
        <input type="password" name="current_password" id="current_password" required><br>

        <label for="new_password">新しいパスワード:</label>
        <input type="password" name="new_password" id="new_password" required><br>

        <label for="confirm_password">新しいパスワード(確認):</label>
        <input type="password" name="confirm_password" id="confirm_password" required><br>

        <input type="submit" value="確認">
    </form>
</body>
</html>
