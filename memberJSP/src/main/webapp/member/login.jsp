<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="member.dao.MemberDAO"%>

<%
//데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//DB 
MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤
String name = memberDAO.memberLogin(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%//페이지 이동 loginOk,loginFail
if(name != null){ 
	//response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name,"UTF-8")); --위험
	
	//세선 : 서버위에 저장하겠다
	//HttpSession session = request.getSession(); //세션 생성
	
	//쿠키
	Cookie cookie = new Cookie("memName",name);
	cookie.setMaxAge(30 * 60);//3분
	response.addCookie(cookie);//클라이언트에게 보내기
	
	Cookie cookie2 = new Cookie("memId",id);
	cookie2.setMaxAge(30 * 60);//30분
	response.addCookie(cookie2);//클라이언트에게 보내기
	
	
	//페이지 이동
	session.setAttribute("memName", name);
	response.sendRedirect("loginOk.jsp");
}else{
	//페이지 이동
	response.sendRedirect("loginFail.jsp");
}
%>
</body>
</html>

















