<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="boardViewForm" id="boardViewForm" action=""> <!-- 동적으로 action=" "(속성)을 추가하려고 한다. -->
		<input type="hidden" id="seq" name="seq" value="${seq }"/> 
		<input type="hidden" id="pg" name="pg" value="${pg }"/>
		<input type="hidden" id="memId" value="${memId }"/>

		<table width="450" border="1" cellpadding="5" frame="hsides" rules="rows">
			
			<tr>
				<td colspan="3">
					<h2>
						<span id="subjectSpan"></span>
					</h2>
				</td>
			</tr>

			<tr>
				<td width="150">글번호 : <span id="seqSpan"></span></td>
				<td width="150">작성자 : <span id="idSpan"></span></td>
				<td width="150">조회수 : <span id="hitSpan"></span></td>
			</tr>

			<tr>
				<td colspan="3" height="250" valign="top">
				<div style="width:100%; height:100%; overflow:auto">
				<pre style="white-space: pre-line; word-break:break-all;">
				<span id="contentSpan"></span>
				</pre>
				</div>
				</td>
			</tr>
		
		</table>
	<div style="margin-top:5px;">
		<input type="button" value="목록" 
		onclick="location.href='/miniProject_MVC/board/boardListCheck.do?pg=${pg}'"/>
	<span id="boardViewSpan">
	
	<!-- jQuery 방식으로 ㄱ -->
	<input type="button" value="글수정" id="boardUpdateBtn">
	<input type="button" value="글삭제" id="boardDeleteBtn"/> 
	
	<!-- 자바스크립트방식으로 할때
	<input type="button" value="글수정" onclick="mode(1)"/>
	<input type="button" value="글삭제"onclick="mode(2)"/>
	 -->
	
	
    </span>
    </div>
	</form>
	
<script type="text/javascript">
/*  자바스크립트방식
function mode(num){
	if(num==1){ // 글수정 - seq / pg 
		document.boardViewForm.method = "post";
		document.boardViewForm.action = "/miniProject_MVC/board/boardUpdateForm.do";
		document.boardViewForm.submit();
	}else if(num==2){ // 글삭제 - seq 
		if(confirm("정말로 삭제하시겠습니까?")){
		document.boardViewForm.method = "post";
		document.boardViewForm.action = "/miniProject_MVC/board/boarDelete.do";
		document.boardViewForm.submit();
		}//if
	}
}//mod
*/
</script>	
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:'/miniProject_MVC/board/getBoard.do',
		type: 'post',
		data:'seq=' + $('#seq').val(),
		dataType:'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#idSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			if($('#memId').val() == data.id){
				$('#boardViewSpan').show()
			}else{
				$('#boardViewSpan').hide()
			}
			
		},
		error : function(err){
			console.log(err);
		}
		
	});//#.ajax
	
});

//글 수정 jQuery
$('#boardUpdateBtn').click(function(){
	$('#boardViewForm').attr('action','/miniProject_MVC/board/boardUpdateForm.do');
	$('#boardViewForm').submit();
});//글 수정

//글 삭제
$('#boardDeleteBtn').click(function(){
	if(confirm("정말로 삭제 하시겠습니까?")){
		$.ajax({
			url: '/miniProject_MVC/board/boardDelete.do',
			type: 'post',
			data:'seq=' + $('#seq').val(),
			success: function(){
				alert("글삭제 완료");
			location.href ='/miniProject_MVC/board/boardListCheck.do?pg=1';
			},
			error:function(err){
				console.log(err)
			}
			
			
			
		});// $.ajax
	}
	
});// 글 삭제
	



	
</script>
</body>
</html>
