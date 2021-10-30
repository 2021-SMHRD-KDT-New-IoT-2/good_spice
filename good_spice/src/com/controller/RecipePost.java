package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberVO;
import com.model.ProductDAO;
import com.model.RecipeDAO;

@WebServlet("/RecipePost")
public class RecipePost extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();//���ǰ�ü ����
		MemberVO vo = (MemberVO)session.getAttribute("member");//���� �α����� ������� ����
		String id = "admin";//�α����� ������� �̸���
		
		String rec_name = request.getParameter("rec_name");
		String salt = request.getParameter("salt");
		String sugar = request.getParameter("sugar");
		String pepper = request.getParameter("pepper");
		
		RecipeDAO dao = new RecipeDAO();
		int cnt = dao.RecipePost(rec_name, salt, sugar, pepper,id);
		
		if(cnt>0){
			System.out.println("���ε强��!");
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("���ε����!");
			response.sendRedirect("main.jsp");
		}
	}
	

}
