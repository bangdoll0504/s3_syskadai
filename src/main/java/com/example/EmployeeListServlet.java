package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/employee_list")
public class EmployeeListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }

        List<Employee> employees = new ArrayList<>();

        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "SELECT * FROM employees";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Employee employee = new Employee();
                employee.setEmpid(resultSet.getString("empid"));
                employee.setEmpfname(resultSet.getString("empfname"));
                employee.setEmplname(resultSet.getString("emplname"));
                employee.setEmppasswordd(resultSet.getString("emppasswordd"));
                employee.setEmppassword_hash(resultSet.getString("emppassword_hash"));
                employee.setEmprole(resultSet.getInt("emprole"));
                employees.add(employee);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("employees", employees);
        request.getRequestDispatcher("employee_list.jsp").forward(request, response);
    }
}
