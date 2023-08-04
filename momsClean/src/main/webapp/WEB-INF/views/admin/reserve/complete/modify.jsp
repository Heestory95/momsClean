<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
h2 {
	font-family: "나눔바른고딕";
}

#reserveInfo {
	font-family: "나눔바른고딕";
	width: 300px;
	border-collapse: collapse;
	font-size: 16px;
	letter-spacing: -0.3px;
	margin-bottom: 10px;
}

td {
	border-top: 1px solid #cfcbbb;
	border-bottom: 1px solid #cfcbbb;
	padding-left: 10px;
	padding-top: 8px;
	padding-bottom: 8px;
	font-size: 16px;
}

.first-td {
	border-right: 1px solid #cfcbbb;
	background-color: #eeebda;
	width: 80px;
}

#btnFinish, #btnRestore, #btnList {
	position: relative;
	margin: 0 auto;
	cursor: pointer;
	margin-bottom: 6px;
	padding: 3px 9px 5px 9px;
	border: 1px solid #e4e0cd;
	background-color: #36343f;
	color: white;
}

</style>
<h2 align="center">
	<spring:message code="reserve.admin.header.info" />
</h2>
<form:form modelAttribute="reserve" action="modify">
	<form:hidden path="reserveNo" />
	
	<table id="reserveInfo">
		<c:forEach var="reserve" items="${completeModifyForm}">
			<tr>
				<td class="first-td"><b><spring:message code="reserve.reserveNo" /></b></td>
				<td>${reserve.reserveNo}</td>
			</tr>
			<tr>
				<td class="first-td"><b><spring:message code="reserve.reserveUserName" /></b></td>
				<td>${reserve.userName}(${reserve.userId})</td>
			</tr>
			<tr>
				<td class="first-td"><b><spring:message code="reserve.reserveAddr" /></b></td>
				<td>${reserve.reserveAddr}</td>
			</tr>
			<tr>
				<td rowspan="2" class="first-td"><b><spring:message code="reserve.itemInfo" /></b></td>
				<td>상품 : ${reserve.reserveItemName}</td>
			</tr>
			<tr>
				<td>가격 : ${reserve.reserveItemPrice}원</td>
			</tr>
			<tr>
				<td rowspan="2" class="first-td"><b><spring:message code="reserve.optionInfo" /></b></td>
				<td>옵션 : ${reserve.reserveOptionName}</td>
			</tr>
			<tr>
				<td>가격 : ${reserve.reserveOptionPrice}원</td>
			</tr>
			<tr>
				<td class="first-td"><b><spring:message code="reserve.reserveDate" /></b></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${reserve.reserveDate}" /></td>
			</tr>
			<tr>
				<td class="first-td"><b><spring:message code="reserve.cleanDate" /></b></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${reserve.cleanDate}" /></td>
			</tr>
			<tr>
				<td class="first-td"><b><spring:message code="reserve.reserveState" /></b></td>
				<td>${reserve.reserveState}</td>
			</tr>
			<tr>
				<td class="first-td"><b><spring:message code="reserve.cleanDone" /></b></td>
				<td>${reserve.cleanDone}</td>
			</tr>
			<tr>
				<td class="first-td"><b><spring:message code="reserve.request" /></b></td>
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