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
	
		request.setCharacterEncoding("euc-kr");//요청데이터 인코딩 방식 지정
		
		HttpSession session = request.getSession();//세션객체 생성
		vo = (MemberVO)session.getAttribute("member");//현재 로그인한 사용자의 정보
		String id = vo.getid();//로그인할 사용자의 이메일
		
		//수정에 사용할 정보
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		
		
		//dao 기능 호출 => 수정여부를 판단할 수 있는 갑 반환
//		수정성공일 경우에는 콘솔 => 수정성공!
//		수정실패일 경우에는 콘솔 => 수정실패!
		MemberDAO dao = new MemberDAO();
		int cnt=dao.update(id, pw, nick);
		
		
		if(cnt>0) {
			System.out.println("수정성공");
			
			vo =new MemberVO(id,pw,nick);
			
			session.setAttribute("member",vo);
			
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("수정실패");
			response.sendRedirect("main.jsp");
		}
	}

}
