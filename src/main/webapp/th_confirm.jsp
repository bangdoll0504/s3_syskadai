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
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>入力内容の確認</title>
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
        .form-group p {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .form-group {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .btn-group {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>入力内容の確認</h1>
</div>
<div class="container">
    <form action="th_CompleteServlet" method="post">
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

        <div class="btn-group">
            <button type="submit" class="btn btn-primary">登録</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
