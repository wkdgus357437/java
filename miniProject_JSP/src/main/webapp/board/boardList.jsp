<%@page import="board.bean.BoardPaging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));

//세션
String id = (String)session.getAttribute("memId");

//페이징 처리
int endNum = pg*5;
int startNum = endNum -4;

Map<String, Integer> map = new HashMap<String, Integer>();
map.put("startNum", startNum);
map.put("endNum", endNum);

//DB
BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.boardList(map);

//페이징 처리
int totalA = boardDAO.getTotalA(); //총 글수

BoardPaging boardPaging =new BoardPaging();
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);
boardPaging.makePagingHTML();



//응답

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#pagingDiv{ /*boardList에 있는거*/
/*border : 1px solid red;*/
text-align: center;
width : 950px;
margin-top : 10px;
}

#currentPaging{ /*BoardPaging에 있는거*/
border : 1px solid blue;
padding : 7px 10px;
margin : 2px;
color : red;
text-decoration: underline;
cursor : pointer;
}

#paging{ /*BoardPaging에 있는거*/
cursor : pointer;
padding : 7px 10px;
margin : 2px;
}

.subject:link{ color : black; text-decoration : none;
}

.subject:visited{color : black; text-decoration : none;
}

.subject:hover{color : green; text-decoration : underline;
}

.subject:active{color : black; text-decoration : none;
}
</style>
</head>
<body>
<% if(list != null){ %>
<table border="1" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th style="width:100px">글번호</th>
		<th style="width:400px">제목</th>
		<th style="width:100px">작성자</th>
		<th style="width:100px">조회수</th>
		<th style="width:200px">작성일</th>
	</tr>
<%for(BoardDTO boardDTO : list) { %>
<tr>
<td align="center"><%= boardDTO.getSeq() %></td>
<td><a href="#" class="subject" onclick="isLogin('<%=id%>',<%=boardDTO.getSeq()%>,<%=pg%>)"><%=boardDTO.getSubject() %></a></td>
<td align="center"><%= boardDTO.getId() %></td>
<td align="center"><%= boardDTO.getHit() %></td>
<td align="center"><%= new SimpleDateFormat("yyyy.MM.dd").format(boardDTO.getLogtime())%></td>
</tr>
<%}//for %>
</table>
<div id="pagingDiv"><%=boardPaging.getPagingHTML()%>
<input type="button" style="float:left" value="메인화면" onclick="mainPage()"/></div>
<%}//if%>

<script type="text/javascript">
function boardPaging(pg){
	location.href ="boardList.jsp?pg=" + pg;
}

function isLogin(id,seq,pg){
	   if(id =='null') alert("먼저 로그인 하세요 ");
	   else
		   location.href="boardView.jsp?seq="+seq+"&pg="+pg;
	}
	
	
function mainPage(){
		location.href="../index.jsp";
	}
</script>


</body>
</html>