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
			
			$('<tr/>').append($('<td/>',{
				align:'center',
				text: items.seq
			})).append($('<td/>',{
				text: items.subject
			})).append($('<td/>',{
				text: items.id
			})).append($('<td/>',{
				align:'center',
				text: items.hit
			})).append($('<td/>',{
				text: items.logtime
			})).appendTo($('#boardListTable')); // boardListCheck의 table태그 동적처리
			
			
			}); //$each
			
			
		},
		error: function(err){
			console.log(err);
		}
		
	});// $.ajax({});

}); // $(document).ready(function(){});