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
		
//		회원삭제기능 호출
		
		//dao 기능 호출 => 수정여부를 판단할 수 있는 갑 반환
//		수정성공일 경우에는 콘솔 => 수정성공!
//		수정실패일 경우에는 콘솔 => 수정실패!
		
		MemberDAO dao =new MemberDAO(); 
		int cnt =dao.delete(id);
		
		if(cnt>0) {
			System.out.println("삭제성공");
			response.sendRedirect("main.jsp#MemberInfo");
		}else {
			System.out.println("삭제실패");
			response.sendRedirect("main.jsp#MemberInfo");
		}

	}

}
