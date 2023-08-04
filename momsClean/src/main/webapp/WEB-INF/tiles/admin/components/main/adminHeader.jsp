<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.logout{
	background: #d9d2e9ff;
		
}
	.mom {
	font-weight: 50px;
	font-size: 80px;
	color: #6AAAFF;
	
	}
</style>
</head>
<body>
	
</body>
</html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div align="center" class="mom">
<table>
	<tr>
		<!-- <td>MOM'S CLEAN</td> -->
		<a href="/" style="color: inherit;">MOM'S CLEAN</a>
	</tr>
</table>
</div>

<div align="right">
<table>
	<tr>
		<td width="150" height="35" align="center" class="logout"><a href="/login"><spring:message
		code="header.admin.logout"></spring:message></a></td>
	</tr>
</table>
</div>

