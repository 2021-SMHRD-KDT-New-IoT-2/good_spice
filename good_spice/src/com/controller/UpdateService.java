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
	MemberVO vo = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("euc-kr");//��û������ ���ڵ� ��� ����
		
		HttpSession session = request.getSession();//���ǰ�ü ����
		vo = (MemberVO)session.getAttribute("member");//���� �α����� ������� ����
		String id = vo.getid();//�α����� ������� �̸���
		
		//������ ����� ����
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		
		
		//dao ��� ȣ�� => �������θ� �Ǵ��� �� �ִ� �� ��ȯ
//		���������� ��쿡�� �ܼ� => ��������!
//		���������� ��쿡�� �ܼ� => ��������!
		MemberDAO dao = new MemberDAO();
		int cnt=dao.update(id, pw, nick);
		
		
		if(cnt>0) {
			System.out.println("��������");
			
			vo =new MemberVO(id,pw,nick);
			
			session.setAttribute("member",vo);
			
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("��������");
			response.sendRedirect("main.jsp");
		}
	}

}
