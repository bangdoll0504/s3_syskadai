<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
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
    <title>他病院登録</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css"> <!-- 実際のパスに変更してください -->
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
        .form-group label {
            font-weight: bold;
        }
        .form-group input {
            margin-bottom: 15px;
        }
        .logout {
            margin-top: 20px;
            text-align: center;
        }
        .logout a {
            color: #dc3545;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>他病院登録</h1>
    </div>
    <div class="container">
        <form action="th_RegisterServlet" method="post">
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
                <label for="kyukyu">救急対応:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="kyukyu" id="kyukyu1" value="1" required>
                    <label class="form-check-label" for="kyukyu1">対応</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="kyukyu" id="kyukyu0" value="0" required>
                    <label class="form-check-label" for="kyukyu0">非対応</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">登録</button>
        </form>
        <div class="logout">
            <a href="welcome.jsp">メニューへ</a><br>
            <a href="logout.jsp">ログアウト</a>
        </div>
    </div>
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
