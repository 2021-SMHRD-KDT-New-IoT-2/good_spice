package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/EmailCheckService")
public class EmailCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email =request.getParameter("email");
		
		System.out.println(email);
		
		MemberDAO dao = new MemberDAO();
		boolean check = dao.EmailCheck(email);
		
		//출력 스트림(통로)
		PrintWriter out = response.getWriter();
//		통로를 통해서 응답데이터를 출력
		out.print(check);
		
		
	}

}
