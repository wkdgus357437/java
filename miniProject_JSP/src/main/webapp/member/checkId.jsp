<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>    
    
    
<%
//데이터
String id = request.getParameter("id");


//DB
MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤
boolean exist = memberDAO.isExistId(id); //아이디가 있으면 true 이 아이디는 사용 불가능, 아이디가 없으면 false 이 아이디는 사용 가능
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="" action="checkId.jsp">
	
	<%if(exist) { %>
		<h3><%=id %>는 사용 불가능</h3>
		<input type="text" name="id">
		<input type="submit" value="중복체크">
		
	<%}else {%>
		<h3><%=id %>는 사용가능</h3>
		<input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')">
			 <!-- checkIdClose다음 3가지를 해야한다. 1.checkid.jsp의 아이디입력값을  writeForm.jsp의 아이디의 입력창에 넣어라  -->
			 <!-- 2. 포커스(입력커서)가 자동으로 내려간다, 3.창닫기-->
	<%} %>
</form>

<script type="text/javascript">
function checkIdClose(id){
	opener.writeForm.id.value = id;
	opener.writeForm.check.value = id;
	opener.writeForm.pwd.focus();
	window.close();
}
</script>
</body>
</html>



















