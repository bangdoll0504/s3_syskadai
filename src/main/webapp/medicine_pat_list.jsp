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
    <title>Medicine 一覧</title>
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
        .btn-primary {
            margin-top: 20px;
        }
        .table {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Medicine 一覧</h1>
</div>
<div class="container">
    <form action="prescribe_medicine" method="post" accept-charset="UTF-8">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Medicine ID</th>
                        <th>Medicine 名</th>
                        <th>数量</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="medicine" items="${medicines}">
                        <tr>
                            <td>${medicine.medicineId}</td>
                            <td>${medicine.medicineName}</td>
                            <td>
                                <input type="number" class="form-control" name="quantity_${medicine.medicineId}" min="0" required>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <input type="hidden" name="patientId" value="${param.patientId}">
        <button type="submit" class="btn btn-primary btn-block">処方する</button>
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
