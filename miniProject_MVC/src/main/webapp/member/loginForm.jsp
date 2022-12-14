<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
}

h2 {
	color: black;
}

body th {
	color: black;
}

#warp {
	position: absolute;
	top: 50%;
	left: 50%;
	height: 200px;
	margin: -150px;
}

div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="warp">
		<h2>로그인</h2>
		<form name="loginForm">
			<table border="1" cellpadding="5" cellspacing="0">

				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" id="id" size="30"
						placeholder="아이디 입력">
						<div id="idDiv"></div></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" id="pwd" size="40" placeholder="비밀번호 입력">
						<div id="pwdDiv"></div></td>
				</tr>

				<tr>
					<th colspan="2">
						<button type="button" id="loginBtn">로그인</button>
						<button type="button" onclick="location.href='writeForm.do'">회원가입</button>
					</th>
				</tr>
			</table>
			<br>
			<br>
			<div id="loginResult"></div>
		</form>
	</div>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		$('#loginBtn').click(function() {
			$('#idDiv').empty();
			$('#pwdDiv').empty();

			if ($('#id').val() == '') {
				$('#idDiv').text(' 아이디를 입력하세요.');
				$('#id').focus();

			} else if ($('#pwd').val() == '') {
				$('#pwdDiv').text('비밀번호를 입력하세요.');
				$('#pwd').focus();
			} else {
				$.ajax({
					url : '/miniProject_MVC/member/login.do',
					type : 'post',
					data : 'id=' + $('#id').val() + '&pwd=' + $('#pwd').val(), //data: {'id': $('#id').val(),'pwd': $('#pwd').val()} ->json표기법으로 쓴것
					dataType : 'text',
					success : function(data) {
						data = (data.trim()); //alert창 공백 없애기

						if (data == 'Ok') {
							location.href = '../index.jsp';
							//$('#idLogDiv').text('로그인 성공');
							//alert("로그인성공");
						} else if (data == 'Fail') {
							$('#loginResult').text('아이디 또는 비밀번호가 맞지 않습니다.');
							$('#loginResult').css('font-size', '12pt');
							//alert("로그인 실패");
						}
					},
					error : function(err) {
						console.log(err);
					}//error

				});//$.ajax   

			}
		});//loginBtn
	</script>
</body>

</html>

<!-- 
json 표기법
변수 : 값  이렇게 써야함 

 -->