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
<!-- 신규 문의 -->
<div>
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
					<td align="left">${home.referenceTitle}</td>
					<td align="center">${home.userName}</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
							value="${home.referenceDate}" /></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>
<!-- 신규 예약 -->
<div></div>
<!-- 신규 리뷰 -->
<div></div>
<!-- 통계 차트 -->

<style type="text/css">
	.wrapper {
		width : 100%;
	}

	.cancelChart {
		float : left;
	}

	

</style>
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
