<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>仕入業者登録</title>
    <meta charset="UTF-8">
</head>
<body>
    <h2>仕入業者登録</h2>
    <form action="sr_RegisterServlet" method="post">
        <table>
            <tr>
                <td>仕入ID:</td>
                <td><input type="text" name="id" value="${id != null ? id : ''}" /></td>
            </tr>
            <tr>
                <td>仕入業者名:</td>
                <td><input type="text" name="name" value="${name != null ? name : ''}" /></td>
            </tr>
            <tr>
                <td>住所:</td>
                <td><input type="text" name="address" value="${name != null ? name : ''}" /></td>
            </tr>
            <tr>
                <td>電話番号:</td>
                <td><input type="text" name="phone" value="${phone != null ? phone : ''}" /></td>
            </tr>
            <tr>
                <td>資本金:</td>
                <td><input type="text" name="capital" value="${capital != null ? capital : ''}" /></td>
            </tr>
            <tr>
                <td>納期:</td>
                <td><input type="text" name="delivery_date" value="${delivery_date != null ? delivery_date : ''}" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="確認"/></td>
            </tr>
        </table>
    </form>
    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
</body>
</html>
