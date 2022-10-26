	function change(){
			document.writeForm.email2.value = document.writeForm.email3.value;
}
	function checkWrite(){
		document.getElementById("nameDiv").innerText = "";
		document.getElementById("idDiv").inrnerText = "";
		document.getElementById("pwdDiv").inneText = "";
		
			if(document.getElementById("name").value == "")
				document.getElementById("nameDiv").innerText="이름을 입력하세요";
			
			else if(document.getElementById("id").value == "")
				document.getElementById("idDiv").innerText="아이디를 입력하세요";
		
			else if(document.getElementById("pwd").value == "")
				document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
			
			else if(document.getElementById("pwd").value != document.getElementById("repwd").value)
				document.getElementById("pwdDiv").innerText="비밀번호가 맞지 않습니다.";
				
			else if(document.writeForm.id.value != document.writeForm.check.value)
				document.getElementById("idDiv").innerText="아이디 중복체크 하세요";
			
			else
				document.writeForm.submit();
		}
		
function checkId(){
	
	var sId = document.getElementById("id").value;
	
	if(sId == "") 
		//document.getElementById("idDiv").innerText="먼저 아이디를 입력하세요"
		document.getElementById("idDiv").innerHTML ="<font color='magenta'>먼저 아이디를 입력하세요</font>"
	else
		window.open("checkId.jsp?id="+sId, "checkId", "width=500 height=150 left=600 top= 300");
		//팝업 창 오픈 , checkId-똑같은 아이디는 두번이상 창이 안열린다
		// left=600-왼쪽에서 얼마나 띄울꺼냐 top= 300-위에서 얼마나 띄울꺼냐
		//checkId.jsp?변수=값 - 회원가입 창의 id값을 가져와서 중복인지 아닌지 체크하기는 코드
		//실제로는 window.open을 많이 안쓰고, 부트스트랩 - 다이얼러고를 많이 쓴다
}		
		
		