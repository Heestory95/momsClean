<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2>
	<spring:message code="item.itemRegist" />
</h2>
<form:form modelAttribute="item" action="itemRegister"
	enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td><spring:message code="item.itemNo" /></td>
			<td><form:input maxlength="2" path="itemNo" /></td>
			<td><font color="red"><form:errors path="itemNo" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="item.itemName" /></td>
			<td><form:input maxlength="30" path="itemName" /></td>
			<td><font color="red"><form:errors path="itemName" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="item.itemPrice" /></td>
			<td><form:input maxlength="30" path="itemPrice" /></td>
			<td><font color="red"><form:errors path="itemPrice" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="item.img" /></td>
			<td><input type="file" name="picture" /></td>
		</tr>
		<tr>
			<td><spring:message code="item.img.thumb" /></td>
			<td><input type="file" name="thumb" /></td>
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
			// 폼 전송 전에 숫자 입력 여부와 빈 칸 여부를 확인합니다.
			if (!validateInput()) {
				return false; // 제출 취소
			}

			formObj.submit();
		});

		$("#btnCancel").on("click", function() {
			self.location = "list";
		});
	});

	function validateInput() {
		var itemNoInput = $("input[name='itemNo']");
		var inputValue = itemNoInput.val();

		var itemNameInput = $("input[name='itemName']");
		var inputValue2 = itemNameInput.val();

		var itemPriceInput = $("input[name='itemPrice']");
		var inputValue3 = itemPriceInput.val();

		// 빈 칸인지 확인합니다.
		if (!inputValue.trim()) {
			alert("상품번호를 입력하지 않았습니다.");
			return false;
		}
		if (!/^\d*$/.test(inputValue)) {
			alert("상품번호는 숫자만 입력 가능합니다.");
			return false;
		}

		if (!inputValue2.trim()) {
			alert("상품명을 입력하지 않았습니다.");
			return false;
		}
		if (!inputValue3.trim()) {
			alert("가격을 입력하지 않았습니다.");
			return false;
		}
		if (!/^\d*$/.test(inputValue3)) {
			alert("가격은 숫자만 입력 가능합니다.");
			return false;
		}

		return true;
	}
</script>