<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2>
	<spring:message code="item.header.change" />
</h2>
<form:form modelAttribute="item">
	
	<table>
		<tr>
			<td><spring:message code="item.itemName" /></td>
			<td><form:input path="itemName" readonly="true" /></td>
			<td><font color="red"><form:errors path="itemName" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="item.itemPrice" /></td>
			<td><form:input path="itemPrice" readonly="true" /></td>
			<td><font color="red"><form:errors path="itemPrice" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<button type="submit" id="btnEdit">
		<spring:message code="item.edit" />
	</button>
	<button type="submit" id="btnRemove">
		<spring:message code="item.remove" />
	</button>
	<button type="submit" id="btnCancel">
		<spring:message code="item.cancel" />
	</button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#item");

		$("#btnEdit").on("click", function() {
			var itemName = $("#itemName");
			var itemNameVal = itemName.val();

			self.location = "/admin/item/optionModify?itemName="+itemNameVal;
		});

		$("#btnRemove").on("click", function() {
			// confirm 함수로 확인 메시지를 띄웁니다.
			if (confirm("정말로 옵션 상품을 삭제하시겠습니까?")) {
				formObj.attr("action", "/admin/item/remove");
				formObj.submit();
			}
		});

		$("#btnCancel").on("click", function() {
			self.location = "/admin/item/list";
		});
	});
</script>