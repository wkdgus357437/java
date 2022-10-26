<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메인화면</h3>
<hr>

<h5>
<% if(session.getAttribute("memId")==null){%>
<a href="http://localhost:8080/miniProject_JSP/member/writeForm.jsp">회원가입</a><br>
<a href="http://localhost:8080/miniProject_JSP/member/loginForm.jsp">로그인</a><br>
<%}else{ %>
<a href="./member/logout.jsp">로그아웃</a><br>
<a href="http://localhost:8080/miniProject_JSP/board/boardWriteForm.jsp">글쓰기</a><br>
<%} %>
<a href="/miniProject_JSP/board/boardList.jsp?pg=1">목록</a><br>

</h5>
</body>
</html>




<!-- 
1.세션이 있을 때
로그아웃
글쓰기
목록

세션이 없을 때
회원가입
로그인
목록


2.세션 등록
memId
memName
memEmail = ~~@ ~~.com  (email1,email2을 합쳐서

3.글쓰기
Folder : board
File : boardWriteForm.jsp
	   boardWrite.jsp

Package : board.dao
Class :BoardDAO.java
		boardMapper.xml


Package : board.bean
Class : BoardDTO.java




 -->