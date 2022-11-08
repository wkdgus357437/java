$(function() {
	$('#join').submit(function() {

		var user_id = $('input[name="user_id"]').val();
		if (!user_id) {
			alert('아이디를 입력하세요.');
			$('input[name="user_id"]').focus();
			return false;
		}// user_id

		var user_pw = $('input[name="user_pw"]').val();
		if (!user_pw) {
			alert('비밀번호를 입력하세요.');
			$('input[name="user_pw"]').focus();
			return false;
		}// user_pw 

		var juminno = $('input[name="juminno"]').val();
		if (!juminno) {
			alert('주민번호를 입력하세요.');
			$('input[name="juminno"]').focus();
			return false;
		}// juminno

		if (!$('input[name="gender"]').is(':checked')) {
			alert('성별을 체크하세요.');

			//남자가 체크되게하기 //배열 형식이니[0]으로 ..
			//document.form1.gender[0].checked =true;
			//$('input[name="gender"]:eq(0)').attr('checked', true);
			$('input[name="gender"]:eq(0)').prop('checked', true);
			return false;
		} // gender

		var email = $('input[name="email"]').val();
		if (!email) {
			alert('이메일을 입력하세요.');
			$('input[name="email"]').focus();
			return false;
		}// email 

		var url = $('input[name="url"]').val();
		if (!url) {
			alert('URL을 입력하세요.');
			$('input[name="url"]').focus();
			return false;
		}// url 

		var hpno = $('input[name="hpno"]').val();
		if (!hpno) {
			alert('핸드폰 번호를 입력하세요.');
			$('input[name="hpno"]').focus();
			return false;
		}// hpno 

		if (!$('input[name="hobby"]').is(':checked')) {
			alert('취미를 선택하세요');
			$('input[name="hobby"]:eq(0)').attr('checked', true);
			return false;
		}// hobby

		if ($('select[name="job"]>option:selected').index() < 1) {
			alert('직업을 선택하세요');
			$('select[name="job"]>option:eq(1)').attr('selected', true);
			return false;
		}// job

		//--------------------------------------------------------------------------------------------
		//입력한 내용을 화면에 출력
		var gender = $('input[name="gender"]:checked').val();


		var hobby = $('input[name="hobby"]:checked');//여러개 선택할수 있으니 for문으로
		var hobby_val = "";
		hobby.each(function() {
			hobby_val += $(this).val() + "  "; // $(this)  => 반목문에서 hobby 안에 포함된 객체를 의미 
		});

		var job = $('select[name="job"]>option:selected').val();

		var result = '<ul>';
		result += '<li>아이디 : ' + user_id + '</li>';
		result += '<li>비밀번호 : ' + user_pw + '</li>';
		result += '<li> 주민번호 : ' + juminno + '</li>';
		result += '<li>성별 : ' + gender + '</li>';
		result += '<li>이메일 : ' + email + '</li>';
		result += '<li>홈페이지 : ' + url + '</li>';
		result += '<li>핸드폰 : ' + hpno + '</li>';
		result += '<li>취미 : ' + hobby_val + '</li>';
		result += '<li>직업 : ' + job + '</li>';
		result += '</ul>';

		$('body').html(result);

		return false;//페이지 이동 못하게 막기
	});// $('#join').submit(function(){});
});// $(function(){});