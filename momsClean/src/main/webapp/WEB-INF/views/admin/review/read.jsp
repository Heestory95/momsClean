<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<h2><spring:message code="notice.header.read" /></h2>

<form:form modelAttribute="review">
	
	<input type="hidden" name="page" value="${pgrq.page}"> 
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">	

	<table>
		<tr>
			<td><spring:message code="review.no" /></td>
			<td><form:input path="reviewNo" readonly="true" /></td>
			<td><font color="red"><form:errors path="reviewNo" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="review.grade" /></td>
			<td><form:input path="reviewGrade" readonly="true" /></td>
			<td><font color="red"><form:errors path="reviewGrade" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="review.content" /></td>
			<td><form:textarea path="reviewContent" readonly="true" /></td>
			<td><font color="red"><form:errors path="reviewContent" /></font></td>
		</tr>
	</table>

</form:form>

<div>
		<button type="submit" id="btnList"><spring:message code="review.list" /></button>
		<button type="submit" id="btnRemove"><spring:message code="review.remove" /></button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#review");

		console.log(formObj);

		$("#btnList").on("click", function() {
			self.location = "list";
		});
		
		$("#btnRemove").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		
		});

	});
</script>