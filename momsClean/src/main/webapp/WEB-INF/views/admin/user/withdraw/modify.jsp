<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2>
	<spring:message code="user.admin.header.withdraw.modify" />
</h2>
<form:form modelAttribute="user" action="modify">
	<table>
		<tr>
			<td><spring:message code="user.userNo" /></td>
			<td><form:input path="userNo" readonly="true" /></td>
			<td><font color="red"><form:errors path="userNo" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="user.userId" /></td>
			<td><form:input path="userId" readonly="true" /></td>
			<td><font color="red"><form:errors path="userId" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="user.userName" /></td>
			<td><form:input path="userName" readonly="true" /></td>
			<td><font color="red"><form:errors path="userName" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="user.userPhone" /></td>
			<td><form:input path="userPhone" readonly="true" /></td>
			<td><font color="red"><form:errors path="userPhone" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="user.userEmail" /></td>
			<td><form:input path="userEmail" readonly="true" /></td>
			<td><font color="red"><form:errors path="userEmail" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="user.regDate" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.regDate}" /></td>
			<td><font color="red"><form:errors path="regDate" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="user.userDivision" /></td>
			<td><form:input path="userDivision" readonly="true" /></td>
			<td><font color="red"><form:errors path="userDivision" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<button type="submit" id="btnRestore">
		<spring:message code="action.restore" /></button>
	<button type="submit" id="btnList">
		<spring:message code="action.list" /></button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#user");
		$("#btnRestore").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/admin/user/withdraw/list${pgrq.toUriString()}";
		});
	});
</script>