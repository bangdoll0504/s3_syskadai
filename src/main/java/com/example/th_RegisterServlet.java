package com.example;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/th_RegisterServlet")
public class th_RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	    // セッションの取得とログイン確認
	    HttpSession session = request.getSession(false); // 既存のセッションを取得
	    if (session == null || session.getAttribute("empid") == null) {
	        // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
	        response.sendRedirect("login.jsp");
	        return;
	    }
		request.setCharacterEncoding("UTF-8");
		
		String tabyouinid = request.getParameter("tabyouinid");
		String tabyouinmei = request.getParameter("tabyouinmei");
		String tabyouinaddress = request.getParameter("tabyouinaddress");
		String tabyouintel = request.getParameter("tabyouintel");
		String tabyouinshihonkin = request.getParameter("tabyouinshihonkin");
		String kyukyu = request.getParameter("kyukyu");

		boolean validAmount = Validator.isValidAmount(tabyouinshihonkin);
		boolean validPhoneNumber = Validator.isValidPhoneNumber(tabyouintel);

		System.out.println("validAmount=" + validAmount);
		System.out.println("validPhoneNumber=" + validPhoneNumber);
		if (validAmount && validPhoneNumber) {
			request.setAttribute("tabyouinid", tabyouinid);
			request.setAttribute("tabyouinmei", tabyouinmei);
			request.setAttribute("tabyouinaddress", tabyouinaddress);
			request.setAttribute("tabyouintel", tabyouintel);
			request.setAttribute("tabyouinshihonkin", tabyouinshihonkin);
			request.setAttribute("kyukyu", kyukyu);
			request.getRequestDispatcher("th_confirm.jsp").forward(request, response);
		} else {
			if (validAmount) {
				String errorMessage = "無効な電話番号です。正しい形式で入力してください。";
				request.setAttribute("error", errorMessage);
				request.getRequestDispatcher("th_register.jsp").forward(request, response);
			} else {
				String errorMessage = "無効な資本金です。正しい形式で入力してください。";
				request.setAttribute("error", errorMessage);
				request.getRequestDispatcher("th_register.jsp").forward(request, response);
			}
		}
	}
}
