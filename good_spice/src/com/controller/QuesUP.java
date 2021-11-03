package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberVO;
import com.model.PostDAO;
import com.model.QuesDAO;

@WebServlet("/QNAup")
public class QuesUP extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		//id랑 제목 내용
		String ques_name = request.getParameter("ques_name");
	    String ques_cont  = request.getParameter("ques_cont");
	    
	    HttpSession session = request.getSession();
	    MemberVO vo = (MemberVO)session.getAttribute("member");

	    System.out.println(vo.getid());
	    
	    QuesDAO dao = new QuesDAO();
	    int cnt = dao.QuesWrite(ques_name, vo.getid(), ques_cont);
	    
	    if(cnt>0) {
	         System.out.println("질문등록성공!");
	         response.sendRedirect("main.jsp#QNA");
	      }else {
	         System.out.println("질문등록실패!");
	         response.sendRedirect("main.jsp#QNA");
	      }
	}

}
