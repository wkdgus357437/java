<%@ page language="java" contentType="text/xml; charset=UTF-8" 
    pageEncoding="UTF-8"%> <%--  contentType="text/html; 의 html을 xml 형식으로 바꿈 --%>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML파일 태그 시작 전의 공백 문자 제거--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%--JSTL사용하기 위한것(jstl.jar파일 넣고 선언하기) --%>

<%-- 
DB 연동 - 아이디가 "hong" 이면 이미 DB에 저장된 아이디로 취급 (true 전달)

--%>

<c:set var="result" value="false"/> <%--변수설정 --%>
<c:if test="${param.user_id =='hong' }"><%--/ user_id가 hong인가? / --%>
	<c:set var="result" value="ture"/>
</c:if>

<?xml version="1.0" encoding="UTF-8"?>  <%-- xml 선언 (DTD앞에는 공백,글자등 들어가면 안됨) // 아래 태그는 내가 만든것임--%>
<check_id>
	<result>${result }</result>
</check_id>