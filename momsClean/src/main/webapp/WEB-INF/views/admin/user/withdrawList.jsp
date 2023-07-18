<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<h2><spring:message code="user.admin.header.list" /></h2>

<table border="1">
	<tr>
		<th align="center" width="60"><spring:message code="user.admin.userNo" /></th>
		<th align="center" width="60"><spring:message code="user.admin.userId" /></th>
		<th align="center" width="60"><spring:message code="user.admin.userName" /></th>
		<th align="center" width="60"><spring:message code="user.admin.userPhone" /></th>
		<th align="center" width="60"><spring:message code="user.admin.userEmail" /></th>
		<th align="center" width="60"><spring:message code="user.admin.emailAuth" /></th>
		<th align="center" width="60"><spring:message code="user.admin.regDate" /></th>
		<th align="center" width="60"><spring:message code="user.admin.userDivision" /></th>
		<th align="center" width="60"><spring:message code="user.admin.reserveDate" /></th>
		<th align="center" width="60"><spring:message code="user.admin.treatment" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="10">
					<spring:message code="common.user.listEmpty"></spring:message>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="user">
				<tr>
					<td align="center">${user.userNo}</td>
					<td align="center">${user.userId}</td>
					<td align="center">${user.userName}</td>
					<td align="center">${user.userPhone}</td>
					<td align="center">${user.userEmail}</td>
					<td align="center">${user.emailAuth}</td>
					<td align="center"><fmt:formatDate value="${user.regDate}" pattern="yyyy-MM-dd"/></td>
					<td align="center">${user.userDivision}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<script>
	var result = "${msg}";
	
	if (result === "SUCCESS"){
		alert("<spring:message code='common.user.withdrawSuccess' />");
	}
</script>