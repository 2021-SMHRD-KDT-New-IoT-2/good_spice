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

@WebServlet("/ProductService")
public class ProductService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String product = request.getParameter("product");
		String spice = request.getParameter("spice");
		String id = request.getParameter("id");
		
		
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute(vo.getid());

		
		System.out.println(id);
		
		
		ProductDAO dao = new ProductDAO();
		int cnt = dao.addProduct(product, spice, id);
		
		if(cnt>0) {
			System.out.println("��ϼ���!");
			response.sendRedirect("product_success.jsp");
		}else {
			System.out.println("��Ͻ���!");
			response.sendRedirect("main.jsp");
		}
		
		//MemberVO vo = new MemberVO();
		//String id = vo.getid();
		
	}

}
