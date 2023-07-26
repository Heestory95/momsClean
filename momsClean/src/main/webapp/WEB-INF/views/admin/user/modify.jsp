<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2 align="center">
	<spring:message code="user.admin.header.modify" />
</h2>
<form:form modelAttribute="user" action="modify">
	<form:hidden path="userNo" />

	<table border="1" align="center">
		<tr>
			<td><spring:message code="user.userNo" /></td>
			<td>${user.userNo}</td>
		</tr>
		<tr>
			<td><spring:message code="user.userId" /></td>
			<td>${user.userId}</td>
		</tr>
		<tr>
			<td><spring:message code="user.userName" /></td>
			<td>${user.userName}</td>
		</tr>
		<tr>
			<td><spring:message code="user.userPhone" /></td>
			<td>${user.userPhone}</td>
		</tr>
		<tr>
			<td><spring:message code="user.userEmail" /></td>
			<td>${user.userEmail}</td>
		</tr>
		<tr>
			<td><spring:message code="user.regDate" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.regDate}" /></td>
		</tr>
		<tr>
			<td><spring:message code="user.userDivision" /></td>
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