<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("empid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String changedEmpId = (String) request.getAttribute("changedEmpId");  // 変更対象のユーザーID
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>パスワード変更完了</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
    <style>
        .header {
            background-color: #28a745;
            color: white;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        .container {
            margin-top: 20px;
            text-align: center;
        }
        .btn-primary {
            margin-top: 20px;
            width: 200px;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>パスワード変更完了</h1>
</div>
<div class="container">
    <h2>ユーザーID: <%= changedEmpId %> のパスワードが正常に変更されました。</h2>
    <a href="welcome.jsp" class="btn btn-primary">メニューへ</a>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
