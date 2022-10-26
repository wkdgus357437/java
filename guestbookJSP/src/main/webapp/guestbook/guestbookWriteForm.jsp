<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	color:red;
	font-size: 8pt;
	font-weight: bold;
}

#name{
	width:200px;
}
#email{
	width:300px;
}
#homepage{
	width:350px;
}
#subject{
	width:500px;
}
#content{
	width:480px;
	height:250px;
}
</style>
</head>
<body>
<form name="guestbookWriteForm" method="post" action="guestbookWrite.jsp">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center">작성자</td>
			<td>
				<input type="text" id="name" name="name" placeholder="작성자 입력">
			</td>
		</tr>
		
		<tr>
			<td align="center">이메일</td>
			<td>
				<input type="text" id="email" name="email" placeholder="이메일 입력">
			</td>
		</tr>
		
		<tr>
			<td align="center">홈페이지</td>
			<td>
				<input type="text" id="homepage" name="homepage" value="http://">
			</td>
		</tr>
		
		<tr>
			<td align="center">제목</td>
			<td>
				<input type="text" id="subject" name="subject" placeholder="제목입력">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea rows="5" cols="40" id="content" name="content"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th colspan="2" align="center">
				<input type="button" value="글작성" onclick="checkGuestbookWrite()">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onclick="location.href='http://localhost:8080/guestbookJSP/guestbook/guestbookList.jsp?pg=1'">
			</th>
		</tr>
	
	</table>
</form>
<script type="text/javascript">
function checkGuestbookWrite(){
	document.getElementById("subjectDiv").innerText="";
	document.getElementById("contentDiv").innerText="";
	
	if(document.getElementById("subject").value =="")
		document.getElementById("subjectDiv").innerText="제목을 입력하세요"
		
	else if(document.getElementById("content").value =="")
		document.getElementById("contentDiv").innerText="내용을 입력하세요"
		
	else
		document.guestbookWriteForm.submit();
}
</script>
</body>
</html>