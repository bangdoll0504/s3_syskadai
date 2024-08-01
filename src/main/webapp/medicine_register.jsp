<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.example.Shiiregyosha"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if (session == null || session.getAttribute("empid") == null) {
	response.sendRedirect("login.jsp");
	return;
}

String empid = (String) session.getAttribute("empid");
int emprole = (Integer) session.getAttribute("userRole");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>薬剤登録</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
    <style>
        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        .container {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>薬剤登録</h1>
</div>
<div class="container">
    <form action="MedicineRegisterServlet" method="post">
        <div class="form-group">
            <label for="medicineid">薬剤ID:</label>
            <input type="text" class="form-control" id="medicineid" name="medicineid" required>
        </div>
        <div class="form-group">
            <label for="medicinename">薬剤名:</label>
            <input type="text" class="form-control" id="medicinename" name="medicinename" required>
        </div>
        <div class="form-group">
            <label for="unit">単位:</label>
            <input type="text" class="form-control" id="unit" name="unit" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">登録</button>
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
