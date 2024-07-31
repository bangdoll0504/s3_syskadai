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
<html>
<head>
    <meta charset="UTF-8">
    <title>パスワード変更</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css">
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
                    <label for="userid">ユーザーID:</label>
                    <input type="text" class="form-control" id="empid" name="empid" value="<%= session.getAttribute("empid") %>" readonly>
                </div>
                 <div class="form-group">
                    <label for="newPassword">新しいパスワード:</label>
                    <input type="password" class="form-control" id="new_Password" name="new_Password" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">新しいパスワード（確認用）:</label>
                    <input type="password" class="form-control" id="confirm_Password" name="confirm_Password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">パスワード変更</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
