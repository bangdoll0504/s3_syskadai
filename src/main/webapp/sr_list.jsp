<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.example.Shiiregyosha" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>仕入れ業者一覧</title>
</head>
<body>
    <h1>仕入れ業者一覧</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>名</th>
            <th>住所</th>
            <th>電話番号</th>
            <th>資本金</th>
            <th>納期</th>
        </tr>
        <c:forEach var="shiire" items="${shiireList}">
            <tr>
                <td>${shiire.shiireid}</td>
                <td>${shiire.shiiremei}</td>
                <td>${shiire.shiireaddress}</td>
                <td>${shiire.shiiretel}</td>
                <td>${shiire.shihonkin}</td>
                <td>${shiire.nouki}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
