<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>患者ID入力</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h2>患者ID入力フォーム</h2>
    <form action="patient_check" method="post" accept-charset="UTF-8">
        <label for="patid">患者ID:</label>
        <input type="text" id="patid" name="patid" required><br><br>
        <input type="submit" value="確認">
    </form>
</body>
</html>
