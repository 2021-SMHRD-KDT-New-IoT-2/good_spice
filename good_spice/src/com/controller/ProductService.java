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
//      String id = request.getParameter("id");
      
      
      HttpSession session = request.getSession();
      MemberVO vo = (MemberVO)session.getAttribute("member");

      System.out.println(vo.getid());
      
      
      ProductDAO dao = new ProductDAO();
      int cnt = dao.addProduct(product, spice, vo.getid());
      
      if(cnt>0) {
         System.out.println("등록성공!");
         response.sendRedirect("main.jsp");
      }else {
         System.out.println("등록실패!");
         response.sendRedirect("main.jsp");
      }
      
      //MemberVO vo = new MemberVO();
      //String id = vo.getid();
      
   }

}