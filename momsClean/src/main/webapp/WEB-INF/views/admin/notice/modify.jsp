<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

	h2{
		font-size:30px;
		color:#6AAAFF;
		margin:0;
	}
	
	#modify{
		border-left:0px;
		border-right:0px;
		 border-collapse : collapse;
		 width:700px;

	}
	
	th,td{
	font-family:'Malgun Gothic';
	font-size:25px;
	height:100px;
	}
	
	.no,.title,.content{
	 border:none;
	 font-size:20px;
	
	}
	
	#no,#title,#content{
	background-color:#6AAAFF;
	color:white;
	text-align: center;
	}

	button{
	border-color:#6AAAFF;
	font-size:20px;
	background-color:white;
	}


</style>

<br><br><br><br>
<h2><spring:message code="notice.header.modify" /></h2>
<br><br><br><br><br>
<form:form modelAttribute="notice" action="modify">
	<form:hidden path="noticeNo" />
	
	<input type="hidden" name="page" value="${pgrq.page}"> 
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">

	<table border="1" id="modify">
		<tr>
			<td id="no"><spring:message code="notice.no" /></td>
			<td><form:input class="no" path="noticeNo" readonly="true"/></td>
		</tr>
		
		<tr>
			<td id="title"><spring:message code="notice.title" /></td>
			<td><form:input class="title" path="noticeTitle" /></td>
		</tr>
		<tr>
			<td id="content"><spring:message code="notice.content" /></td>
			<td><form:textarea class="content" path="noticeContent" /></td>
		</tr>
	</table>
</form:form>
<br><br>
<div>

		<button type="submit" id="btnEdit"><spring:message code="notice.edit" /></button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="submit" id="btnRemove"><spring:message code="notice.remove" /></button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" id="btnList"><spring:message code="notice.list" /></button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#notice");

		$("#btnEdit").on("click", function() {
			formObj.submit();
		});
		
		$("#btnRemove").on("click", function() {
			formObj.attr("action", "remove");
			formObj.submit();
		
		});

		$("#btnList").on("click", function() {
			self.location = "list";
		});

	});
</script>