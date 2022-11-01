function change() {
	document.writeForm.email2.value = document.writeForm.email3.value;
}
function checkWrite() {
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").inrnerText = "";
	document.getElementById("pwdDiv").inneText = "";

	if (document.getElementById("name").value == "")
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";

	else if (document.getElementById("id").value == "")
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";

	else if (document.getElementById("pwd").value == "")
		document.getElementById("pwdDiv").innerText = "비밀번호를 입력하세요";

	else if (document.getElementById("pwd").value != document.getElementById("repwd").value)
		document.getElementById("pwdDiv").innerText = "비밀번호가 맞지 않습니다.";

	else if (document.writeForm.id.value != document.writeForm.check.value)
		document.getElementById("idDiv").innerText = "아이디 중복체크 하세요";

	else
		document.writeForm.submit();
}

//중복 아이디 체크 jQuery적용
$('#id').focusout(function() {
	//if (document.getElementById("id").value == "")
	//	document.getElementById("idDiv").innerText = "아이디를 입력하세요";

	//jQuery 함수 이용하여 적용
	if ($('#id').val() == '') {
		$('#idDiv').text('먼저 아이디를 입력하세요.');
		$('#idDiv').css('color', 'magenta');
	} else {
		//서버로 요청하고 다시 제자리로 돌아오기
		$.ajax({
			url: 'http://localhost:8080/miniProject_MVC/member/checkId.do',				// 서버로 요청할 URL
			type: 'post',																// get or post 방식 중 어떤걸로?
			data: 'id=' + $('#id').val(), 												// 서버로 보낼 데이터 형식
			dataType: 'text', // text, html, xml, json 	//객체로오는건 json형식으로 바꿔야함	// 서버로부터 받은 데이터 자료형
			success: function(data) {
				data = (data.trim());									// trim() ->공백제거
				if (data == 'exist') { //사용 불가능
					$('#idDiv').text('사용 불가능');
				} else if (data == 'non_exist') { //사용가능
					$('#idDiv').text('사용 가능');
					$('#idDiv').css('color', 'powderblue');

					$('input[name="check"]').val($('#id').val());
				}
			},									// 데이터 받기
			error: function() { }
		});//$.ajax            
	}
});//writeForm

/* loginForm에서 따로 js 파일로 옮겨서 할떄임... idLog 와 pwdLog는 name이 writeForm과 곂칠까봐 바꾼거임(이대 하려면 loginForm 바꿔줘야함)
$('#idLogin').click(function() {
	if ($('#idLog').val() == '') {
		$('#idLogDiv').text('먼저 아이디를 입력하세요.');
		$('#idLogDiv').css('color', 'magenta');
	} else if ($('#pwdLog').val() == '') {
		$('#pwdLogDiv').text('비밀번호를 입력하세요.');
		$('#pwdLogDiv').css('color', 'red');
	} else {
		$.ajax({
			url: 'http://localhost:8080/miniProject_MVC/member/loginCheck.do', //loginCheck.do ->command.properties에서 정해줘야함
			type: 'post',
			data: 'id='+$('#idLog').val()+'&pwd='+$('#pwdLog').val(),
			dataType: 'text',
			success: function(login){
				login=(login.trim());
				if(login == 'LoginOk'){
					//$('#idLogDiv').text('로그인 성공');
					alert("로그인성공");
				}else if(login =='LoginFail'){
				//$('#idLogDiv').text('로그인 실패');
				alert("로그인 실패");
				}
			},
			error: function() { }

		});//$.ajax   

	}
});//loginForm
*/