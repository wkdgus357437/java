<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글번호 : ${param.seq }<br>
페이지 번호 : ${param.pg }<br>
<input type="button" name="boardlist" value="목록으로" onclick="boardListCheck()" style="float : left">

<script type="text/javascript">
function boardListCheck(){
		location.href="/mvcBoard/board/boardListCheck.do?pg=1";
}
</script>
</body>
</html>