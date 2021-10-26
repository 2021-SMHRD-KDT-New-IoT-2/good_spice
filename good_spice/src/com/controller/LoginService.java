package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberVO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	// text => 바이트 코드	/직렬화
	// 바이트코드 => text 	/역직렬화
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao =new MemberDAO();
		MemberVO vo =dao.login(id, pw);
		
		if(vo!=null) {
		//세션 객체 생성
		HttpSession session = request.getSession();
		
		//세션 값 설정
		session.setAttribute("member", vo);
		
		response.sendRedirect("main.jsp");
		//로그인 기능 작성
		//로그인 가능할 경우 =>로그인 성공출력
		//로그인 불가능할 경우 =>로그인 실패출력	
		}else {
			response.sendRedirect("main.jsp");
		}
	}

}
