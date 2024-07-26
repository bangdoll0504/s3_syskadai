<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <h1>Medicine Registration</h1>
    <form action="MedicineRegisterServlet" method="post">
        <label for="medicineid">Medicine ID:</label>
        <input type="text" id="medicineid" name="medicineid" required><br>
        
        <label for="medicinename">Medicine Name:</label>
        <input type="text" id="medicinename" name="medicinename" required><br>
        
        <label for="unit">Unit:</label>
        <input type="text" id="unit" name="unit" required><br>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>
