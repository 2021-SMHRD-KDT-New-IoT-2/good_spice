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

/**
 * Servlet implementation class ArduinoGetValue
 */
@WebServlet("/ArduinoGetValue")
public class ArduinoGetValue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.addHeader("Access-Control-Allow-Origin", "*");
		
		valueDAO dao = new valueDAO();
		valueVO vo = dao.getvalue();
		System.out.println(vo);
		String result = new Gson().toJson(vo);
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

}
