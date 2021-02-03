<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>당근맵</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="manifest" href="site.webmanifest" />

<jsp:include page="/WEB-INF/views/include/css.jsp" />
</head>

<body>

	<!-- Preloader Start -->
	<header>
		<!-- Header Start -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<!-- Header End -->
	</header>
	<main>
		<!-- Hero Area Start-->
		<div class="about-details section-padding2">
			<div class="container">

				<!-- Section Tittle -->
				<div class="section-tittle section-tittle5 mb-80"
					style="text-align: center; margin-top:100px; ">
					<h1 style="margin-top:20px;"><b>당신 근처의 지도</b></h1>
					
					<img  src="https://image.flaticon.com/icons/png/512/591/591329.png" alt="logo123" style="width:100px;margin-top:50px;height:100px;"
                    />&nbsp;
				</div>


			</div>

		</div>
		<!--Hero Area End-->

	</main>
	<footer>
		<!-- Footer Start-->
	
		<!-- Footer End-->
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<jsp:include page="/WEB-INF/views/include/js.jsp" />
</body>
</html>
