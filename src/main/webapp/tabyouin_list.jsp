<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>他病院一覧</title>
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
        .table-container {
            margin-top: 20px;
        }
        .menu-link {
            margin-top: 20px;
            text-align: center;
        }
        .menu-link a {
            color: #007bff;
            text-decoration: none;
        }
        .menu-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>他病院一覧</h1>
</div>

<div class="container table-container">
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>他病院ID</th>
                    <th>病院名</th>
                    <th>住所</th>
                    <th>電話番号</th>
                    <th>資本金</th>
                    <th>救急対応</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${tabyouinList}" var="tabyouin">
                    <tr>
                        <td>${tabyouin.tabyouinid}</td>
                        <td>${tabyouin.tabyouinmei}</td>
                        <td>${tabyouin.tabyouinaddress}</td>
                        <td>${tabyouin.tabyouintel}</td>
                        <td>${tabyouin.tabyouinshihonkin}</td>
                        <td>${tabyouin.kyukyu == 1 ? "対応" : "非対応"}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="menu-link">
        <a href="welcome.jsp">メニューへ</a>
    </div>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
