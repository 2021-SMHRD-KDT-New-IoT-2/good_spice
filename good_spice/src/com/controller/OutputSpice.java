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
		
		// ������� ��ǰ�� ��� ������ �����ͼ� �ش� �����ǿ��� �׿� �ش��ϴ� ����� �縸 ����ϴ� �� ��������
		
		System.out.println(rec_num);
	}

}
