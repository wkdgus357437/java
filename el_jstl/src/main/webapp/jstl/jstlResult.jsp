<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- if또는 다중문 쓰려고할떄 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 한글 처리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="UTF-8"/> <!-- 한글처리 -->
	<ul>
		<li>이 름 : ${param.name }</li><br/>
		
		<li>나 이 : ${param.age }
		<c:if test="${param.age >= 19 }"><Strong>성인</Strong></c:if> 
		<c:if test="${param.age < 19 }"><Strong>청소년</Strong></c:if><!-- else가 없으니 다시한번 만든다. -->
		</li><br/><!-- name 속성을 가지고 온다 -->

		<li>색깔 : 
		<c:if test="${param.color == 'red' }" >빨강</c:if> 
		<c:if test="${param.color == 'green' }">초록</c:if>
		<c:if test="${param.color == 'blue' }">파랑</c:if>
		<c:if test="${param.color == 'magenta' }">보라</c:if>
		<c:if test="${param.color == 'cyan' }">하늘</c:if>
		</li><br/> <!-- if문 같은것 // name 속성을 가지고 온다-->
		
		<li>색 깔 :
      <c:choose>
         <c:when test="${param.color == 'red' }"><strong>빨강</strong></c:when>
         <c:when test="${param.color == 'green' }"><strong>초록</strong></c:when>
         <c:when test="${param.color == 'blue' }"><strong>파랑</strong></c:when>
         <c:when test="${param.color == 'magenta' }"><strong>보라</strong></c:when>
         <c:otherwise><strong>하늘</strong></c:otherwise>
      </c:choose>
   </li><br /> <!-- switch 같은 것 // name 속성을 가지고 온다 -->
   
	<li>취미 : 
		${paramValues['hobby'][0] } <!-- paramValues.hobby[0] -->
		${paramValues['hobby'][1] }
		${paramValues['hobby'][2] }
		${paramValues['hobby'][3] }
		${paramValues['hobby'][4] }
	</li><br/> <!--배열 -->
	
	<li>취미 :  
		<c:forEach var="data" items="${paramValues.hobby}"> 
		${data }</c:forEach>
	</li><br/> <!--배열 for문 방식으로//java에서는 타입을 String data로 하지만 여기선 그냥  var에 data로 잡아주면된다  -->
	</ul>
</body>
</html>

