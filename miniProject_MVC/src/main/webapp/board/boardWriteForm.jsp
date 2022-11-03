<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form[name="boardWriteForm"] div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>

<h3>글쓰기</h3>
<form name="boardWriteForm" id="boardWriteForm">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th width="70">제목</th>
			<td>
				<input type="text" name="subject" id="subject" maxlength="500" style="width: 350px;" placeholder="제목입력"/>
            	<div id="subjectDiv"></div>	
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" id="content" cols="50" rows="15" style="white-space: pre-wrap;"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글작성"  id="boardWriteBtn">
            	<input type="reset" value="다시작성">				
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$('#boardWriteBtn').click(function() {
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if ($('#subject').val() == '') {
		$('#subjectDiv').text(' 제목을 입력하세요.');
		$('#subject').focus();
	}else if ($('#content').val() == ''){
		$('#contentDiv').text(' 내용을 입력하세요.');
		$('#content').focus();
	}else{
		$.ajax({
			url: '/miniProject_MVC/board/boardWriteCheck.do',
			type: 'post',
			data: $('#boardWriteForm').serialize(),
			/* date :{ // json 
				'subject' : $('#subject').val(),
				'content' : $('#content').val()
			},
			*/
			dataType:'text',
			success:function(){
				alert("글을 저장하였습니다.");
				location.href ='/miniProject_MVC/board/boardListCheck.do?pg=1';
			},
			eroor:function(err){
				console.log(err);
			}
			
		});//$.ajax
		
	}
	
});// boardWrite


/*
function checkBoardWrite(){
	document.getElementById("subjectDiv").innerText="";
	document.getElementById("contentDiv").innerText="";
	   
	if(document.getElementById("subject").value == "")
		document.getElementById("subjectDiv").innerText="제목을 입력하세요";
	
	else if(document.getElementById("content").value == "")
		document.getElementById("contentDiv").innerText="내용을 입력하세요";
	
	else
		document.boardWriteForm.submit();

}
*/
</script>
</body>
</html>









