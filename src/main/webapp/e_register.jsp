<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>従業員登録</title>
</head>
<body>
    <h1>従業員登録</h1>
    <form action="e_register" method="post">
        <label for="empid">従業員ID:</label>
        <input type="text" name="empid" id="empid" required><br>

        <label for="empfname">名前（姓）:</label>
        <input type="text" name="empfname" id="empfname" required><br>

        <label for="emplname">名前（名）:</label>
        <input type="text" name="emplname" id="emplname" required><br>

        <label for="emppasswordd">パスワード:</label>
        <input type="password" name="emppasswordd" id="emppasswordd" required><br>

        <label for="emppassword_confirm">パスワード（確認）:</label>
        <input type="password" name="emppassword_confirm" id="emppassword_confirm" required><br>

        <label for="emprole">役割:</label>
        <select name="emprole" id="emprole" required>
            <option value="1">管理者</option>
            <option value="2">受付</option>
            <option value="3">医師</option>
        </select><br>

        <input type="submit" value="登録">
    </form>
</body>
</html>
