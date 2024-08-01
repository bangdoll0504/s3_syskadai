<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>患者情報確認</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary, .btn-secondary {
            margin-top: 20px;
            width: 100%;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>患者情報確認フォーム</h1>
</div>
<div class="container">
    <form action="patient_update" method="post" accept-charset="UTF-8">
        <div class="form-group">
            <p><strong>患者ID:</strong> <%= request.getAttribute("patid") %></p>
            <input type="hidden" name="patid" value="<%= request.getAttribute("patid") %>">
        </div>
        <div class="form-group">
            <label for="hokenmei">保険名:</label>
            <input type="text" class="form-control" id="hokenmei" name="hokenmei">
        </div>
        <div class="form-group">
            <label for="hokenexp">保険有効期限:</label>
            <input type="date" class="form-control" id="hokenexp" name="hokenexp" required>
        </div>
        <div class="btn-group">
            <button type="submit" class="btn btn-primary">更新</button>
            <form action="patient_id_input.jsp" method="post">
                <button type="submit" class="btn btn-secondary">戻る</button>
            </form>
        </div>
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
