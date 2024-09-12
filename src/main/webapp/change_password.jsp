<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*" %>
<%
    // セッション情報の確認
    //HttpSession session = request.getSession(false);  // 既存のセッションを取得
    if (session == null || session.getAttribute("empid") == null) {
        // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
        response.sendRedirect("login.jsp");
        return;
    }

    String loggedInEmpId = (String) session.getAttribute("empid");  // ログインしているユーザーID
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>パスワード変更</title>
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
        <h1>パスワード変更フォーム</h1>
    </div>
    <div class="container">
        <form action="confirm_password.jsp" method="post" accept-charset="UTF-8">
            <div class="form-group">
                <label for="c_empid">変更対象のユーザーID:</label>
                <input type="text" class="form-control" id="c_empid" name="c_empid" required>
            </div>
            <div class="form-group">
                <label for="new_Password">新しいパスワード:</label>
                <input type="password" class="form-control" id="new_Password" name="new_Password" required>
            </div>
            <div class="form-group">
                <label for="confirm_Password">新しいパスワード（確認用）:</label>
                <input type="password" class="form-control" id="confirm_Password" name="confirm_Password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">確認画面へ</button>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
