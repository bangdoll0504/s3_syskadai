<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>処方一覧</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="styles.css" rel="stylesheet">
<style>
.header {
	background-color: #28a745;
	color: white;
	padding: 20px;
	text-align: center;
	margin-bottom: 20px;
}

.container {
	margin-top: 20px;
	text-align: center;
}

.btn-primary {
	margin-top: 20px;
	width: 200px;
}
</style>
</head>
<body>

	<div class="header">
		<h1>処方一覧</h1>
	</div>
	<div class="container table-container">
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead class="thead-dark">
					<tr>
						<th>処方ID</th>
						<th>処方日付</th>
						<th>患者ID</th>
						<th>Medicine ID</th>
						<th>数量</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="prescription" items="${prescriptions}">
						<tr>
							<td>${prescription.prescriptionId}</td>
							<td>${prescription.prescriptionDate}</td>
							<td>${prescription.patientId}</td>
							<td>${prescription.medicineid}</td>
							<td>${prescription.quantity}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container">
			<a href="welcome.jsp" class="btn btn-primary">メニューへ</a>
		</div>
	</div>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
