<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>確認ページ</title>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .confirmation-details {
            margin-bottom: 20px;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">確認ページ</h2>
    <div class="confirmation-details mt-4">
        <p><strong>仕入ID:</strong> <%= request.getAttribute("id") %></p>
        <p><strong>仕入業者名:</strong> <%= request.getAttribute("name") %></p>
        <p><strong>仕入業者住所:</strong> <%= request.getAttribute("addr") %></p>
        <p><strong>電話番号:</strong> <%= request.getAttribute("phone") %></p>
        <p><strong>資本金:</strong> <%= request.getAttribute("capital") %></p>
        <p><strong>納期:</strong> <%= request.getAttribute("delivery_date") %></p>
    </div>
    <div class="btn-group mt-4">
        <form action="sr_CompleteServlet" method="post">
            <input type="hidden" name="id" value="<%= request.getAttribute("id") %>"/>
            <input type="hidden" name="name" value="<%= request.getAttribute("name") %>"/>
            <input type="hidden" name="addr" value="<%= request.getAttribute("addr") %>"/>
            <input type="hidden" name="phone" value="<%= request.getAttribute("phone") %>"/>
            <input type="hidden" name="capital" value="<%= request.getAttribute("capital") %>"/>
            <input type="hidden" name="delivery_date" value="<%= request.getAttribute("delivery_date") %>"/>
            <button type="submit" class="btn btn-primary">OK</button>
        </form>
        <form action="sr_register.jsp" method="post">
            <button type="submit" class="btn btn-secondary">戻る</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
