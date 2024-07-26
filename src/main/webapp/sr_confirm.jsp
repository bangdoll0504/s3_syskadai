<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>確認ページ</title>
    <meta charset="UTF-8">
</head>
<body>
    <h2>確認ページ</h2>
    仕入ID: <%= request.getAttribute("id") %><br/>
    仕入業者名: <%= request.getAttribute("name") %><br/>
    仕入業者住所: <%= request.getAttribute("addr") %><br/>
    電話番号: <%= request.getAttribute("phone") %><br/>
    資本金: <%= request.getAttribute("capital") %><br/>
    納期: <%= request.getAttribute("delivery_date") %><br/>
    <form action="sr_CompleteServlet" method="post">
        <input type="hidden" name="id" value="<%= request.getAttribute("id") %>"/>
        <input type="hidden" name="name" value="<%= request.getAttribute("name") %>"/>
        <input type="hidden" name="addr" value="<%= request.getAttribute("addr") %>"/>
        <input type="hidden" name="phone" value="<%= request.getAttribute("phone") %>"/>
        <input type="hidden" name="capital" value="<%= request.getAttribute("capital") %>"/>
        <input type="hidden" name="delivery_date" value="<%= request.getAttribute("delivery_date") %>"/>
        <input type="submit" value="OK"/>
    </form>
    <form action="sr_register.jsp" method="post">
        <input type="submit" value="戻る"/>
    </form>
</body>
</html>
