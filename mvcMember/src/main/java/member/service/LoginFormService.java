package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class LoginFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "/member/loginForm.jsp";
	}

}

/*
 http://localhost:8080/mvcMember/member/loginForm.do 요청
   ↓
ControlServlet.java (URL에서 프로젝트명 뒤쪽의 내용을 얻어온다. => /member/loginForm.do)
   ↓
command.properties (/member/loginForm.do와 연결된 자바 파일명을 얻어온다)
   ↓
ControlServlet.java (LoginFormService.java의 requestPro(~~) 를 호출한다.)
   ↓
LoginFormService.java (*.jsp 파일의 위치를 알려준다.)
   ↓
ControlServlet.java
   ↓ forward
/member/loginForm.jsp
 */