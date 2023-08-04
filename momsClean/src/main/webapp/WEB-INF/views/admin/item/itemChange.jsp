<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

	h2{
		font-size:30px;
		color:#6AAAFF;
		margin:0;
	}
	
	#change{
		border-left:0px;
		border-right:0px;
		border-collapse : collapse;
	}

	td{
	background-color:#FAFFFF;
	font-size:20px;
	font-family:'Malgun Gothic';
	}

	button{
	width:100px;
	font-size:18px;
	border-color:#6AAAFF;
	box-shadow: none;
	background-color:white;
	}
	
	.no,.name,.price,.img,.thumb{
	 border:none;
	 font-size:20px;
	
	}
	
	#no,#name,#price,#img,#thumb{
	background-color:#6AAAFF;
	color:white;
	text-align: center;
	}

	

</style>
<br><br><br><br>
<h2>
	<spring:message code="item.header.change" />
</h2>
<br><br><br><br><br>
<form:form modelAttribute="item">

	<table border="1" id="change">
		<tr>
			<td id="no"><spring:message code="item.itemNo" /></td>
			<td><form:input class="no" path="itemNo" readonly="true" /></td>
		</tr>
		<tr>
			<td id="name"><spring:message code="item.itemName" /></td>
			<td><form:input class="name" path="itemName" readonly="true" /></td>
		</tr>
		<tr>
			<td id="price"><spring:message code="item.itemPrice" /></td>
			<td><form:input class="price" path="itemPrice" readonly="true" /></td>
		</tr>
		<tr>
			<td id="img"><spring:message code="item.img" /></td>
			<td><img class="img" src="picture?itemNo=${item.itemNo}" width="210"></td>
		</tr>
		<tr>
			<td id="thumb"><spring:message code="item.img.thumb" /></td>
			<td><img class="thumb" src="thumb?itemNo=${item.itemNo}" width="210"></td>
		</tr>
	</table>
</form:form>
<br><br>
<div>
	<button type="submit" id="btnEdit">
		<spring:message code="item.edit" />
	</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" id="btnRemove">
		<spring:message code="item.remove" />
	</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" id="btnCancel">
		<spring:message code="item.cancel" />
	</button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#item");

		$("#btnEdit").on("click", function() {
			var itemNo = $("#itemNo");
			var itemNoVal = itemNo.val();

			self.location = "/admin/item/itemModify?itemNo=" + itemNoVal;
		});

		$("#btnRemove").on("click", function() {
			// confirm 함수로 확인 메시지를 띄웁니다.
			if (confirm("정말로 상품을 삭제하시겠습니까?")) {
				formObj.attr("action", "/admin/item/remove");
				formObj.submit();
			}
		});

		$("#btnCancel").on("click", function() {
			self.location = "/admin/item/list";
		});
	});
</script>