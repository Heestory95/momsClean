<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 신규 문의 -->
<div>
<h3>
	<spring:message code="home.admin.reference" />
</h3>

<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="reference.no" /></th>
		<th align="center" width="80"><spring:message code="user.no" /></th>
		<th align="center" width="320"><spring:message
				code="reference.title" /></th>
		<th align="center" width="100"><spring:message
				code="reference.name" /></th>
		<th align="center" width="100"><spring:message
				code="reference.referenceDate" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="5"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="home">
				<tr>
					<td align="center">${home.referenceNo}</td>
					<td align="center">${home.userNo}</td>
					<td align="left">${home.referenceTitle}</td>
					<td align="center">${home.userName}</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
							value="${home.referenceDate}" /></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>
<!-- 신규 예약 -->
<div></div>
<!-- 신규 리뷰 -->
<div></div>
<!-- 통계 차트 -->
<div></div>