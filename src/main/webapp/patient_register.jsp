<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>患者登録</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h2>患者登録フォーム</h2>
    <form action="patient_confirm" method="post" accept-charset="UTF-8">
        <label for="patid">患者ID:</label>
        <input type="text" id="patid" name="patid" required><br><br>
        
        <label for="patfname">名前:</label>
        <input type="text" id="patfname" name="patfname" required><br><br>
        
        <label for="patlname">姓:</label>
        <input type="text" id="patlname" name="patlname" required><br><br>
        
        <label for="hokenmei">保険名:</label>
        <input type="text" id="hokenmei" name="hokenmei" required><br><br>
        
        <label for="hokenexp">保険有効期限:</label>
        <input type="date" id="hokenexp" name="hokenexp" required><br><br>
        
        <input type="submit" value="確認">
    </form>
</body>
</html>
