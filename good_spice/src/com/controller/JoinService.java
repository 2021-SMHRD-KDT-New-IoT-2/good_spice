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
//	 	��û������ ���ڵ� ���
		request.setCharacterEncoding("euc-kr");
		
//		��û ������ �޾��ֱ�

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
				
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(id, pw, nick);

		if(cnt>0){
			System.out.println("���Լ���!");
			
//			forward������� ������ �̵�

			RequestDispatcher rd = request.getRequestDispatcher("join_success.jsp");
			
//			requst ������ ����ؾ��� ������ ����
			request.setAttribute("ID", id);
			
//			������ �̵��� �� request,respone��ü ����
			rd.forward(request, response);
			
			//response.sendRedirect("join_success.jsp?email="+email);
			
		}else {
			System.out.println("���Խ���!");
			response.sendRedirect("main.jsp");
		}
	}

}
