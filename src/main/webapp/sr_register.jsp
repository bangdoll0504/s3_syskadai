<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>仕入業者登録</title>
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
        .form-group {
            margin-bottom: 15px;
        }
        .logout {
            margin-top: 20px;
            text-align: center;
        }
        .logout a {
            color: #dc3545;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>仕入業者登録</h1>
</div>
<div class="container">
    <form action="sr_RegisterServlet" method="post">
        <div class="form-group">
            <label for="id">仕入ID:</label>
            <input type="text" class="form-control" name="id" value="${id != null ? id : ''}" />
        </div>
        <div class="form-group">
            <label for="name">仕入業者名:</label>
            <input type="text" class="form-control" name="name" value="${name != null ? name : ''}" />
        </div>
        <div class="form-group">
            <label for="address">住所:</label>
            <input type="text" class="form-control" name="address" value="${address != null ? address : ''}" />
        </div>
        <div class="form-group">
            <label for="phone">電話番号:</label>
            <input type="text" class="form-control" name="phone" value="${phone != null ? phone : ''}" />
        </div>
        <div class="form-group">
            <label for="capital">資本金:</label>
            <input type="text" class="form-control" name="capital" value="${capital != null ? capital : ''}" />
        </div>
        <div class="form-group">
            <label for="delivery_date">納期:</label>
            <input type="text" class="form-control" name="delivery_date" value="${delivery_date != null ? delivery_date : ''}" />
        </div>
        <button type="submit" class="btn btn-primary btn-block">確認</button>
    </form>
    <c:if test="${not empty error}">
        <p class="error-message text-center">${error}</p>
    </c:if>
    <div class="logout">
        <a href="welcome.jsp">ログアウト</a>
        <a href="logout.jsp">ログアウト</a>
    </div>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
