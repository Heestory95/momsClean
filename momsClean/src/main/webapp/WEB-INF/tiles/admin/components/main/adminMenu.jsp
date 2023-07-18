<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div align="center">
	<table>
		<tr>
			<td width="80"><a href="/"><spring:message code="header.home.admin" /></a></td>

			<!-- 인증된 사용자인 경우 true -->
			<sec:authorize access="isAuthenticated()">
				<!-- 관리자 권한을 가진 사용자인 경우 true -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<!-- 상품관리를 메뉴에 추가한다. -->
					<td width="120"><a href="/admin/item/list"><spring:message code="menu.item.admin" /></a></td>
					<!-- 상품정보 파일 업로드 페이지 수정을 메뉴에 추가한다. -->
					<td width="200"><a href="/admin/upload/fileUpload"><spring:message code="menu.description.admin" /></a></td>
					<!-- 회원 관리를 메뉴에 추가한다. -->
					<td width="160">
						<li><a href="#"><spring:message code="menu.user.admin" /></a>
							<ul>
								<li><a href="/admin/user/list"><spring:message code="menu.userList.admin"></spring:message></a></li>
								<li><a href="/"><spring:message code="menu.withDrawList.admin"></spring:message></a></li>
							</ul>
						</li>
					</td>
					<!-- 예약정보 관리를 메뉴에 추가한다. -->
					<td>
						<li><a href="#"><spring:message code="menu.reserve.admin" /></a>
							<ul>
								<li><a href="/"><spring:message code="menu.approval.admin"></spring:message></a></li>
								<li><a href="/"><spring:message code="menu.reserveComplete.admin"></spring:message></a></li>
								<li><a href="/"><spring:message code="menu.reserveCancel.admin"></spring:message></a></li>
							</ul>
						</li>
					</td>
					<!-- 게시판 관리 메뉴에 추가한다. -->
					<td>
						<li><a href="#"><spring:message code="menu.board.admin" /></a>
							<ul>
								<li><a href="/admin/notice/list"><spring:message code="menu.notice.admin"></spring:message></a></li>
								<li><a href="/admin/reference/list"><spring:message code="menu.reference.admin"></spring:message></a></li>
								<li><a href="/admin/review/list"><spring:message code="menu.review.admin"></spring:message></a></li>
							</ul>  
						</li>
					</td>
				</sec:authorize>
			</sec:authorize>
		</tr>
	</table>
</div>
<hr>
