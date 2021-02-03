<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Directory HTML-5 Template</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<jsp:include page="/WEB-INF/views/include/css.jsp" />
<link rel="stylesheet" href="/carrotmap/assets/css/map.css" />
<link rel="stylesheet" href="/carrotmap/assets/css/mypage.css" />
<link rel="stylesheet" href="/carrotmap/assets/css/filter.css" />
<style>
	div::-webkit-scrollbar { 
	    display: none !important; 
	}
</style>
</head>

<body>
	<!-- modal start -->
	<div class="modal" id="mymodal"></div>
	<!-- modal end -->
	
	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="assets/img/logo/loder.jpg" alt="" />
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->
	<header>
		<!-- Header Start -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<!-- Header End -->
	</header>
	<main>
			
		<!-- Hero Start-->
		<div
			class="hero-area1 slider-height2 hero-overly2 d-flex align-items-center"></div>
		<!--Hero End -->
		<!-- ================ contact section start ================= -->
		<section class="contact-section" id="content">
			<div class="container-fluid" id="content-container">
				<div class="row" id="content-container-filter">
					<div class="row col-2">
						<input class="col-8" id="dong-filter-input" type="text" placeholder="지역 써">
						<button class="col-4" id="dong-filter-inputBtn"><i class="fas fa-search" style='color:#ff3d1c'></i></button>
					</div>
					<div class="col-1" id="priceFilterBtn">
						<i class="fas fa-won-sign" style="color:white"></i><b style="color:white" id="asdf"> 가격대</b>
					</div>
					<div class="col-1" id="areaFilterBtn">
						<i class="fas fa-won-sign" style="color:white"></i><b style="color:white"> 방크기</b>
					</div>
					<div class="col-1" id="buildYearFilterBtn">
						<i class="fas fa-won-sign" style="color:white"></i><b style="color:white"> 준공년차</b>
					</div>
					<div class="col-1" id="floorFilterBtn">
						<i class="fas fa-won-sign" style="color:white"></i><b style="color:white"> 층수</b>
					</div>
				</div>
				<div class="row" id="content-container-row">
					<div class="col-md-2" id="housediv" style="overflow:scroll;height:100%;padding-left: 0px;padding-right: 0px;width: 100%;">
					</div>
					<div class="col-md-10" style="padding-left: 0px;">
						<div class="map_wrap"  style="height:750px">
					    <div id="mapdiv" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					    <ul id="category">
					        <li id="BK9" data-order="0"> 
					            <span class="category_bg bank"></span>
					            은행
					        </li>       
					        <li id="MT1" data-order="1"> 
					            <span class="category_bg mart"></span>
					            마트
					        </li>  
					        <li id="PM9" data-order="2"> 
					            <span class="category_bg pharmacy"></span>
					            약국
					        </li>  
					        <li id="OL7" data-order="3"> 
					            <span class="category_bg oil"></span>
					            주유소
					        </li>  
					        <li id="CE7" data-order="4"> 
					            <span class="category_bg cafe"></span>
					            카페
					        </li>  
					        <li id="CS2" data-order="5"> 
					            <span class="category_bg store"></span>
					            편의점
					        </li>      
					    </ul>
					</div>
					</div>
				</div>
			</div>
		</section>
		<!-- ================ contact section end ================= -->
	</main>

	<jsp:include page="/WEB-INF/views/include/js.jsp" />
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efc9712dcdc5c301973804eeed8688a6&libraries=services"></script>
	<script src="/carrotmap/assets/js/mainmap/map.js"></script>
 	<script src="/carrotmap/assets/js/mainmap/category.js"></script> 
 	<script src="/carrotmap/assets/js/mainmap/filter.js"></script> 
	<script>
		 
		 /* 3 donut charts */
			var donutOptions = {
			  cutoutPercentage: 85, 
			  legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
			};


			// donut 3
			var chDonutData3 = {
			    labels: ['-3억', '3-7억', '7-15억','15억 이상'],
			    datasets: [
			      {
			        backgroundColor: ['#007bff','#28a745','#dc3545',,'#6c757d'],
			        borderWidth: 0,
			        data: [21, 45, 55, 33]
			      }
			    ]
			};
			
			
			
			var chDonut3 = document.getElementById("chDonut3");
			if (chDonut3) {
			  new Chart(chDonut3, {
			      type: 'pie',
			      data: chDonutData3,
			      options: donutOptions
			  });
			}
		 
    
	
	</script>
</body>
</html>

