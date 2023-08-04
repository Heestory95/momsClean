<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
h2 {
	font-family: "나눔바른고딕";
}

#userInfo {
	font-family: "나눔바른고딕";
	width: 300px;
	border-collapse: collapse;
	font-size: 14px;
	letter-spacing: -0.3px;
	margin-bottom: 10px;
}

td {
	border-top: 1px solid #cfcbbb;
	border-bottom: 1px solid #cfcbbb;
	padding-left: 8px;
	padding-top: 8px;
	padding-bottom: 8px;
	font-size: 14px;
}

.first-td {
	border-right: 1px solid #cfcbbb;
	background-color: #eeebda;
	width: 80px;
}

#btnWithdraw, #btnList {
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
	<spring:message code="user.admin.header.modify" />
</h2>
<form:form modelAttribute="user" action="modify">
	<form:hidden path="userNo" />

	<table id="userInfo">
		<tr>
			<td class="first-td"><b><spring:message code="user.userNo" /></b></td>
			<td>${user.userNo}</td>
		</tr>
		<tr>
			<td class="first-td"><b><spring:message code="user.userId" /></b></td>
			<td>${user.userId}</td>
		</tr>
		<tr>
			<td class="first-td"><b><spring:message code="user.userName" /></b></td>
			<td>${user.userName}</td>
		</tr>
		<tr>
			<td class="first-td"><b><spring:message code="user.userPhone" /></b></td>
			<td>${user.userPhone}</td>
		</tr>
		<tr>
			<td class="first-td"><b><spring:message code="user.userEmail" /></b></td>
			<td>${user.userEmail}</td>
		</tr>
		<tr>
			<td class="first-td"><b><spring:message code="user.regDate" /></b></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.regDate}" /></td>
		</tr>
		<tr>
			<td class="first-td"><b><spring:message code="user.userDivision" /></b></td>
			<td>${user.userDivision}</td>
		</tr>
	</table>
</form:form>
<div align="center">
	<button type="submit" id="btnWithdraw">
		<spring:message code="action.withdraw" /></button>
	<button type="submit" id="btnList">
		<spring:message code="action.list" /></button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#user");
		$("#btnWithdraw").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "list${pgrq.toUriString()}";
		});
	});
</script>