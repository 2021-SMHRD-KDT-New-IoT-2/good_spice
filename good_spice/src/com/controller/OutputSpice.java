package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.InputSpiceDAO;
import com.model.MemberVO;
import com.model.ProductDAO;
import com.model.ProductVO;
import com.model.RecipeDAO;

@WebServlet("/OutputSpice")
public class OutputSpice extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String rec_num = request.getParameter("REC_NUM");
		System.out.println(rec_num);
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String id = vo.getid();
		System.out.println(id);
		
		ProductVO pvo = new ProductVO(id);
		RecipeDAO rdao = new RecipeDAO();
		ProductDAO pdao = new ProductDAO();
		InputSpiceDAO isdao = new InputSpiceDAO();
		
		String[] rec = rdao.selectRec(rec_num);
		String spice = pdao.user_spice(id);

		String product = isdao.productNum(id);
		String value = null;
		System.out.println(spice);
		// ������� ��ǰ�� ��� ������ �����ͼ� �ش� �����ǿ��� �׿� �ش��ϴ� ����� �縸 ����ϴ� �� ��������
			// System.out.println(rec[i]);
		if(spice.equals("�ұ�")){
			 value = rec[0];
		}else if(spice.equals("����")) {
			value = rec[1];
		}else if(spice.equals("����")) {
			value = rec[2];
		}
		int cnt = isdao.inputSpice(product, value);
		if(cnt>0) {
			System.out.println("��¼���");
		}else {
			System.out.println("��½���");
		}
		int cnt2 = isdao.zerosetting(product, value);
		if(cnt2>0) {
			System.out.println("0 ���� ����");
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("���� ����");
			response.sendRedirect("main.jsp");
		}
	}

}
