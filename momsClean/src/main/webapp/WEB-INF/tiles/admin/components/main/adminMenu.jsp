<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- <link rel="stylesheet" type="text/css" href="adminMenu.css"> -->

<style>
a {
	text-decoration: none;
}

#container {
	margin: 0 auto;
	width: 100%;
}

#logo {
	float: left;
	width: 300px;
	height: 170px;
	line-height: 100px;
	padding-top: 20px;
	padding-left: 80px;
}

#topMenu {
	height: 60px;
}

#topMenu>li {
	float: left;
	position: relative;
}

#topMenu>li>a {
	display: block;
	color: #fff;
	padding: 20px 60px;
}

#topMenu > li > ul {
	display: none;
	position: absolute;
	width: 180px;
	background: rgba(255, 255, 255, 0.6);
	left: 20px;
	margin: 0;
}

.Menu {
	width: 300px;
}

td {
	padding:0px;
}
</style>
<div align="center" id="container">
	<table>
		<tr>
			<div id="logo">
				<a href="/"><spring:message code="header.admin.home" /></a>
				</td>
			</div>
			<nav>
				<ul id="topMenu">
					<!-- 상품관리를 메뉴에 추가한다. -->
					<td ><li class="Menu"><a
							href="/admin/item/list"><spring:message
									code="menu.item.admin" /></a></li></td>

					<!-- 회원 관리를 메뉴에 추가한다. -->
					<td width="160">

						<li class="Menu"><a href="#"><spring:message code="menu.user.admin" /><span>▼</span></a>
							<ul>
								<li><a href="/admin/user/list"><spring:message
											code="menu.userList.admin" /></a></li>
								<li><a href="/admin/user/withdraw/list"><spring:message
											code="menu.withdrawList.admin" /></a></li>
							</ul></li>
					</td>
					<!-- 예약정보 관리를 메뉴에 추가한다. -->
					<td>

						<li class="Menu"><a href="#"><spring:message code="menu.reserve.admin" /><span>▼</span></a>
							<ul>
								<li><a href="/admin/reserve/request/list"><spring:message
											code="menu.approval.admin" /></a></li>
								<li><a href="/admin/reserve/complete/list"><spring:message
											code="menu.reserveComplete.admin" /></a></li>
								<li><a href="/admin/reserve/cancel/list"><spring:message
											code="menu.reserveCancel.admin" /></a></li>
							</ul></li>
					</td>
					<!-- 게시판 관리 메뉴에 추가한다. -->
					<td>
						<li class="Menu"><a href="#"><spring:message code="menu.board.admin" /><span>▼</span></a>
							<ul>
								<li><a href="/admin/notice/list"><spring:message
											code="menu.admin.notice" /></a></li>
								<li><a href="/admin/reference/list"><spring:message
											code="menu.reference.admin" /></a></li>
								<li><a href="/admin/review/list"><spring:message
											code="menu.review.admin" /></a></li>
							</ul></li>
					</td>
				</ul>
			</nav>
		</tr>
	</table>
</div>
<hr>
