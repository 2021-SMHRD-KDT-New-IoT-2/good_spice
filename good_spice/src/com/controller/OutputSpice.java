package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.model.InputSpiceDAO;
import com.model.MemberVO;
import com.model.ProductDAO;
import com.model.ProductVO;
import com.model.RecipeDAO;

@WebServlet("/OutputSpice")
public class OutputSpice extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.addHeader("Access-Control-Allow-Origin", "*");
		
		request.setCharacterEncoding("euc-kr");
		
		String rec_num = request.getParameter("REC_NUM");
		String id = request.getParameter("id");
		RecipeDAO rdao = new RecipeDAO();
		ProductDAO pdao = new ProductDAO();
		InputSpiceDAO isdao = new InputSpiceDAO();
		
		int[] rec = rdao.selectRec(rec_num);
		String spice = pdao.user_spice(id);

		String product = isdao.productNum(id);
		int value = 0;
		// ������� ��ǰ�� ��� ������ �����ͼ� �ش� �����ǿ��� �׿� �ش��ϴ� ����� �縸 ����ϴ� �� ��������
			// System.out.println(rec[i]);
		if(spice.equals("�ұ�")){
			 value = rec[0];
		}else if(spice.equals("����")) {
			value = rec[1];
		}else if(spice.equals("����")) {
			value = rec[2];
		}
		// �Ƶ��̳� db ����
		boolean check = isdao.inputSpice(value);
		
		if(check) {
			System.out.println("�Է¼���");
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("�Է½���");
			response.sendRedirect("main.jsp");
		}
	}
}
