<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>確認</title>
</head>
<body>
    <h1>入力内容の確認</h1>
    <form action="shiire_RegisterServlet" method="post">
        <p>仕入れID: <%= request.getParameter("shiireid") %></p>
        <input type="hidden" name="shiireid" value="<%= request.getParameter("shiireid") %>">

        <p>仕入れ名: <%= request.getParameter("shiiremei") %></p>
        <input type="hidden" name="shiiremei" value="<%= request.getParameter("shiiremei") %>">

        <p>住所: <%= request.getParameter("shiireaddress") %></p>
        <input type="hidden" name="shiireaddress" value="<%= request.getParameter("shiireaddress") %>">

        <p>電話番号: <%= request.getParameter("shiiretel") %></p>
        <input type="hidden" name="shiiretel" value="<%= request.getParameter("shiiretel") %>">

        <p>資本金: <%= request.getParameter("shihonkin") %></p>
        <input type="hidden" name="shihonkin" value="<%= request.getParameter("shihonkin") %>">

        <p>納期: <%= request.getParameter("nouki") %></p>
        <input type="hidden" name="nouki" value="<%= request.getParameter("nouki") %>">

        <input type="submit" value="登録">
    </form>
</body>
</html>
