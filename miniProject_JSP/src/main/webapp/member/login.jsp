<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %>
    
    <% 
    //데이터
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
		
		
	//DB
	MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤
	MemberDTO memberDTO = memberDAO.memberLogin(id, pwd);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
//페이지 이동
if(memberDTO != null){ 
	// response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name, "UTF-8")); //loginOk.jsp파일로 이동하시오 
	                                                                                  //주소에 입력값이 노출된다. 보안성이 떨어진다. 그러므로 톰켓에 올려야한다.
	
	// 세션
	// HttpSession session = request.getSession(); //세션 생성
	session.setAttribute("memName", memberDTO.getName()); //보안성을 위해 세션안에다가 네임값을 저장한다.
	session.setAttribute("memId", id);
	session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
	
	session.setAttribute("memberDTO", memberDTO);
	
	//페이지 이동
	response.sendRedirect("loginOk.jsp");
	
	
}else{ 
	//페이지 이동
	response.sendRedirect("loginFail.jsp"); //loginOk.jsp파일로 이동하시오
	
} 
%>

</body>
</html>