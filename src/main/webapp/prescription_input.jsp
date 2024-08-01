<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("empid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String empid = (String) session.getAttribute("empid");
    int emprole = (Integer) session.getAttribute("userRole");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>処方情報入力</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="styles.css" rel="stylesheet">
<style>
.header {
	background-color: #007bff;
	color: white;
	padding: 20px;
	text-align: center;
	margin-bottom: 20px;
}

.container {
	margin-top: 20px;
	text-align: center;
}

.form-group {
	margin-bottom: 15px;
}

.btn-primary {
	margin-top: 20px;
}
</style>
</head>
<body>

	<div class="header">
		<h1>処方情報入力</h1>
	</div>
	<div class="container">
		<form action="view_prescriptions" method="post" accept-charset="UTF-8">
			<div class="form-group">
				<label for="patientId">患者IDを入力してください:</label> <input type="text"
					class="form-control" id="patientId" name="patientId" required>
			</div>
			<button type="submit" class="btn btn-primary">処方情報を表示</button>
		</form>
	</div>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
