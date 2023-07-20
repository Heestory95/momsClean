<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2>
	<spring:message code="item.header.itemList" />
</h2>


<table>
	<tr>
		<th width="320"></th>
		<th width="100"></th>
		<th width="80"></th>
		<th colspan="5" align="right" width="80"><a href="itemRegister"><spring:message
					code="item.regist" /></a></th>
	</tr>
</table>

<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="item.itemNo" /></th>
		<th align="center" width="320"><spring:message
				code="item.itemName" /></th>
		<th align="center" width="100"><spring:message
				code="item.itemPrice" /></th>

		<th align="center" width="80"><spring:message code="item.edit" /></th>

		<c:choose>
			<c:when test="${empty itemList}">
				<tr>
					<!--  <td colspan="3"><spring:message code="common.listEmpty" /></td>-->
					<td colspan="4"><spring:message code="common.listEmpty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${itemList}" var="item">

					<tr>
						<td align="center">${item.itemNo}</td>
						<td align="left">${item.itemName}</td>
						<td align="right">${item.itemPrice}원</td>


						<td align="center"><a href="itemChange?itemNo=${item.itemNo}"><spring:message
									code="item.change" /></a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tr>
</table>

<br><br><br>

<h2>
	<spring:message code="item.header.optionList" />
</h2>


<table>
	<tr>
		<th width="270"></th>
		<th width="230"></th>
		<th colspan="3" align="right" width="80"><a href="optionRegister"><spring:message
					code="item.regist" /></a></th>
	</tr>
</table>

<table border="1">
	<tr>
		<th align="center" width="270"><spring:message
				code="item.itemName" /></th>
		<th align="center" width="230"><spring:message
				code="item.itemPrice" /></th>

		<th align="center" width="80"><spring:message code="item.edit" /></th>

		<c:choose>
			<c:when test="${empty itemList2}">
				<tr>
					<!--  <td colspan="3"><spring:message code="common.listEmpty" /></td>-->
					<td colspan="4"><spring:message code="common.listEmpty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${itemList2}" var="item">

					<tr>
						<td align="left">${item.itemName}</td>
						<td align="right">${item.itemPrice}원</td>


						<td align="center"><a href="optionChange?itemName=${item.itemName}"><spring:message
									code="item.change" /></a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tr>
</table>

<script>
	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess'/>");
	}
</script>

