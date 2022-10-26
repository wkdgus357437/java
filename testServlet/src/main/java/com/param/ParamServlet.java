package com.param;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/ParamServlet") //web.xml 에 쓰던가, @(어노테션)을쓰던가, 둘 중 하나만 써야 error 안나온다 만약 둘다 쓰려면 web.xml에 주석걸어라
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터
		
		String name =request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		out.println("Hello Servlet!! <br>");
		out.println(name + "님의 나이는 " + age + "살 이므로 ");
		if(age>=19) out.print("성인입니다.");
		else out.println("청소년 입니다.");
		out.print("</body>");
		out.print("</html>");
		
	}

	@Override
	public void destroy() {}

}

