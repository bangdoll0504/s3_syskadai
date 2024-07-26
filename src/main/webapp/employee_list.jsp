<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>従業員一覧</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h1>従業員一覧</h1>
    <table border="1">
        <tr>
            <th>従業員ID</th>
            <th>名前（姓）</th>
            <th>名前（名）</th>
            <th>パスワード（ハッシュ）</th>
            <th>役割</th>
        </tr>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.empid}</td>
                <td>${employee.empfname}</td>
                <td>${employee.emplname}</td>
                <td>${employee.emppassword_hash}</td>
                <td>${employee.emprole}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
