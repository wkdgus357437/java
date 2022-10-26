<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// String name = request.getParameter("name");

String name = (String)session.getAttribute("memName"); //형변환해야한다.
String id = (String)session.getAttribute("memId");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><img src="../img/망상토끼.png" width="70" height="70" onclick="location.href='../index.jsp'" 
         style="cursor: pointer;"> <%=name %>님 로그인</h3>

<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">


</body>
</html>