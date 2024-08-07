<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>従業員登録</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <h1>従業員登録</h1>
    </div>
    <div class="container">
        <!-- 送信先を変更 -->
        <form action="e_register_confirm.jsp" method="post">
            <div class="form-group">
                <label for="empid">従業員ID:</label>
                <input type="text" class="form-control" name="empid" id="empid" required>
            </div>
            <div class="form-group">
                <label for="empfname">名前（姓）:</label>
                <input type="text" class="form-control" name="empfname" id="empfname" required>
            </div>
            <div class="form-group">
                <label for="emplname">名前（名）:</label>
                <input type="text" class="form-control" name="emplname" id="emplname" required>
            </div>
            <div class="form-group">
                <label for="emppasswordd">パスワード:</label>
                <input type="password" class="form-control" name="emppasswordd" id="emppasswordd" required>
            </div>
            <div class="form-group">
                <label for="emppassword_confirm">パスワード（確認）:</label>
                <input type="password" class="form-control" name="emppassword_confirm" id="emppassword_confirm" required>
            </div>
            <div class="form-group">
                <label for="emprole">役割:</label>
                <select class="form-control" name="emprole" id="emprole" required>
                    <option value="1">管理者</option>
                    <option value="2">受付</option>
                    <option value="3">医師</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">確認</button>
        </form>
        <div class="logout">
            <a href="login.jsp">ログインページに戻る</a>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
