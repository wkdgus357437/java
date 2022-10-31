<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	color : red;
	font-size : 8pt;
	font-weight : bold;
}
</style>
</head>
<body>
	<h2>로그인</h2>  
	<form name="loginForm" method="post" action="/mvcMember/member/login.do" >
	<table border="1" cellpadding="5" cellspacing="0">
	  
    	<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="idLog" id="idLog" size="30" placeholder="아이디 입력">
				<div id="idLogDiv"></div>		
			</td>
    	</tr>
    
	    <tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwdLog" id="pwdLog" size="40" placeholder="비밀번호 입력" >	
				<div id="pwdLogDiv"></div>
			</td>
	    </tr>
	    
		<tr>
	   		<th colspan="2">
				<button type="button" onclick="checkLogin()" id="idLogin">로그인</button>
				<button type="button" 
				onclick="location.href='writeForm.do'">회원가입</button>
		 	</th>    
		</tr>
   </table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>

<!-- 
	<script type="text/javascript"> 
	
	function checkLogin(){
			document.getElementById("idDiv").innervalue = "";
			document.getElementById("pwdDiv").innerText = "";
		
	  	if(document.loginForm.id.value == ""){
			document.getElementById("idDiv").innerText="아이디를을 입력하세요";
			document.loginForm.id.focus();
			
	    }else if(document.getElementById("pwd").value == "") {
			document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
	  	    document.loginForm.id.focus();

		}else {
	  	    document.loginForm.submit();
		}
}
	
</script> 
 -->
</body>
</html>