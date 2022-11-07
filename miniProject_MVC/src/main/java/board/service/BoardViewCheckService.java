package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardViewCheckService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// int seq = Integer.parseInt(request.getParameter("seq"));
		// int pg = Integer.parseInt(request.getParameter("pg"));

		// 데이터
		String seq = request.getParameter("seq");
		String pg = request.getParameter("pg");
		
		//응답
		request.setAttribute("seq", seq);
		request.setAttribute("pg", pg);

		request.setAttribute("display","/board/boardViewCheck.jsp");
		return "/index.jsp";
	}

}
