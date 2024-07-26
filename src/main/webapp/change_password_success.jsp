<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("empid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Password Change Success</title>
    <link rel="stylesheet" href="styles.css"> <!-- 共通CSSファイルをインクルード -->
</head>
<body>
    <div class="header">
        <h1>Password Change Successful</h1>
    </div>
    <div class="container">
        <p>Your password has been changed successfully.</p>
        <a href="login.jsp">Go to Login</a>
    </div>
</body>
</html>
