<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
  $(document).ready(function() {
    // 모든 게시글 내용의 길이를 체크하고 15자를 넘어가면 자르고 "..."을 붙입니다.
    $(".word-limit").each(function() {
      var content = $(this).text();
      var maxLength = 15;
      if (content.length > maxLength) {
        content = content.substring(0, maxLength) + "...";
      }
      $(this).text(content);
    });
  });
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <style>
.mainRef {
	float: left;
}
.mainReview {
	float: right;
}
</style> -->


<!-- 신규 예약 -->
<div class="mainReserve">
<h2 align="center">
	<spring:message code="home.admin.reserve" />
</h2>

<form:form modelAttribute="request">
	<table border="1" align="center">
		<tr>
			<th align="center" width="180"><spring:message
					code="reserve.reserveNo" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.userNo" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.userId" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.userName" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.itemNo" /></th>
			<th align="center" width="400"><spring:message
					code="reserve.reserveAddr" /></th>
			<th align="center" width="80"><spring:message
					code="reserve.totalPrice" /></th>
			<th align="center" width="90"><spring:message
					code="reserve.reserveDate" /></th>
			<th align="center" width="90"><spring:message
					code="reserve.cleanDate" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.reserveState" /></th>
			<th align="center" width="70"><spring:message
					code="reserve.request" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty request}">
				<tr>
					<td colspan="12" align="center"><spring:message
							code="common.listEmpty"></spring:message></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${request}" var="home">
					<tr>
						<td align="center">${home.reserveNo}</td>
						<td align="center">${home.userNo}</td>
						<td align="center">${home.userId}</td>
						<td align="center">${home.userName}</td>
						<td align="center">${home.itemNo}</td>
						<td align="center">${home.reserveAddr}</td>
						<td align="center">${home.reserveItemPrice + home.reserveOptionPrice}원</td>
						<td align="center"><fmt:formatDate
								value="${home.reserveDate}" pattern="yyyy-MM-dd" /></td>
						<td align="center"><fmt:formatDate
								value="${home.cleanDate}" pattern="yyyy-MM-dd" /></td>
						<td align="center">${home.reserveState}</td>
						<td align="center">${home.reserveRequest}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</form:form>
</div>

<!-- 신규 문의 -->
<div class="mainRef">
<h3>
	<spring:message code="home.admin.reference" />
</h3>

<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="reference.no" /></th>
		<th align="center" width="80"><spring:message code="user.no" /></th>
		<th align="center" width="320"><spring:message
				code="reference.title" /></th>
		<th align="center" width="100"><spring:message
				code="reference.name" /></th>
		<th align="center" width="100"><spring:message
				code="reference.referenceDate" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="5"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="home">
				<tr>
					<td align="center">${home.referenceNo}</td>
					<td align="center">${home.userNo}</td>
					<td align="left"><span class="word-limit">${home.referenceTitle}</span></td>
					<td align="center">${home.userName}</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
							value="${home.referenceDate}" /></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>

<!-- 신규 리뷰 -->
<div class="mainReview">

<h2><spring:message code="home.admin.review" /></h2>

<table border="1">
  <tr>
    <th align="center" width="80"><spring:message code="review.no" /></th>
    <th align="center" width="80"><spring:message code="review.grade" /></th>
    <th align="center" width="420"><spring:message code="review.content" /></th>
    <th align="center" width="180"><spring:message code="review.date" /></th>
  </tr>
  <c:choose>
   	<c:when test="${empty list}">
  		<tr>
    		<td colspan="4"><spring:message code="common.listEmpty" /></td>
  		</tr>
  	</c:when>
  	<c:otherwise>
  		<c:forEach items="${review}" var="home">
  			<tr>
  				<td align="center">${home.reviewNo}</td>
  				<!-- 평점을 숫자에서 별점으로 바꾸는 명령어 -->
  				<td align="center"><c:choose>
                     <c:when test="${home.reviewGrade == 1}">★</c:when>
                     <c:when test="${home.reviewGrade == 2}">★★</c:when>
                     <c:when test="${home.reviewGrade == 3}">★★★</c:when>
                     <c:when test="${home.reviewGrade == 4}">★★★★</c:when>
                     <c:when test="${home.reviewGrade == 5}">★★★★★</c:when>
                     <c:otherwise>Unknown</c:otherwise>
                  </c:choose></td>
  				<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다 -->
  				<td align="left"><span class="word-limit">${home.reviewContent}</span></td>
  				<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${home.reviewDate}" /></td>
  			</tr>
  		</c:forEach>
  	</c:otherwise>
  </c:choose>
</table>
</div>

<!-- 통계 차트 -->

<div class="wrapper">
	<h3>
		<spring:message code="home.admin.chart" />
	</h3>
	<div class="cancelChart">
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	      google.charts.load("current", {packages:["corechart"]});
	      google.charts.setOnLoadCallback(drawChart);
	      function drawChart() {
	    	var reserveCompleted = ${reserveCount};
	    	var reserveCancelled = ${cancelCount};
	    	  
	        var data = google.visualization.arrayToDataTable([
	          ['예약취소율', 'Cancel Chart'],
	          ['예약완료',     reserveCompleted],
	          ['예약취소',     reserveCancelled]
	        ]);
	
	        var options = {
	          title: '예약취소율',
	          pieHole: 0.35,
	          slices: {
	              // 예약취소 부분 강조를 위해 설정 (0번부터 시작)
	              1: {offset: 0.1}
	          }
	        };
	
	        var chart = new google.visualization.PieChart(document.getElementById('cancelChart'));
	        chart.draw(data, options);
	      }
	    </script>
	    <div id="cancelChart" style="width: 400px; height: 300px;"></div>
	</div>
	<div>
		<div class="itemChart">
			<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		    <script type="text/javascript">
		      google.charts.load("current", {packages:["corechart"]});
		      google.charts.setOnLoadCallback(drawChart);
		      function drawChart() {
		    	var itemCount1 = ${itemCount1};
		    	var itemCount2 = ${itemCount2};
		    	var itemCount3 = ${itemCount3};
		    	var itemCount4 = ${itemCount4};
		    	var itemCount5 = ${itemCount5};
		    	var itemCount6 = ${itemCount6};
		    	  
		        var data = google.visualization.arrayToDataTable([
		          ['상품판매율', 'Item Chart'],
		          ['A세트',     itemCount1],
		          ['B세트',     itemCount2],
		          ['C세트',     itemCount3],
		          ['D세트',     itemCount4],
		          ['E세트',     itemCount5],
		          ['F세트',     itemCount6]
		        ]);
		
		        var options = {
		          title: '상품판매율',
		          pieHole: 0.35,
		        };
		
		        var chart = new google.visualization.PieChart(document.getElementById('itemChart'));
		        chart.draw(data, options);
		      }
		    </script>
		    <div id="itemChart" style="width: 400px; height: 300px;"></div>
		</div>
	</div>
</div>


