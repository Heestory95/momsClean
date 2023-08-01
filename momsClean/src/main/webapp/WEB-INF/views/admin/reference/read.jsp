<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<h2>
	<spring:message code="reference.read" />
</h2>
<form:form modelAttribute="reference">

	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
	<table border="">
		<tr>
			<td><spring:message code="reference.no" /></td>
			<td>${reference.referenceNo}</td>
		</tr> 
		<tr>
			<td><spring:message code="reference.name" /></td>
			<td>${reference.userName}</td>
			
		</tr>
		<tr>
			<td><spring:message code="reference.phone" /></td>
			<td>${reference.userPhone}</td>
			
		</tr>
		<tr>
			<td><spring:message code="reference.title" /></td>
			<td>${reference.referenceTitle}</td>
			
		</tr>
		<tr>
			<td><spring:message code="reference.conten" /></td>
			<td>${reference.referenceContent}</td>
			
		</tr>
		<tr>
			<td><spring:message code="reference.referenceDate" /></td>
			<td><fmt:formatDate value="${reference.referenceDate}"
					pattern="yyyy-MM-dd" /></td>
			
		</tr>
	</table>
</form:form>
<div>
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#reference");

		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();

		$("#btnList").on("click", function() {
			self.location = "/admin/reference/list";
		});
	});
</script>