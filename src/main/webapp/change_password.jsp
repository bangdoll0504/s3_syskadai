<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*" %>
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
    <title>パスワード変更</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css">
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
        .btn-primary {
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>パスワード変更</h1>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="confirm_password.jsp" method="post">
                <div class="form-group">
                    <label for="empid">ユーザーID:</label>
                    <input type="text" class="form-control" id="empid" name="empid" value="<%= session.getAttribute("empid") %>" readonly>
                </div>
                <div class="form-group">
                    <label for="new_Password">新しいパスワード:</label>
                    <input type="password" class="form-control" id="new_Password" name="new_Password" required>
                </div>
                <div class="form-group">
                    <label for="confirm_Password">新しいパスワード（確認用）:</label>
                    <input type="password" class="form-control" id="confirm_Password" name="confirm_Password" required>
                </div>
                <button type="submit" class="btn btn-primary">パスワード変更</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
