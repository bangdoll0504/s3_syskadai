<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>処方情報入力</title>
</head>
<body>
    <h1>患者IDを入力してください</h1>
    <form action="view_prescriptions" method="post">
        患者ID: <input type="text" name="patientId" required>
        <input type="submit" value="処方情報を表示">
    </form>
</body>
</html>
