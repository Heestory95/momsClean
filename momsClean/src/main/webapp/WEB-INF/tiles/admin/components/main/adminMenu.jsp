<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div align="center">
	<table>
		<tr>
			<td width="80"><a href="/"><spring:message code="header.admin.home" /></a></td>

					<!-- 상품관리를 메뉴에 추가한다. -->
					<td width="120"><a href="/admin/item/list"><spring:message code="menu.item.admin" /></a></td>
					
					<!-- 회원 관리를 메뉴에 추가한다. -->
					<td width="160">
							<ul>
								<a href="/admin/user/list"><spring:message code="menu.user.admin" /></a>
								<li><a href="/admin/user/list"><spring:message code="menu.userList.admin"/></a></li>
								<li><a href="/admin/user/withdraw/list"><spring:message code="menu.withdrawList.admin"/></a></li>
							</ul>
					</td>
					<!-- 예약정보 관리를 메뉴에 추가한다. -->
					<td>
							<ul>
								<a href="/admin/reserve/request/list"><spring:message code="menu.reserve.admin" /></a>
								<li><a href="/admin/reserve/request/list"><spring:message code="menu.approval.admin"/></a></li>
								<li><a href="/admin/reserve/complete/list"><spring:message code="menu.reserveComplete.admin"/></a></li>
								<li><a href="/admin/reserve/cancel/list"><spring:message code="menu.reserveCancel.admin"/></a></li>
							</ul>
					</td>
					<!-- 게시판 관리 메뉴에 추가한다. -->
					<td>
						<ul>
							<a href="/admin/notice/list"><spring:message code="menu.board.admin"/></a>
							<li><a href="/admin/notice/list"><spring:message code="menu.admin.notice"/></a></li>	
							<li><a href="/admin/reference/list"><spring:message code="menu.reference.admin"/></a></li>
							<li><a href="/admin/review/list"><spring:message code="menu.review.admin"/></a></li>
						</ul>
					</td>
		</tr>
	</table>
</div>
<hr>
