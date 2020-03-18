<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! int x;
	int y;
	int result; %>

	<span> JSP table</span>
	<table border="1">
		<% for(x=0;x<10;x++){ %>
			<tr>
				<% for(y=0;y<10;y++){ %>
					<td>
						<% if( x == 0 ){
							out.print(y);
						} else if( y == 0 ){
							out.print(x);
						} else {
							result=(x*y);
							out.print(result);
						} %>
					</td>
					<% } %>
			</tr>
			<% } %>
	</table>

	<span> JSP + JSTL table</span>


    <c:set var="size" value = "9" />

	<table border="1">
    <c:set var="x" value= "${ 0 }" />
    <c:forEach begin="0" end= "${ size }" step="1">

		<tr>
		    <c:set var="y" value= "${ 0 }"  />
		 	<c:forEach begin="0" end= "${ size }" step="1">
				<td>
    				<c:choose>
					  <c:when test= "${x eq 0}">
					  	<c:out value="${ y }" />
					  </c:when>
					  <c:when test= "${y eq 0}">
					    <c:out value="${ x }" />
					  </c:when>
					  <c:otherwise>
					   <c:set var = "result"  value = "${x * y}"/>
					    <c:out value= "${ result }" />
					  </c:otherwise>
					</c:choose>
    				<c:set var="y" value="${ y + 1 }" />
				</td>
   			</c:forEach>
   			<c:set var="x" value="${ x + 1 }" />
		</tr>
    </c:forEach>
</table>

</body>

</html>