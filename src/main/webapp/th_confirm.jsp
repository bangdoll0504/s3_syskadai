<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>確認</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h1>入力内容の確認</h1>
    <form action="th_RegisterServlet" method="post">
        <p>病院ID: <%= request.getParameter("tabyouinid") %></p>
        <input type="hidden" name="tabyouinid" value="<%= request.getParameter("tabyouinid") %>">

        <p>病院名: <%= request.getParameter("tabyouinmei") %></p>
        <input type="hidden" name="tabyouinmei" value="<%= request.getParameter("tabyouinmei") %>">

        <p>住所: <%= request.getParameter("tabyouinaddress") %></p>
        <input type="hidden" name="tabyouinaddress" value="<%= request.getParameter("tabyouinaddress") %>">

        <p>電話番号: <%= request.getParameter("tabyouintel") %></p>
        <input type="hidden" name="tabyouintel" value="<%= request.getParameter("tabyouintel") %>">

        <p>資本金: <%= request.getParameter("tabyouinshihonkin") %></p>
        <input type="hidden" name="tabyouinshihonkin" value="<%= request.getParameter("tabyouinshihonkin") %>">

        <p>救急: <%= request.getParameter("kyukyu") %></p>
        <input type="hidden" name="kyukyu" value="<%= request.getParameter("kyukyu") %>">

        <input type="submit" value="登録">
    </form>
</body>
</html>
