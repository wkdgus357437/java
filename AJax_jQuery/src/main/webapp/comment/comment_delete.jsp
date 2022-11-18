<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="result" value="true"></c:set>
<c:set var="message" value="덧글이 삭제 되었습니다."></c:set>

<?xml version="1.0" encoding="UTF-8"?>
<!-- 여기서 이거 쓸려면 공백제고해야됨 -->
<comment>
<result>${result }</result> 
<message>${message }</message>
</comment>