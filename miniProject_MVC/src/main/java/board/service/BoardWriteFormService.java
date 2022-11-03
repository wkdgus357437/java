package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardWriteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		request.setAttribute("display", "/board/boardWriteForm.jsp");//현재 있는 창에서 boardWriteForm로 바로 전환${dispaly}
		return "/index.jsp";
		//창 넘어가서 나오게 하려면 그냥 return "/boardWriteForm.jsp" 로 진행
	}

}