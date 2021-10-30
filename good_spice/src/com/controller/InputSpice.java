package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.InputSpiceDAO;
import com.model.MemberVO;

@WebServlet("/InputSpice")
public class InputSpice extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String id = vo.getid();//로그인할 사용자의 아이디
		
		InputSpiceDAO dao = new InputSpiceDAO();
		String product = dao.productNum(id);
		String value = request.getParameter("value");
		
		System.out.println(value);
		
		int cnt = dao.inputSpice(product, value);
		
		// 값을 아두이노로 보내기
		
		if(cnt>0){
			System.out.println("입력성공!");
			response.sendRedirect("main.jsp#Product");
		}else {
			System.out.println("입력실패!");
			response.sendRedirect("main.jsp#Product");
		}
		// 다시 0으로 만드는 알고리즘
		int cnt2 = dao.zerosetting(product, value);
		if(cnt2>0) {
			System.out.println("zero 세팅 성공");
		}else {
			System.out.println("세팅 실패");
		}
	}
}
