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
import com.model.ProductDAO;

@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("euc-kr");
		
		
		String product = request.getParameter("product");

		ProductDAO dao =new ProductDAO(); 
		int cnt =dao.delete(product);
		
		if(cnt>0) {
			System.out.println("삭제성공");
			response.sendRedirect("main.jsp#Product");
		}else {
			System.out.println("삭제실패");
			response.sendRedirect("main.jsp#Product");
		}
	}

}
