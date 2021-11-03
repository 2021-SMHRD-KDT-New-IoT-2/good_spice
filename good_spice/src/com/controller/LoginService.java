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
	// text => ����Ʈ �ڵ�	/����ȭ
	// ����Ʈ�ڵ� => text 	/������ȭ
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao =new MemberDAO();
		MemberVO vo =dao.login(id, pw);
		
		if(vo!=null) {
		//���� ��ü ����
		HttpSession session = request.getSession();
		
		//���� �� ����
		session.setAttribute("member", vo);
		response.sendRedirect("main.jsp");
		//�α��� ��� �ۼ�
		//�α��� ������ ��� =>�α��� �������
		//�α��� �Ұ����� ��� =>�α��� �������	
		}else {
			response.sendRedirect("main.jsp");
		}
		
	}

}
