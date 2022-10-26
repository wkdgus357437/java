<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.bean.GuestbookDTO"%>
<%@ page import="guestbook.dao.GuestbookDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>

<%
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));

//페이징 처리 - 1페이지당 3개씩
int endNum = pg*3;
int startNum = endNum - 2;

//DB
GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); //싱글톤

Map<String, Integer> map = new HashMap<String, Integer>();
map.put("startNum", startNum);
map.put("endNum", endNum);

ArrayList<GuestbookDTO> list = guestbookDAO.guestbookList(map);

int totalA = guestbookDAO.getTotalA(); //총글수
int totalPage = (totalA + 2) / 3; //총페이지수

//응답

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#currentPaging {
	color: red;
	text-decoration: underline;
	font-size: 15pt;
}
#paging {
	color: black;
	text-decoration: none;
	font-size: 15pt;
}
</style>
</head>
<body>
<% if(list != null) { %>
	<% for(GuestbookDTO guestbookDTO : list) { %>
		<table border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th width="100">작성자</th>
				<td width="200"><%=guestbookDTO.getName() %></td>
				<th width="100">작성일</th>
				<td width="200"><%=guestbookDTO.getLogtime() %></td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td colspan="3"><%=guestbookDTO.getEmail() %></td>
			</tr>
			
			<tr>
				<th>홈페이지</th>
				<td colspan="3"><%=guestbookDTO.getHomepage() %></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td colspan="3"><%=guestbookDTO.getSubject() %></td>
			</tr>
			
			<tr>
				<td colspan="4"><pre><%=guestbookDTO.getContent() %></pre></td>
			</tr>
		</table>
		<hr>
	<%}//for %>
<%}//if %>

<!-- 페이지 번호 -->
<% for(int i=1; i<totalPage; i++) {%>
	<% if(i == pg) { %>
		[ <a id="currentPaging" href="guestbookList.jsp?pg=<%=i%>"><%= i %></a> ]
	<%}else{ %>
		[ <a id="paging" href="guestbookList.jsp?pg=<%=i%>"><%= i %></a> ]
	<%} %>
<%}//for %>
</body>
</html>












