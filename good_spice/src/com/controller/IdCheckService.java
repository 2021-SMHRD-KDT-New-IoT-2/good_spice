package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/IdCheckService")
public class IdCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String id =request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		boolean check = dao.idCheck(id);
		
		//��� ��Ʈ��(���)
		PrintWriter out = response.getWriter();
//		��θ� ���ؼ� ���䵥���͸� ���
		out.print(check);
		
		
	}

}
