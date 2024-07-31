<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
    <title>確認</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .confirm-group p {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .confirm-group input[type="submit"] {
            margin-top: 20px;
        }
        .form-group {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="text-center">入力内容の確認</h1>
    <form action="th_CompleteServlet" method="post" class="confirm-group mt-4">
        <div class="form-group">
            <p>病院ID: <%= request.getParameter("tabyouinid") %></p>
            <input type="hidden" name="tabyouinid" value="<%= request.getParameter("tabyouinid") %>">
        </div>

        <div class="form-group">
            <p>病院名: <%= request.getParameter("tabyouinmei") %></p>
            <input type="hidden" name="tabyouinmei" value="<%= request.getParameter("tabyouinmei") %>">
        </div>

        <div class="form-group">
            <p>住所: <%= request.getParameter("tabyouinaddress") %></p>
            <input type="hidden" name="tabyouinaddress" value="<%= request.getParameter("tabyouinaddress") %>">
        </div>

        <div class="form-group">
            <p>電話番号: <%= request.getParameter("tabyouintel") %></p>
            <input type="hidden" name="tabyouintel" value="<%= request.getParameter("tabyouintel") %>">
        </div>

        <div class="form-group">
            <p>資本金: <%= request.getParameter("tabyouinshihonkin") %></p>
            <input type="hidden" name="tabyouinshihonkin" value="<%= request.getParameter("tabyouinshihonkin") %>">
        </div>

        <div class="form-group">
            <p>救急対応: <%= request.getParameter("kyukyu").equals("1") ? "対応" : "非対応" %></p>
            <input type="hidden" name="kyukyu" value="<%= request.getParameter("kyukyu") %>">
        </div>

        <button type="submit" class="btn btn-primary btn-block">登録</button>
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
