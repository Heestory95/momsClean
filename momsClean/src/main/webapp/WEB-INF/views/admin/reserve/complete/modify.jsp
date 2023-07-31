<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2 align="center">
	<spring:message code="reserve.admin.header.info" />
</h2>
<form:form modelAttribute="reserve" action="modify">
	<form:hidden path="reserveNo" />
	
	<table border="1" align="center">
		<c:forEach var="reserve" items="${completeModifyForm}">
			<tr>
				<td><spring:message code="reserve.reserveNo" /></td>
				<td>${reserve.reserveNo}</td>
			</tr>
			<tr>
				<td><spring:message code="reserve.reserveUserName" /></td>
				<td>${reserve.userName}(${reserve.userId})</td>
			</tr>
			<tr>
				<td><spring:message code="reserve.reserveAddr" /></td>
				<td>${reserve.reserveAddr}</td>
			</tr>
			<tr>
				<td rowspan="2"><spring:message code="reserve.itemInfo" /></td>
				<td>상품 : ${reserve.reserveItemName}</td>
			</tr>
			<tr>
				<td>가격 : ${reserve.reserveItemPrice}원</td>
			</tr>
			<tr>
				<td rowspan="2"><spring:message code="reserve.optionInfo" /></td>
				<td>옵션 : ${reserve.reserveOptionName}</td>
			</tr>
			<tr>
				<td>가격 : ${reserve.reserveOptionPrice}원</td>
			</tr>
			<tr>
				<td><spring:message code="reserve.reserveDate" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${reserve.reserveDate}" /></td>
			</tr>
			<tr>
				<td><spring:message code="reserve.cleanDate" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${reserve.cleanDate}" /></td>
			</tr>
			<tr>
				<td><spring:message code="reserve.reserveState" /></td>
				<td>${reserve.reserveState}</td>
			</tr>
			<tr>
				<td><spring:message code="reserve.cleanDone" /></td>
				<td>${reserve.cleanDone}</td>
			</tr>
			<tr>
				<td><spring:message code="reserve.request" /></td>
				<td>${reserve.reserveRequest}</td>
			</tr>
		</c:forEach>
	</table>
</form:form>
<div align="center">
	<button type="submit" id="btnFinish">
		<spring:message code="action.finish" />
	</button>
	<button type="submit" id="btnRestore">
		<spring:message code="action.restore" />
	</button>
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#reserve");
		 $("#btnFinish").on("click", function() {
	            var cleanDoneValue = "${reserve.cleanDone}"; // 현재의 cleanDone 값 가져오기

	            if (cleanDoneValue === 'N') { // 'N'인 경우
	                formObj.attr("action", "finishUpdate"); // form의 action을 finishUpdate로 변경
	            } else if (cleanDoneValue === 'Y') { // 'Y'인 경우
	                formObj.attr("action", "finishCancel"); // form의 action을 finishCancel로 변경
	            }
	            formObj.submit(); // submit 실행
	        });
		$("#btnRestore").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/admin/reserve/complete/list${pgrq2.toUriString()}";
		});
	});
</script>