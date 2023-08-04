<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
h2 {
	font-family: "나눔바른고딕";
}

table {
	font-family: "나눔바른고딕";
	width: 1000px;
	border-collapse: collapse;
	font-size: 14px;
	letter-spacing: -0.3px;
	margin-bottom: 10px;
}

th {
	border: none;
	padding-top: 8px;
	padding-bottom: 8px;
	font-size: 16px;
}

td {
	border-top: 1px solid #cfcbbb;
	border-bottom: 1px solid #cfcbbb;
	border-left: 1px solid #cfcbbb;
	border-right: 1px solid #cfcbbb;
	padding-top: 6px;
	padding-bottom: 6px;
	font-size: 15px;
}

#pagination {
	font-family: "나눔바른고딕";
	margin-bottom: 10px;
}

select {
	font-family: "나눔바른고딕";
	padding: 5px 9px 3px 9px;
	border: 1px solid #d8d3bd;
}

#search {
	font-family: "나눔바른고딕";
}

input {
	margin-right: 3px;
	padding: 5px 0 5px 0;
	border: 1px solid #d8d3bd;
	background-color: #fcfdf4;
}

button {
	position: relative;
	margin: 0 auto;
	cursor: pointer;
	margin-top: 0px;
	margin-bottom: 14px;
	padding: 3px 9px 5px 9px;
	border: 1px solid #e4e0cd;
	background-color: #36343f;
	color: white;
}
</style>
<h2 align="center">
	<spring:message code="reserve.admin.header.request" />
</h2>

<form:form modelAttribute="request">
	<table border="1" align="center">
		<tr>
			<th align="center" width="180"><spring:message
					code="reserve.reserveNo" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.userNo" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.userId" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.userName" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.itemNo" /></th>
			<th align="center" width="400"><spring:message
					code="reserve.reserveAddr" /></th>
			<th align="center" width="80"><spring:message
					code="reserve.totalPrice" /></th>
			<th align="center" width="90"><spring:message
					code="reserve.reserveDate" /></th>
			<th align="center" width="90"><spring:message
					code="reserve.cleanDate" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.reserveState" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.request" /></th>
			<th align="center" width="40"><spring:message
					code="reserve.treatment" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty request}">
				<tr>
					<td colspan="12" align="center"><spring:message
							code="common.listEmpty"></spring:message></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${request}" var="reserve">
					<tr>
						<td align="center">${reserve.reserveNo}</td>
						<td align="center">${reserve.userNo}</td>
						<td align="center">${reserve.userId}</td>
						<td align="center">${reserve.userName}</td>
						<td align="center">${reserve.itemNo}</td>
						<td align="center">${reserve.reserveAddr}</td>
						<td align="center">${reserve.reserveItemPrice + reserve.reserveOptionPrice}원</td>
						<td align="center"><fmt:formatDate
								value="${reserve.reserveDate}" pattern="yyyy-MM-dd" /></td>
						<td align="center"><fmt:formatDate
								value="${reserve.cleanDate}" pattern="yyyy-MM-dd" /></td>
						<td align="center">${reserve.reserveState}</td>
						<td align="center">${reserve.reserveRequest}</td>
						<td align="center"><a
							href='/admin/reserve/request/modify?reserveNo=${reserve.reserveNo}'>승인</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form:form>
<!-- 페이징 네비게이션 -->
<div align="center">
	<c:if test="${pagination.prev}">
		<a href="/admin/reserve/request/list${pagination.makeQuery(pagination.startPage - 1)}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
		var="idx">
		<a href="/admin/reserve/request/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="/admin/reserve/request/list${pagination.makeQuery(pagination.endPage + 1)}">&raquo;</a>
	</c:if>
</div>
<!-- 검색 폼 -->
<form:form modelAttribute="pgrq" method="get" action="list${pgrq.toUriStringByPage(1)}" align="center">
	<form:select path="searchType" items="${searchTypeCodeValueList}" itemValue="value" itemLabel="label" />
	
	<form:input path="keyword"/>
	<button id='searchBtn'><spring:message code="action.search" /></button>
</form:form>