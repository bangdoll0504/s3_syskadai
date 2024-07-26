<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>他病院登録</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h1>他病院登録</h1>
    <form action="th_RegisterServlet" method="post">
        <label for="tabyouinid">病院ID:</label>
        <input type="text" name="tabyouinid" id="tabyouinid" required><br>
        
        <label for="tabyouinmei">病院名:</label>
        <input type="text" name="tabyouinmei" id="tabyouinmei" required><br>
        
        <label for="tabyouinaddress">住所:</label>
        <input type="text" name="tabyouinaddress" id="tabyouinaddress" required><br>

        <label for="tabyouintel">電話番号:</label>
        <input type="text" name="tabyouintel" id="tabyouintel" required><br>
        
        <label for="tabyouinshihonkin">資本金:</label>
        <input type="text" name="tabyouinshihonkin" id="tabyouinshihonkin" required><br>

        <label for="kyukyu">救急:</label>
        <input type="number" name="kyukyu" id="kyukyu" required><br>
        
        <input type="submit" value="確認">
    </form>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
            out.println("<p style='color:red;'>" + error + "</p>");
        }
    %>
</body>
</html>
