<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>患者一覧</title>
</head>
<body>
    <h2>患者一覧</h2>
    <table border="1">
        <tr>
            <th>患者ID</th>
            <th>名前</th>
            <th>姓</th>
            <th>保険名</th>
            <th>保険有効期限</th>
        </tr>
        <c:forEach var="patient" items="${patientList}">
            <tr>
                <td>${patient.patid}</td>
                <td>${patient.patfname}</td>
                <td>${patient.patlname}</td>
                <td>${patient.hokenmei}</td>
                <td>${patient.hokenexp}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
