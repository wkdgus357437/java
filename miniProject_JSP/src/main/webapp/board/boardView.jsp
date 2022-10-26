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
pg=<%=pg %>
seq=<%=seq %>

</body>
</html>
