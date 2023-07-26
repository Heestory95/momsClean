<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2><spring:message code="notice.header.register" /></h2>

<form:form modelAttribute="notice" action="register">
	<table>
		<tr>
			<td><spring:message code="notice.title" /></td>
			<td><form:input path="noticeTitle" /></td>
			<td><font color="red"><form:errors path="noticeTitle" /></font></td>
		</tr>
		
		<tr>
			<td><spring:message code="notice.content" /></td>
			<td><form:textarea path="noticeContent" /></td>
			<td><font color="red"><form:errors path="noticeContent" /></font></td>
		</tr>
	
	</table>
</form:form>

<div>

		<button type="submit" id="btnRegister"><spring:message code="notice.new" /></button>

	
	<button type="submit" id="btnList"><spring:message code="notice.list" /></button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#notice");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "/admin/notice/list";
		});

	});
</script>
