<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("empid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String empid = (String) session.getAttribute("empid");
    int emprole = (Integer) session.getAttribute("userRole");
%>
<%
    request.setCharacterEncoding("UTF-8");

    String newPassword = request.getParameter("new_Password");
    String confirmPassword = request.getParameter("confirm_Password");

    if (newPassword == null || confirmPassword == null || !newPassword.equals(confirmPassword)) {
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println("<p>新しいパスワードと確認パスワードが一致しません。</p>");
        response.getWriter().println("<a href='change_password.jsp'>戻る</a>");
        return;
    }

    // パスワード一致確認後、セッションに保存
    session.setAttribute("newPassword", newPassword);
    // response.sendRedirect("change_password");
%>
<!DOCTYPE html>
<html>
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
    <h1>入力内容の確認</h1>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="change_password" method="post">
                <div class="form-group">
                    <label for="userid">ユーザーID:</label>
                    <p id="userid"><%= request.getParameter("empid") %></p>
                    <input type="hidden" name="empid" value="<%= request.getParameter("empid") %>">
                </div>
                <div class="form-group">
                    <label for="newPassword">新しいパスワード:</label>
                    <p id="newPassword">****</p>
                    <input type="hidden" name="new_password" value="<%= request.getParameter("new_Password") %>">
                </div>
                <button type="submit" class="btn btn-primary btn-block">変更</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
