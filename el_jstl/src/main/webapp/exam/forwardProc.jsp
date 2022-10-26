<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setAttribute("apple", "사과");

//페이지 이동 -> 이걸 더 많이 쓴다고 함 
//RequestDispatcher dispatcher = request.getRequestDispatcher("상대번지");
// 상대번지->나 를 기준으로 , 절대번지 ->http://localhost~ 이런거


//중요
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");
dispatcher.forward(request, response); //forwardResult 에게 제어권 넘기기
%>

<%-- 
<jsp:forward page="forwardResult.jsp"/>  --%>

