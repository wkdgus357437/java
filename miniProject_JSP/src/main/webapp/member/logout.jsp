<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
session.removeAttribute("memName");
session.removeAttribute("memId");

//session.invalidate(); - 무효화, 모든 세션 없에기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그아웃
<script type="text/javascript">
window.onload=function(){
	alert("로그아웃");
	location.href = "../index.jsp";
}
</script>
</body>
</html>