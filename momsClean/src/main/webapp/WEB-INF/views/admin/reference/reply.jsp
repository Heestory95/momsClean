<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2>
	<spring:message code="reference.reply" />
</h2>
<form:form modelAttribute="reference" action="reply"
	enctype="multipart/form-data">
	<form:hidden path="root" value="${referenceNo}"/>
	<form:hidden path="step"/>
	<form:hidden path="indent"/>

	<table border="1"> 
		<tr>
			<td><spring:message code="reference.title" /></td>
			<td><form:input path="referenceTitle" value="RE:${reference.referenceTitle}" /></td>
		</tr>
		<tr>
			<td><spring:message code="reference.name" /></td>
			<td>관리자</td>
		</tr>
		<tr>
			<td><spring:message code="reference.conten" /></td>
			<td><form:input path="referenceContent" /></td>
		</tr>
		<tr>
			<td><spring:message code="reference.referenceDate" /></td>
			<td><fmt:formatDate value="${reference.referenceDate}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
    <td><spring:message code="reference.root" /></td>
    <td><c:out value="${reference.root}" /></td>
</tr>
	</table>

</form:form>

<div>
	<button type="submit" id="btnRegister">
		<spring:message code="item.regist" />
	</button>
	<button type="submit" id="btnCancel">
		<spring:message code="item.cancel" />
	</button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#reference");

		$("#btnRegister").on("click", function() {
			
			formObj.submit();
		});

		$("#btnCancel").on("click", function() {
			self.location = "list";
		});
	});
</script>