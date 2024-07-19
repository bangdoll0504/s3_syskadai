<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>処方一覧</title>
</head>
<body>
    <h1>処方一覧</h1>
    <table>
        <tr>
            <th>処方ID</th>
            <th>処方日付</th>
            <th>患者ID</th>
            <th>Medicine ID</th>
            <th>数量</th>
        </tr>
        <c:forEach var="prescription" items="${prescriptions}">
            <tr>
                <td>${prescription.prescriptionId}</td>
                <td>${prescription.prescriptionDate}</td>
                <td>${prescription.patientId}</td>
                <td>${prescription.medicineid}</td>
                <td>${prescription.quantity}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
