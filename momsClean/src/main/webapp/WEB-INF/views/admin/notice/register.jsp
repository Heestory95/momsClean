<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

	h2{
		font-size:30px;
		color:#6AAAFF;
		margin:0;
	}
	
	#register{
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
<h2><spring:message code="notice.header.register" /></h2>
<br><br><br><br><br>

<form:form modelAttribute="notice" action="register">
	<table border="1" id="register">
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

		<button type="submit" id="btnRegister"><spring:message code="notice.new" /></button>

	&nbsp;&nbsp;&nbsp;&nbsp;
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
