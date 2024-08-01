<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.example.Shiiregyosha"%>
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
<title>仕入れ業者一覧</title>
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
}

.table-responsive {
	margin-top: 20px;
}
</style>
</head>
<body>

	<div class="header">
		<h1>仕入れ業者一覧</h1>
	</div>
	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead class="thead-dark">
					<tr>
						<th>ID</th>
						<th>名</th>
						<th>住所</th>
						<th>電話番号</th>
						<th>資本金</th>
						<th>納期</th>
					</tr>
				</thead>
				<tbody>
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
				</tbody>
			</table>
		</div>
		<div class="menu-link">
			<a href="welcome.jsp">メニューへ</a>
		</div>
	</div>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
