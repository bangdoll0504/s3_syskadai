package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/check_patient")
public class CheckPatientServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String patientId = request.getParameter("patientId");

		// 患者IDがデータベースに存在するかチェック
		boolean exists = checkPatientInDatabase(patientId);

		if (exists) {
			// Medicineの一覧を取得
			List<Medicine> medicines = getMedicines();
			request.setAttribute("medicines", medicines);
			request.setAttribute("patientId", patientId);

			// Medicine一覧表示画面に転送
			RequestDispatcher dispatcher = request.getRequestDispatcher("medicine_pat_list.jsp");
			dispatcher.forward(request, response);
		} else {
			// 患者が存在しない場合のエラーハンドリング
			response.sendRedirect("p_error.jsp");
		}
	}

	private boolean checkPatientInDatabase(String patientId) {
		boolean exists = false;
		// データベース接続とクエリ実行
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM patient WHERE patid = ?");
			{
				stmt.setString(1, patientId);
				try (ResultSet rs = stmt.executeQuery()) {
					if (rs.next()) {
						exists = true;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exists;

	}

	private List<Medicine> getMedicines() {
		List<Medicine> medicines = new ArrayList<>();
		// データベース接続とクエリ実行
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM medicine");
			while (rs.next()) {
				Medicine medicine = new Medicine();
				medicine.setMedicineId(rs.getString("medicineid"));
				medicine.setMedicineName(rs.getString("medicinename"));
				medicines.add(medicine);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return medicines;
	}
}
