<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>処方内容確認</title>
</head>
<body>
    <h1>処方内容確認</h1>
    <form action="complete_prescription" method="post">
        <table>
            <tr>
                <th>Medicine ID</th>
                <th>数量</th>
            </tr>
            <c:forEach var="prescription" items="${prescriptions}">
                <tr>
                    <td>${prescription.medicineid}</td>
                    <td>${prescription.quantity}</td>
                </tr>
            </c:forEach>
        </table>
        <c:forEach var="prescription" items="${prescriptions}">
            <input type="hidden" name="medicineId" value="${prescription.medicineid}">
            <input type="hidden" name="quantity" value="${prescription.quantity}">
        </c:forEach>
        <input type="hidden" name="patientId" value="${param.patientId}">
        <input type="submit" value="処方完了">
    </form>
    <form action="medicine_pat_list.jsp" method="post">
        <input type="hidden" name="patientId" value="${param.patientId}">
        <input type="submit" value="戻る">
    </form>
</body>
</html>
