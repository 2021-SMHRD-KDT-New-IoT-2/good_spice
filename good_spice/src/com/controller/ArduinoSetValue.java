package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.valueDAO;
import com.model.valueVO;

@WebServlet("/ArduinoSetValue")
public class ArduinoSetValue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.addHeader("Access-Control-Allow-Origin", "*");

		
		int mysensor = Integer.parseInt(request.getParameter("mysensor"));
		System.out.println(mysensor);
			
		valueDAO dao = new valueDAO();
		valueVO vo = dao.update(mysensor); 
		System.out.println(mysensor);
		System.out.println(vo);
		PrintWriter out = response.getWriter();
		String result = new Gson().toJson(vo); 
		out.println(result);
	
		//valueVO vo2 = dao.update(0);
	}

}
