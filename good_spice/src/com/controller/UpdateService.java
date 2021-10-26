package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.model.MemberDAO;
import com.model.MemberVO;

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("euc-kr");//��û������ ���ڵ� ��� ����
		
		HttpSession session = request.getSession();//���ǰ�ü ����
		MemberVO vo = (MemberVO)session.getAttribute("member");//���� �α����� ������� ����
		String email = vo.getid();//�α����� ������� �̸���
		
		//������ ����� ����
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		//dao ��� ȣ�� => �������θ� �Ǵ��� �� �ִ� �� ��ȯ
//		���������� ��쿡�� �ܼ� => ��������!
//		���������� ��쿡�� �ܼ� => ��������!
		MemberDAO dao = new MemberDAO();
		int cnt=dao.update(email, pw, tel, address);
		
		
		if(cnt>0) {
			System.out.println("��������");
			
			MemberVO vo2 =new MemberVO(email,tel,address);
			
			session.setAttribute("member",vo2);
			
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("��������");
			response.sendRedirect("main.jsp");
		}
	}

}
