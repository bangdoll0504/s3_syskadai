<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>過去の保険有効期限を持つ患者一覧</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="styles.css" rel="stylesheet">
<style>
.header {
    background-color: #28a745;
    color: white;
    padding: 20px;
    text-align: center;
    margin-bottom: 20px;
}

.container {
    margin-top: 20px;
    text-align: center;
}

.table-responsive {
    margin-top: 20px;
}

.btn-primary {
    margin-top: 20px;
    width: 200px;
}
</style>
</head>
<body>

    <div class="header">
        <h1>過去の保険有効期限を持つ患者一覧</h1>
    </div>
    <div class="container table-container">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>患者ID</th>
                        <th>姓</th>
                        <th>名</th>
                        <th>保険名</th>
                        <th>保険有効期限</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="patient" items="${patientList}">
                        <tr>
                            <td>${patient.patid}</td>
                            <td>${patient.patlname}</td>
                            <td>${patient.patfname}</td>
                            <td>${patient.hokenmei}</td>
                            <td>${patient.hokenexp}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="container">
        <a href="welcome.jsp" class="btn btn-primary">メニューへ</a>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
