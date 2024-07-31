<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html>
<head>
<meta charset="UTF-8">
<title>他病院登録</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input {
            margin-bottom: 15px;
        }
        .error-message {
            color: red;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="text-center">他病院登録</h1>
    <form action="th_RegisterServlet" method="post" class="mt-4">
        <div class="form-group">
            <label for="tabyouinid">病院ID:</label>
            <input type="text" class="form-control" name="tabyouinid" id="tabyouinid" required>
        </div>
        
        <div class="form-group">
            <label for="tabyouinmei">病院名:</label>
            <input type="text" class="form-control" name="tabyouinmei" id="tabyouinmei" required>
        </div>
        
        <div class="form-group">
            <label for="tabyouinaddress">住所:</label>
            <input type="text" class="form-control" name="tabyouinaddress" id="tabyouinaddress" required>
        </div>

        <div class="form-group">
            <label for="tabyouintel">電話番号:</label>
            <input type="text" class="form-control" name="tabyouintel" id="tabyouintel" required>
        </div>
        
        <div class="form-group">
            <label for="tabyouinshihonkin">資本金:</label>
            <input type="text" class="form-control" name="tabyouinshihonkin" id="tabyouinshihonkin" required>
        </div>

         <div class="form-group">
            <label for="kyukyu">救急:</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="kyukyu" id="kyukyu" value="1" required>
                <label class="form-check-label" for="kyukyu">対応</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="kyukyu" id="kyukyu" value="0" required>
                <label class="form-check-label" for="kyukyu">非対応</label>
            </div>
        </div>
        
        <button type="submit" class="btn btn-primary btn-block">確認</button>
    </form>

    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <p class="error-message"><%= error %></p>
    <% 
        } 
    %>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
