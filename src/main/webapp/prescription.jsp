<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>患者ID入力</title>
</head>
<body>
    <h1>患者IDを入力してください</h1>
    <form action="check_patient" method="post">
        患者ID: <input type="text" name="patientId" required>
        <input type="submit" value="確認">
    </form>
</body>
</html>
