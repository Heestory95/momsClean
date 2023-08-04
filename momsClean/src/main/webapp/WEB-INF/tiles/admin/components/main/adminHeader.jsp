<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style type="text/css">
.logout{
	font-family: "나눔바른고딕";
	width=150;
	height=35;
	padding: 3px 3px 3px 3px;
	border: 1px solid #000;
	color: inherit;
}
.mom {
	font-family: "나눔바른고딕";
	font-weight: 50px;
	font-size: 80px;
	color: #6AAAFF;
}
</style>
<div align="center" class="mom">
		<a href="/" style="color: inherit;">MOM'S CLEAN</a>
</div>

<div align="right">
<a href="/login" class="logout"><spring:message
		code="header.admin.logout"/></a>
</div>

