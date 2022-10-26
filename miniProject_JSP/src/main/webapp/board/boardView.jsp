<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% int seq = Integer.parseInt(request.getParameter("seq"));
   int pg = Integer.parseInt(request.getParameter("pg"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글번호 : <%=seq %><br>
페이지 번호 : <%=pg %><br>

</body>
</html>
