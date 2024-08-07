<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
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
    <title>従業員登録確認</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <h1>従業員登録確認</h1>
    </div>
    <div class="container">
        <p>以下の情報で登録を行います。よろしいですか？</p>

        <form action="e_register" method="post">
            <div class="form-group">
                <label for="empid">従業員ID:</label>
                <input type="text" class="form-control" id="empid" value="<%= request.getParameter("empid") %>" readonly>
                <input type="hidden" name="empid" value="<%= request.getParameter("empid") %>">
            </div>
            <div class="form-group">
                <label for="empfname">名前（姓）:</label>
                <input type="text" class="form-control" id="empfname" value="<%= request.getParameter("empfname") %>" readonly>
                <input type="hidden" name="empfname" value="<%= request.getParameter("empfname") %>">
            </div>
            <div class="form-group">
                <label for="emplname">名前（名）:</label>
                <input type="text" class="form-control" id="emplname" value="<%= request.getParameter("emplname") %>" readonly>
                <input type="hidden" name="emplname" value="<%= request.getParameter("emplname") %>">
            </div>
            <div class="form-group">
                <label for="emprole">役割:</label>
                <input type="text" class="form-control" id="emprole" value="<%= request.getParameter("emprole") %>" readonly>
                <input type="hidden" name="emprole" value="<%= request.getParameter("emprole") %>">
            </div>
            <div class="form-group">
                <label for="emppasswordd">パスワード:</label>
                <input type="password" class="form-control" id="emppasswordd" value="<%= request.getParameter("emppasswordd") %>" readonly>
                <input type="hidden" name="emppasswordd" value="<%= request.getParameter("emppasswordd") %>">
            </div>

            <button type="submit" class="btn btn-primary">登録</button>
        </form>

        <form action="e_register.jsp" method="post" style="margin-top: 20px;">
            <button type="submit" class="btn btn-secondary">戻る</button>
        </form>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
