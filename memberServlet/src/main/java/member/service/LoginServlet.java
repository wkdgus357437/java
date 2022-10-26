package member.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDAO memberDAO =MemberDAO.getInstance(); //싱글톤
		String name = memberDAO.memberLogin(id, pwd);
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		if(name !=null)
			out.println(name+"님이 로그인에 성공하셨습니다.");
		else
			out.println("아이디 또는 비밀번호가 틀렸습니다");
		out.println("<body>");
		out.println("<html>");
		
		
	}

}

