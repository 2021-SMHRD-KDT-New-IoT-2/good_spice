package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberVO;

@WebServlet("/DeleteService")
public class DeleteService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		
		String id = request.getParameter("id");
		
//		ȸ��������� ȣ��
		
		//dao ��� ȣ�� => �������θ� �Ǵ��� �� �ִ� �� ��ȯ
//		���������� ��쿡�� �ܼ� => ��������!
//		���������� ��쿡�� �ܼ� => ��������!
		
		MemberDAO dao =new MemberDAO(); 
		int cnt =dao.delete(id);
		
		if(cnt>0) {
			System.out.println("��������");
			response.sendRedirect("main.jsp#MemberInfo");
		}else {
			System.out.println("��������");
			response.sendRedirect("main.jsp#MemberInfo");
		}

	}

}
