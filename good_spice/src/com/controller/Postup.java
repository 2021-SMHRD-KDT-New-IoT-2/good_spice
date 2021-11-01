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

@WebServlet("/Postup")
public class Postup extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		//id랑 제목 내용
		String post_name = request.getParameter("post_name");
	    String post_cont  = request.getParameter("post_cont");
	    
	    HttpSession session = request.getSession();
	    MemberVO vo = (MemberVO)session.getAttribute("member");

	    System.out.println(vo.getid());
	    
	    PostDAO dao = new PostDAO();
	    int cnt = dao.write(post_name, vo.getid(), post_cont);
	    
	    if(cnt>0) {
	         System.out.println("게시글등록성공!");
	         response.sendRedirect("main.jsp#POST");
	      }else {
	         System.out.println("게시글등록실패!");
	         response.sendRedirect("main.jsp#POST");
	      }
	}

}
