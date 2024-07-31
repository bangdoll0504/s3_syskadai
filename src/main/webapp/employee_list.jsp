<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<html>
<head>
<meta charset="UTF-8">
<title>従業員一覧</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="styles.css" rel="stylesheet">
</head>
<body>

	<div class="header">
		<h1>従業員一覧</h1>
	</div>

	<div class="container mt-4">
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead class="thead-dark">
					<tr>
						<th>従業員ID</th>
						<th>名前（姓）</th>
						<th>名前（名）</th>
						<th>パスワード（ハッシュ）</th>
						<th>役割</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${employees}">
						<tr>
							<td>${employee.empid}</td>
							<td>${employee.emplname}</td>
							<td>${employee.empfname}</td>
							<td>${employee.emppassword_hash}</td>
							<td><c:choose>
									<c:when test="${employee.emprole == 1}">
                                    管理者
                                </c:when>
									<c:when test="${employee.emprole == 2}">
                                    受付
                                </c:when>
									<c:when test="${employee.emprole == 3}">
                                    医師
                                </c:when>
									<c:otherwise>
                                    不明
                                </c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container">
		<a href="welcome.jsp">メニューへ</a>
	</div>

</body>
</html>
