<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2 align="center">
	<spring:message code="user.admin.header.withdraw" />
</h2>
<form:form modelAttribute="user">
	<table border="1" align="center">
		<tr>
			<th align="center" width="70"><spring:message
					code="user.admin.userNo" /></th>
			<th align="center" width="70"><spring:message
					code="user.admin.userId" /></th>
			<th align="center" width="70"><spring:message
					code="user.admin.userName" /></th>
			<th align="center" width="110"><spring:message
					code="user.admin.userPhone" /></th>
			<th align="center" width="170"><spring:message
					code="user.admin.userEmail" /></th>
			<th align="center" width="120"><spring:message
					code="user.admin.emailAuth" /></th>
			<th align="center" width="120"><spring:message
					code="user.admin.regDate" /></th>
			<th align="center" width="70"><spring:message
					code="user.admin.userDivision" /></th>
			<th align="center" width="120"><spring:message
					code="user.admin.withdrawDate" /></th>
			<th align="center" width="60"><spring:message
					code="user.admin.treatment" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty withdraw}">
				<tr>
					<td colspan="10"><spring:message code="common.user.listEmpty"></spring:message>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${withdraw}" var="user">
					<tr>
						<td align="center">${user.userNo}</td>
						<td align="center">${user.userId}</td>
						<td align="center">${user.userName}</td>
						<td align="center">${user.userPhone}</td>
						<td align="center">${user.userEmail}</td>
						<td align="center">${user.emailAuth}</td>
						<td align="center"><fmt:formatDate value="${user.regDate}"
								pattern="yyyy-MM-dd" /></td>
						<td align="center">${user.userDivision}</td>
						<td align="center"><fmt:formatDate value="${user.withdrawDate}"
								pattern="yyyy-MM-dd" /></td>
						<td align="center"><a href='/admin/user/withdraw/modify?userNo=${user.userNo}'>복구</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form:form>
<!-- 페이징 네비게이션 -->
<div align="center">
	<c:if test="${pagination.prev}">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
		var="idx">
		<a href="/admin/user/withdraw/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage + 1}">&raquo;</a>
	</c:if>
</div>
