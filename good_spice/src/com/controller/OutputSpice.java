package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OutputSpice")
public class OutputSpice extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String rec_num = request.getParameter("REC_NUM");
		
		// 사용자의 제품의 양념 종류를 가져와서 해당 레시피에서 그에 해당하는 양념의 양만 출력하는 것 만들려고요
		
		System.out.println(rec_num);
	}

}
