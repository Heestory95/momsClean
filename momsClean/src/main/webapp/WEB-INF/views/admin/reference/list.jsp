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
<style>

	h2{
		font-size:50px;
		color:#6AAAFF;
	}
	
	#reference{
		border-left:0px;
		border-right:0px;
	}
	
	th{
	background-color:#6AAAFF;
	}
	


	
</style>
<br><br>
<h2 id=title>
	<spring:message code="reference.header" />
</h2>

<!-- 검색 폼을 만든다. -->
<form:form modelAttribute="pgrq" method="get"
	action="/admin/reference/list" align="center">
	<form:select path="searchType" items="${searchTypeCodeValueList}"
		itemValue="value" itemLabel="label" />

	<form:input path="keyword" />
	<button id="searchBtn">
		<spring:message code="action.search" />
	</button>
	<br><br>
</form:form>

<form:form modelAttribute="reference">
<table id=reference border="0">
	<tr>
		<th align="center" width="150"><spring:message code="reference.no" /></th>
		<th align="center" width="370"><spring:message
				code="reference.title" /></th>
		<th align="center" width="150"><spring:message
				code="reference.name" /></th>
		<th align="center" width="150"><spring:message
				code="reference.referenceDate" /></th>
	</tr>

	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="4"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
		

		
	<c:forEach items="${list}" var="reference">
    <tr>
        <td align="center">${reference.no}
        	<c:choose>
    <c:when test="${empty reference.no}"><B>└</B></c:when>
    </c:choose>
        </td>
        <td align="left">
            <a href="/admin/reference/read${pgrq.toUriString(pgrq.page)}&referenceNo=${reference.referenceNo}">
                <c:out value="${reference.referenceTitle}" />
            </a>
        </td>
        <td align="center">${reference.userName}</td>
        <td align="center">
            <fmt:formatDate pattern="yyyy-MM-dd" value="${reference.referenceDate}" />
        </td>
    </tr>
</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</form:form>
<br>
<!-- 페이징 네비게이션 -->
<!-- 페이징 네비게이션 -->
<div align="center">
	<c:if test="${pagination.prev}">
		<a
			href="/admin/reference/list${pagination.makeQuery(pagination.startPage - 1)}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
		var="idx">
		<c:url var="pageLink" value="/admin/reference/list">
			<c:param name="page" value="${idx}" />
			<c:param name="searchType"
				value="${pagination.pageRequest.searchType}" />
			<c:param name="keyword" value="${pagination.pageRequest.keyword}" />
		</c:url>
		<a href="${pageLink}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a
			href="/admin/reference/list${pagination.makeQuery(pagination.endPage + 1)}">&raquo;</a>
	</c:if>
</div>



<script>
	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>