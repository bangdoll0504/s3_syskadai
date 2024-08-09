package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/complete_prescription")
public class CompletePrescriptionServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    // セッションの取得とログイン確認
	    HttpSession session = request.getSession(false); // 既存のセッションを取得
	    if (session == null || session.getAttribute("empid") == null) {
	        // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
	        response.sendRedirect("login.jsp");
	        return;
	    }

        String patientId = request.getParameter("patientId");
		String[] medicineIds = request.getParameterValues("medicineId");
		String[] quantities = request.getParameterValues("quantity");

		// データベース接続
		try {
			Connection conn;
			try {
				conn = DatabaseConnection.initializeDatabase();
				String sql = "INSERT INTO prescription (prescription_date, patientId, medicineId, prescribedAt) VALUES (?, ?, ?, ?)";
				PreparedStatement stmt = conn.prepareStatement(sql);
				Date now = new Date();
				for (int i = 0; i < medicineIds.length; i++) {
					stmt.setTimestamp(1, new java.sql.Timestamp(now.getTime()));
					stmt.setString(2, patientId);
					stmt.setString(3, medicineIds[i]);
					stmt.setInt(4, Integer.parseInt(quantities[i]));
					stmt.addBatch();
				}
				stmt.executeBatch();
			} catch (ClassNotFoundException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 処方完了の画面にリダイレクト
		response.sendRedirect("prescription_success.jsp");
	}
}
