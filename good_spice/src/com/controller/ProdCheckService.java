package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ProductDAO;

@WebServlet("/ProdCheckService")
public class ProdCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String id =request.getParameter("id");
		
		ProductDAO dao = new ProductDAO();
		boolean check = dao.prodCheck(id);
		
		//��� ��Ʈ��(���)
		PrintWriter out = response.getWriter();
//		��θ� ���ؼ� ���䵥���͸� ���
		out.print(check);
		
		
	}
	
}
