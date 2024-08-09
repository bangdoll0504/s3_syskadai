<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
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
    <title>Welcome</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css"> <!-- 実際のパスに変更してください -->
</head>
<body>
    <div class="header">
        <h1>ようこそ, <%= empid %>さん!</h1>
    </div>
    <div class="container">
        <ul class="list-group">
            <% if (emprole == 1) { %>
                <li class="list-group-item"><a href="e_register.jsp">従業員登録</a></li>
                <li class="list-group-item"><a href="employee_list">従業員一覧</a></li>
                <li class="list-group-item"><a href="change_password.jsp">パスワード変更</a></li>
                <li class="list-group-item"><a href="th_register.jsp">他病院登録</a></li>
                <li class="list-group-item"><a href="tabyouinlist">他病院一覧</a></li>
                <li class="list-group-item"><a href="sr_register.jsp">仕入れ先登録</a></li>
                <li class="list-group-item"><a href="shiireListServlet">仕入れ先一覧</a></li>
                <li class="list-group-item"><a href="medicine_register.jsp">薬剤登録</a></li>
                <li class="list-group-item"><a href="patient_register.jsp">患者登録</a></li>
                <li class="list-group-item"><a href="patient_list">患者一覧</a></li>
                <li class="list-group-item"><a href="patient_expired_list">患者保険証切れ一覧</a></li>
                <li class="list-group-item"><a href="patient_id_input.jsp">患者保険証情報変更</a></li>
                <li class="list-group-item"><a href="medicine_list">薬剤リスト</a></li>
                <li class="list-group-item"><a href="prescription.jsp">処置</a></li>
                <li class="list-group-item"><a href="prescription_input.jsp">処置リスト</a></li>
            <% } else if (emprole == 2) { %>
                <li class="list-group-item"><a href="u_change_password.jsp">パスワード変更</a></li>
                <li class="list-group-item"><a href="patient_register.jsp">患者登録</a></li>
                <li class="list-group-item"><a href="patient_list">患者一覧</a></li>
                <li class="list-group-item"><a href="patient_list_expired">患者保険証切れ一覧</a></li>
                <li class="list-group-item"><a href="patient_id_input.jsp">患者保険証情報変更</a></li>
            <% } else if (emprole == 3) { %>
                <li class="list-group-item"><a href="medicine_list">薬剤リスト</a></li>
                <li class="list-group-item"><a href="prescription.jsp">処置</a></li>
                <li class="list-group-item"><a href="prescription_input.jsp">処置リスト</a></li>
            <% } %>
        </ul>
        <div class="logout">
            <a href="logout.jsp">ログアウト</a>
        </div>
    </div>
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
