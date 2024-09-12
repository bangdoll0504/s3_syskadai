<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    // セッション情報の確認
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("empid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String c_empid = request.getParameter("c_empid");
    String newPassword = request.getParameter("new_Password");
    String confirmPassword = request.getParameter("confirm_Password");

    if (!newPassword.equals(confirmPassword)) {
        response.sendRedirect("change_password.jsp?error=Passwords do not match");
        return;
    }

    // セッションに必要な情報を保存
    session.setAttribute("newPassword", newPassword);
    session.setAttribute("c_empid", c_empid);
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>パスワード変更確認</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <h1>パスワード変更確認</h1>
    </div>
    <div class="container">
        <p>以下の内容でパスワードを変更します。よろしいですか？</p>

        <form action="ChangePasswordServlet" method="post">
            <div class="form-group">
                <label for="c_empid">変更対象のユーザーID:</label>
                <input type="text" class="form-control" id="c_empid" value="<%= c_empid %>" readonly>
                <input type="hidden" name="c_empid" value="<%= c_empid %>">
            </div>
            <div class="form-group">
                <label for="new_Password">新しいパスワード:</label>
                <input type="password" class="form-control" id="new_Password" value="<%= newPassword %>" readonly>
                <input type="hidden" name="new_Password" value="<%= newPassword %>">
            </div>

            <button type="submit" class="btn btn-primary">変更する</button>
        </form>

        <form action="change_password.jsp" method="post" style="margin-top: 20px;">
            <button type="submit" class="btn btn-secondary">戻る</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
