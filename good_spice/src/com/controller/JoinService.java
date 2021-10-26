package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	 	요청데이터 인코딩 방식
		request.setCharacterEncoding("euc-kr");
		
//		요청 데이터 받아주기

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
				
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(id, pw, nick);

		if(cnt>0){
			System.out.println("가입성공!");
			
//			forward방식으로 페이지 이동

			RequestDispatcher rd = request.getRequestDispatcher("join_success.jsp");

//			requst 영역에 기억해야할 데이터 설정
			request.setAttribute("ID", id);
			
//			페이지 이동할 시 request,respone객체 전달
			rd.forward(request, response);
			
			//response.sendRedirect("join_success.jsp?emainl="+email);
			
		}else {
			System.out.println("가입실패!");
			response.sendRedirect("main.jsp");
		}
	}

}
