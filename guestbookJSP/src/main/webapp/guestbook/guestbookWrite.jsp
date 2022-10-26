<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="guestbook.bean.GuestbookDTO" %>
<%@ page import="guestbook.dao.GuestbookDAO"%>

<%
//데이터
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name"); 
String email = request.getParameter("email");
String homepage = request.getParameter("homepage");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

GuestbookDTO guestbookDTO = new GuestbookDTO();
guestbookDTO.setName(name);
guestbookDTO.setEmail(email);
guestbookDTO.setHomepage(homepage);
guestbookDTO.setSubject(subject);
guestbookDTO.setContent(content);

//DB
GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); //싱글톤
guestbookDAO.guestbookWrite(guestbookDTO); //호출



//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3><img src="../img/apple.png" width="70" height="70" 
         onclick="location.href='guestbookWriteForm.jsp'" 
         style="cursor: pointer;"> <br>
         작성하신 글을 저장하였습니다</h3>
<br>
<input type="button" value="뒤로" onclick="history.go(-1)">
<input type="button" value="글목록" onclick="location.href='http://localhost:8080/guestbookJSP/guestbook/guestbookList.jsp?pg=1'">
</body>
</html>















