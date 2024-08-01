<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>処方内容確認</title>
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
        .btn-primary, .btn-secondary {
            margin-top: 20px;
            width: 100%;
        }
        .table {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>処方内容確認</h1>
</div>
<div class="container">
    <form action="complete_prescription" method="post" accept-charset="UTF-8">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Medicine ID</th>
                        <th>数量</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prescription" items="${prescriptions}">
                        <tr>
                            <td>${prescription.medicineid}</td>
                            <td>${prescription.quantity}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <c:forEach var="prescription" items="${prescriptions}">
            <input type="hidden" name="medicineId" value="${prescription.medicineid}">
            <input type="hidden" name="quantity" value="${prescription.quantity}">
        </c:forEach>
        <input type="hidden" name="patientId" value="${param.patientId}">
        <button type="submit" class="btn btn-primary">処方完了</button>
    </form>
    <form action="medicine_pat_list.jsp" method="post">
        <input type="hidden" name="patientId" value="${param.patientId}">
        <button type="submit" class="btn btn-secondary">戻る</button>
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
