<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style type="text/css">

a{
text-decoration: none;
}
</style>

<div>
	<c:if test="${sessionScope.memId == null }">
		<input type="button" value="로그인" onclick="location.href='/miniProject_MVC/member/loginForm.do'">
		<br>
		<br>
		<a href="/miniProject_MVC/member/writeForm.do"
			style="font-size: 10pt;">회원가입</a>
	</c:if>
	<c:if test="${memId !=null }">
		<h3><a href="/miniProject_MVC/member/updateForm2.do">${memId}</a>님 로그인</h3> <!-- GetMemberService, -->
		<input type="button" value="로그아웃" id="logoutBtn">
	</c:if>
	<br>
	<br>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$('#logoutBtn').click(function() {
		$.ajax({
			url : '/miniProject_MVC/member/logout.do',
			type : 'post',
			success : function() {
				alert('로그아웃');
				location.href = "/miniProject_MVC/index.jsp"; //incloud되어 상대번지로 (../) 말고 (./)이렇게
			},
			error : function(err) {
				console.log(err);
			}//error
		});//ajax
	});//logoutBtn
</script>