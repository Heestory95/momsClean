<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2>
	<spring:message code="item.itemRegist" />
</h2>
<form:form modelAttribute="item" action="itemRegister"
	enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td><spring:message code="item.itemNo" /></td>
			<td><form:input path="itemNo" /></td>
			<td><font color="red"><form:errors path="itemNo" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="item.itemName" /></td>
			<td><form:input path="itemName" /></td>
			<td><font color="red"><form:errors path="itemName" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="item.itemPrice" /></td>
			<td><form:input path="itemPrice" /></td>
			<td><font color="red"><form:errors path="itemPrice" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="item.img"/></td>
			<td><input type="file" name="picture"/></td>
		</tr>
		<tr>
			<td><spring:message code="item.img.thumb"/></td>
			<td><input type="file" name="thumb"/></td>
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
		var formObj = $("#item");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

		$("#btnCancel").on("click", function() {
			self.location = "list";
		});
	});
</script>