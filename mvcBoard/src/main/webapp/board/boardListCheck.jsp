<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- if또는 다중문 쓰려고할떄 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pagingDiv { /*boardList에 있는거*/
	/*border : 1px solid red;*/
	text-align: center;
	width: 950px;
	margin-top: 10px;
} 

#currentPaging { /*BoardPaging에 있는거*/
	border: 1px solid blue;
	padding: 7px 10px;
	margin: 2px;
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging { /*BoardPaging에 있는거*/
	cursor: pointer;
	padding: 7px 10px;
	margin: 2px;
}

.subject:link {
	color: black;
	text-decoration: none;
}

.subject:visited {
	color: black;
	text-decoration: none;
}

.subject:hover {
	color: green;
	text-decoration: underline;
}

.subject:active {
	color: black;
	text-decoration: none;
}
</style>

</head>
<body>
	<table border="1" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<th style="width: 100px">글번호</th>
			<th style="width: 400px">제목</th>
			<th style="width: 100px">작성자</th>
			<th style="width: 100px">조회수</th>
			<th style="width: 200px">작성일</th>
		</tr>		
		
		<c:forEach var="boardDTO" items="${requestScope.list }" >
		<tr>
<td align="center">${ boardDTO.seq}</td>
<td><a href="#" class="subject" onclick="isLogin(${boardDTO.seq},${param.pg})">${boardDTO.subject }</a></td>
<td align="center">${ boardDTO.id }</td>
<td align="center">${ boardDTO.hit}</td>
<td align="center">${ boardDTO.logtime}</td>
</tr>
		 </c:forEach>
		
	</table>
<div>
${pagingHTML}
</div>
	<script type="text/javascript">
		function boardPaging(pg) {
			location.href = "/mvcBoard/board/boardListCheck.do?pg=" + pg;
		}

		function isLogin(seq, pg) {
			//if (id == 'null')
			//	alert("먼저 로그인 하세요 ");
			//else
				location.href = "/mvcBoard/board/boardViewCheck.do?seq=" + seq + "&pg=" + pg;
		}

		function mainPage(){
		location.href="/mvcBoard/board/boardWriteForm.do";
}
	</script>

</body>
</html>