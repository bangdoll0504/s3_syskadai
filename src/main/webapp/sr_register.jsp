<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>仕入れ業者登録</title>
</head>
<body>
    <h1>仕入れ業者登録</h1>
    <form action="sr_confirm.jsp" method="post" accept-charset="UTF-8">
        <label for="shiireid">仕入れID:</label>
        <input type="text" name="shiireid" id="shiireid" required><br>

        <label for="shiiremei">仕入れ名:</label>
        <input type="text" name="shiiremei" id="shiiremei" required><br>

        <label for="shiireaddress">住所:</label>
        <input type="text" name="shiireaddress" id="shiireaddress" required><br>

        <label for="shiiretel">電話番号:</label>
        <input type="text" name="shiiretel" id="shiiretel" required><br>

        <label for="shihonkin">資本金:</label>
        <input type="number" name="shihonkin" id="shihonkin" required><br>

        <label for="nouki">納期:</label>
        <input type="number" name="nouki" id="nouki" required><br>

        <input type="submit" value="確認">
    </form>
</body>
</html>
