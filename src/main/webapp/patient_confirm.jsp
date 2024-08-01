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
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>確認画面</title>
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
        .btn-group {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>確認画面</h1>
</div>
<div class="container">
    <form action="patient_register" method="post" accept-charset="UTF-8">
        <div class="form-group">
            <p>患者ID: <%= request.getAttribute("patid") %></p>
            <input type="hidden" name="patid" value="<%= request.getAttribute("patid") %>">
        </div>
        <div class="form-group">
            <p>名前: <%= request.getAttribute("patfname") %></p>
            <input type="hidden" name="patfname" value="<%= request.getAttribute("patfname") %>">
        </div>
        <div class="form-group">
            <p>姓: <%= request.getAttribute("patlname") %></p>
            <input type="hidden" name="patlname" value="<%= request.getAttribute("patlname") %>">
        </div>
        <div class="form-group">
            <p>保険名: <%= request.getAttribute("hokenmei") %></p>
            <input type="hidden" name="hokenmei" value="<%= request.getAttribute("hokenmei") %>">
        </div>
        <div class="form-group">
            <p>保険有効期限: <%= request.getAttribute("hokenexp") %></p>
            <input type="hidden" name="hokenexp" value="<%= request.getAttribute("hokenexp") %>">
        </div>
        <div class="btn-group">
            <button type="submit" class="btn btn-primary">登録</button>
            <form action="patient_register.jsp" method="post">
                <button type="submit" class="btn btn-secondary">戻る</button>
            </form>
        </div>
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
