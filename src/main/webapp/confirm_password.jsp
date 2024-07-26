<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    String newPassword = request.getParameter("new_password");
    String confirmPassword = request.getParameter("confirm_password");

    if (!newPassword.equals(confirmPassword)) {
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println("<p>新しいパスワードと確認パスワードが一致しません。</p>");
        response.getWriter().println("<a href='change_password.jsp'>戻る</a>");
        return;
    }
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
    <h1>入力内容の確認</h1>
    <form action="change_password" method="post">
        <p>ユーザーID: <%= request.getParameter("userid") %></p>
        <input type="hidden" name="userid" value="<%= request.getParameter("userid") %>">

        <p>現在のパスワード: ****</p>
        <input type="hidden" name="current_password" value="<%= request.getParameter("current_password") %>">

        <p>新しいパスワード: ****</p>
        <input type="hidden" name="new_password" value="<%= request.getParameter("new_password") %>">

        <input type="submit" value="変更">
    </form>
</body>
</html>
