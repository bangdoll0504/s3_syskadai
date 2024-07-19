<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine 一覧</title>
</head>
<body>
    <h1>Medicine 一覧</h1>
    <form action="prescribe_medicine" method="post">
        <table>
            <tr>
                <th>Medicine ID</th>
                <th>Medicine 名</th>
                <th>数量</th>
            </tr>
            <c:forEach var="medicine" items="${medicines}">
                <tr>
                    <td>${medicine.medicineId}</td>
                    <td>${medicine.medicineName}</td>
                    <td>
                        <input type="number" name="quantity_${medicine.medicineId}" min="0" required>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <input type="hidden" name="patientId" value="${param.patientId}">
        <input type="submit" value="処方する">
    </form>
</body>
</html>
