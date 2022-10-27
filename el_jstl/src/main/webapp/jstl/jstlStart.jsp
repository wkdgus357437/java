<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jstl.PersonDTO"%>
<%@page import="java.util.List"%>



<%
List<String> list = new ArrayList<String>();
list.add("호랑이");
list.add("사자");
list.add("기린");
list.add("코끼리");
list.add("타조");
list.add("코알라");
list.add("여우");


PersonDTO aa = new PersonDTO("홍길동",25);
PersonDTO bb = new PersonDTO("네 오",23);
PersonDTO cc = new PersonDTO("프로도",30);

List<PersonDTO>list2 = new ArrayList<PersonDTO>();
list2.add(aa);
list2.add(bb);
list2.add(cc);
//리스트라는 이름으로  데이터 담기
request.setAttribute("list",list); 
request.setAttribute("list2",list2); 
//페이지 이동
//response.sendRedirect("jstlEnd.jsp");
RequestDispatcher dispatcher = request.getRequestDispatcher("jstlEnd.jsp");
dispatcher.forward(request, response);
%>
<%-- <jsp:forward page="jstlEnd.jsp"/>  --%>