package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.InputSpiceDAO;
import com.model.ProductVO;
import com.model.RecipeVO;
import com.model.valueDAO;
import com.model.valueVO;

@WebServlet("/SetValue")
public class SetValue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 아두이노가 요청할 때 널로 뜨는 이유..
		int mysensor = Integer.parseInt(request.getParameter("mysensor"));
		System.out.println(mysensor);
			
		valueDAO dao = new valueDAO();
		valueVO vo = dao.update(mysensor); 
		System.out.println(vo);
		String result = new Gson().toJson(vo); 
		PrintWriter out = response.getWriter();
		out.println(result);
	}

}
