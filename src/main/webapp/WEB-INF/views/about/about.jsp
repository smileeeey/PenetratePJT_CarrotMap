<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>당근맵 소개</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.js"></script>
<jsp:include page="/WEB-INF/views/include/css.jsp" />

</head>
<body>
 <main>
  <!-- About Details Start -->
        <div class="about-details section-padding2">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-md-10">
                        <!-- Section Tittle -->
                        <div class="section-tittle section-tittle5 mb-80">
                            <span>About CarrotMap</span>
                            <h2>당신 근처의 지도 당근맵 </h2>
                            <h3><b style="color:blcak;">당근맵은 동네와 이웃들을 연결시켜 정보를 공유하며 따뜻하고 풍부한 지역 문화를 꿈꾸고 있어요.</b></h3>
                        </div> 
                    </div>
                </div>
                <div class="row justify-content-between section-tittle section-tittle5">
                    <div class="col-lg-4">
                        <h2>당근맵 팀원</h2>
                         <div class="testimonial-caption ">                             
                             <!-- founder -->
                             <div class="testimonial-founder d-flex align-items-center justify-content-center mb-30 row">
                                 <div class="founder-img col-4">
                                     <img src="/carrotmap/assets/img/member/김성실.jpg" width="80" height="80" style="border-radius: 50%;">
                                 </div>
                                 <div class="founder-text col-8" >                                     
                                     <b>성실</b>
                                     <p>Full Stack developer</p>
                                 </div>                               
                             </div>
                             <div class="testimonial-founder d-flex align-items-center justify-content-center mb-30 row">
                                 <div class="founder-img col-4">
                                     <img src="/carrotmap/assets/img/member/이수민.jpg" width="80" height="80" style="border-radius: 50%;">
                                 </div>
                                 <div class="founder-text col-8" >                                     
                                     <b>수민</b>
                                     <p>Full Stack developer</p>
                                 </div>                               
                             </div>
                         </div>
                    </div>
                    <div class="col-lg-5">
                               <h2>주요 기능 </h2>
                        <p>2020.12.04 프로젝트 시작</p>
                        <p>2020.12.08 DB,Springboot 프로젝트 생성 </p>
                        <p>2020.12.18 회원관리,게시판 페이지</p>
                        <p>2020.12.21 Map 페이지(주택정보, 카테고리 조회)</p>
                        <p>2020.12.22 게시판 페이지 업데이트(좋아요,검색연동)</p>
                        <p>2020.12.23 Map 페이지 업데이트(상세 페이지,필터)</p>   
                    </div>
                </div>
            </div>
            
        </div>
        <!-- About Details End -->
  <!-- About Details Start -->
        <div class="about-details section-padding2">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-md-10">
                        <!-- Section Tittle -->
                        <div class="section-tittle section-tittle5 mb-80">                           
                            <h2>개발일정</h2>
                            <h3><b style="color:blcak;">Notion을 통해 기획,일정분배 ,개발문서 공유를 하며 프로젝트를 진행했어요 </b></h3>
                        </div> 
                    </div>
                </div>
                <div class="row justify-content-between section-tittle section-tittle5">
                   	<img src="/carrotmap/assets/img/about/일정1.png" width="1200" >                   
                </div>
                <div class="row justify-content-between section-tittle section-tittle5">
                   	<img src="/carrotmap/assets/img/about/일정2.png" width="1200">                   
                </div>
            </div>
            
        </div>
        <!-- About Details End -->
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
     <!-- Services Area Start -->
        <div class="services-area pt-150 pb-150 section-bg" data-background="assets/img/gallery/section_bg02.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle section-tittle2 text-center mb-80">
                            
                            <h2>당근 맵 서비스</h2>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-between">                    
                    <div class="col-lg-3 col-md-6">
                        <div class="single-services text-center mb-50">
                            <div class="services-icon">
                                <span class="flaticon-problem"><i class="fas fa-map-marker-alt"></i></span>
                            </div>
                            <div class="services-cap">
                                 <h5><a href="#">당근맵</a></h5>
                                <p>당신 주변의 부동산,식당,편의시설 정보를 확인할수 있어요</p>
                            </div>
                            <img class="shape2 d-none d-lg-block" src="assets/img/icon/serices2.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-services text-center mb-50">
                            <div class="services-icon">
                                <span class="flaticon-problem"><i class="fas fa-users"></i></span>
                            </div>
                            <div class="services-cap">
                                <h5><a href="#">게시글</a></h5>
                                <p>다양한 게시물을 통해 이웃과 소통하고 정보를 공유하세요</p>
                            </div>
                            <img class="shape2 d-none d-lg-block" src="assets/img/icon/serices2.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-services text-center mb-50">
                            <div class="services-icon">
                                <span class="flaticon-respect">$</span>
                            </div>
                            <div class="services-cap">
                                <h5><a href="#">광고</a></h5>
                                <p>당신의 이웃과 주변상권을 분석하여 광고를 제공합니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Services Area End -->
 
 </main>
<jsp:include page="/WEB-INF/views/include/js.jsp" />
</body>
</html>