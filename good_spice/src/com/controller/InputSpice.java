package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.InputSpiceDAO;
import com.model.MemberVO;

@WebServlet("/InputSpice")
public class InputSpice extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String id = vo.getid();//�α����� ������� ���̵�
		
		InputSpiceDAO dao = new InputSpiceDAO();
		String product = dao.productNum(id);
		String value = request.getParameter("value");
		
		System.out.println(value);
		
		int cnt = dao.inputSpice(product, value);
		
		// ���� �Ƶ��̳�� ������
		
		if(cnt>0){
			System.out.println("�Է¼���!");
			response.sendRedirect("main.jsp#Product");
		}else {
			System.out.println("�Է½���!");
			response.sendRedirect("main.jsp#Product");
		}
		// �ٽ� 0���� ����� �˰���
		int cnt2 = dao.zerosetting(product, value);
		if(cnt2>0) {
			System.out.println("zero ���� ����");
		}else {
			System.out.println("���� ����");
		}
	}
}
