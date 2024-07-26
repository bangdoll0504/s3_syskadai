<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>患者情報確認</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h2>患者情報確認フォーム</h2>
    <form action="patient_update" method="post" accept-charset="UTF-8">
        <p>患者ID: <%= request.getAttribute("patid") %></p>
        <input type="hidden" name="patid" value="<%= request.getAttribute("patid") %>">
        
        <label for="hokenmei">保険名:</label>
        <input type="text" id="hokenmei" name="hokenmei"><br><br>

        <label for="hokenexp">保険有効期限:</label>
        <input type="date" id="hokenexp" name="hokenexp" required><br><br>

        <input type="submit" value="更新">
    </form>
    <form action="patient_id_input.jsp" method="post">
        <input type="submit" value="戻る">
    </form>
</body>
</html>
