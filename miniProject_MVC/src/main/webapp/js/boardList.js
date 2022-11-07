//$(function(){});  => $(document).ready(function(){}); 같은거임
$(document).ready(function() {
	//DB에서 1페이지당 5개씩 가져오기
	$.ajax({
		url: '/miniProject_MVC/board/getBoardList.do',
		type: 'post',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			//alert(data.list[0].id)
			
			//for(BoardDTO items : data.list)->java //<c:forEach var="items" items="${data.list}">	
			$.each(data.list, function(index, items){
			 console.log(index, items.seq, items.id, items.name, items.subject);
			
			$('<tr/>').append($('<td/>',{ //append -> 메소드 체인 방식 
				align:'center',
				text: items.seq
			
			})).append($('<td/>',{
				//align:'center',
			
			}).append($('<a/>',{
				href:'#',
				text: items.subject,
				class:'subjectA' //class 이벤트 을 쓴 이유는 여러개 이기 때문이다. id이벤트는 하나의 목적이 있을 때 그걸로 하자  
			    }))
			).append($('<td/>',{
				align:'center',
				text: items.id
			})).append($('<td/>',{
				align:'center',
				text: items.hit
			})).append($('<td/>',{
				align:'center',
				text: items.logtime
			})).appendTo($('#boardListTable')); // boardListCheck의 table태그 동적처리
			
			}); //$each
			
			//페이징 처리 부분 (boardListCheck,jps로 넘어감)
			$('#pagingDiv').html(data.pagingHTML);
			
			//로그인 여부
			$('.subjectA').click(function(){
				if($('#memId').val()=='') alert('먼저 로그인하세요.');
				else{
				// alert ($(this).parent().prev().prop('tagName')) //this 자기자신을 나타낸다 , prev 앞 형제 
				//alert ($(this).parent().prev().text());//글번호 찍자. //DOM
				
				var seq = $(this).parent().prev().text();
				location.href='/miniProject_MVC/board/boardViewCheck.do?seq='+seq+"&pg="+$('#pg').val();
				}
			});
			
		},
		error: function(err){
			console.log(err);
		}
		
	});// $.ajax({});

}); // $(document).ready(function(){});