<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine List</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h1>Medicine List</h1>
    <table border="1">
        <tr>
            <th>Medicine ID</th>
            <th>Medicine Name</th>
            <th>Unit</th>
        </tr>
        <c:forEach var="medicine" items="${medicines}">
            <tr>
                <td><c:out value="${medicine.medicineId}"/></td>
                <td><c:out value="${medicine.medicineName}"/></td>
                <td><c:out value="${medicine.unit}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
