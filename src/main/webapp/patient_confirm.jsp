<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>確認画面</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h2>確認画面</h2>
    <form action="patient_register" method="post" accept-charset="UTF-8">
        <p>患者ID: <%= request.getAttribute("patid") %></p>
        <input type="hidden" name="patid" value="<%= request.getAttribute("patid") %>">
        
        <p>名前: <%= request.getAttribute("patfname") %></p>
        <input type="hidden" name="patfname" value="<%= request.getAttribute("patfname") %>">
        
        <p>姓: <%= request.getAttribute("patlname") %></p>
        <input type="hidden" name="patlname" value="<%= request.getAttribute("patlname") %>">
        
        <p>保険名: <%= request.getAttribute("hokenmei") %></p>
        <input type="hidden" name="hokenmei" value="<%= request.getAttribute("hokenmei") %>">
        
        <p>保険有効期限: <%= request.getAttribute("hokenexp") %></p>
        <input type="hidden" name="hokenexp" value="<%= request.getAttribute("hokenexp") %>">
        
        <input type="submit" value="登録">
    </form>
    <form action="patient_register.jsp" method="post">
        <input type="submit" value="戻る">
    </form>
</body>
</html>
