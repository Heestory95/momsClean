<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	background-color: #292730;
	color: white;
}
</style>

<h2>
	<spring:message code="user.admin.header.list" />
</h2>
<form:form modelAttribute="user">
	<table id="userList">
		<tr>
			<th align="center" width="70"><spring:message
					code="user.userNo" /></th>
			<th align="center" width="70"><spring:message
					code="user.userId" /></th>
			<th align="center" width="70"><spring:message
					code="user.userName" /></th>
			<th align="center" width="100"><spring:message
					code="user.userPhone" /></th>
			<th align="center" width="170"><spring:message
					code="user.userEmail" /></th>
			<th align="center" width="120"><spring:message
					code="user.emailAuth" /></th>
			<th align="center" width="120"><spring:message
					code="user.regDate" /></th>
			<th align="center" width="70"><spring:message
					code="user.userDivision" /></th>
			<th align="center" width="40"><spring:message
					code="user.treatment" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="10" align="center"><spring:message code="common.user.listEmpty"></spring:message>
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
						<td align="center"><fmt:formatDate value="${user.regDate}"
								pattern="yyyy-MM-dd" /></td>
						<td align="center">${user.userDivision}</td>
						<td align="center"><a href='/admin/user/modify?userNo=${user.userNo}'>탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form:form>
<!-- 페이징 네비게이션 -->
<div align="center" id="pagination">
	<c:if test="${pagination.prev}">
		<a href="/admin/user/list${pagination.makeQuery(pagination.startPage - 1)}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
		var="idx">
		<a href="/admin/user/list${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="/admin/user/list${pagination.makeQuery(pagination.endPage + 1)}">&raquo;</a>
	</c:if>
</div>
<!-- 검색 폼 -->
<form:form id="search" modelAttribute="pgrq" method="get" action="list${pgrq.toUriStringByPage(1)}" align="center">
	<form:select path="searchType" items="${searchTypeCodeValueList}" itemValue="value" itemLabel="label" />
	
	<form:input path="keyword"/>
	<button id='searchBtn'><spring:message code="action.search" /></button>
</form:form>
