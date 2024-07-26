<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tabyouin List</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h1>Tabyouin List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Tel</th>
            <th>Capital</th>
            <th>Holidays</th>
        </tr>
        <c:forEach items="${tabyouinList}" var="tabyouin">
            <tr>
                <td>${tabyouin.tabyouinid}</td>
                <td>${tabyouin.tabyouinmei}</td>
                <td>${tabyouin.tabyouinaddress}</td>
                <td>${tabyouin.tabyouintel}</td>
                <td>${tabyouin.tabyouinshihonkin}</td>
                <td>${tabyouin.kyukyu}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
