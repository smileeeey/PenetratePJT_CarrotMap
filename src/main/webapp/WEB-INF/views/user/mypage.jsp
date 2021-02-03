<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Directory HTML-5 Template</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<jsp:include page="/WEB-INF/views/include/css.jsp" />
<link rel="stylesheet" href="/carrotmap/assets/css/mypage.css" />

</head>

<body>
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
			class="hero-area2 slider-height2 hero-overly2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center pt-50">
							<h2>회원 정보 수정</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Hero End -->
		<!--================Blog Area =================-->
		<section class="blog_area section-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mb-5 mb-lg-0">

						<!-- 회원 정보 수정 start -->


						<div>
							<form action="${root}/user/update" method="POST">
								<div class="form-group">
									<label for="exampleFormControlInput1">ID</label> <input
										type="text" class="form-control"
										id="id" name="id" value="${user.id}" readonly>
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">PASSWORD</label> <input
										type="password" class="form-control"
										id="pw" name="pw" value="${user.pw}">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">NAME</label> <input
										type="text" class="form-control"
										id="name" name="name" value="${user.name}">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">Email address</label> <input
										type="email" class="form-control"
										id="email" name="email" value="${user.email}">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">GENDER</label> <input
										type="text" class="form-control"
										id="gender" name="gender" value="${user.gender}" placeholder="W/M">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">PHONE</label> <input
										type="text" class="form-control"
										id="phone" name="phone" value="${user.phone}">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">BIRTHDAY</label> <input
										type="date" class="form-control"
										id="birthday" name="birthday" value="${user.birthday.substring(0,10)}">
								</div>
								
								<button id="slidBtn">Submit</button>
							</form>
						</div>
						<!-- 회원 정보 수정 end -->
					</div>

					<!-- 사이드 바 -->
					<div class="col-lg-4">
						<div class="blog_right_sidebar">
							<!-- 검색 입력창 -->
							<aside class="single_sidebar_widget search_widget">
								<form action="#">
									<div class="form-group">
										<div class="input-group mb-3">
											<input type="text" class="form-control"
												placeholder="Search Keyword" onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Search Keyword'" />
											<div class="input-group-append">
												<button class="btns" type="button">
													<i class="ti-search"></i>
												</button>
											</div>
										</div>
									</div>
									<button
										class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
										type="submit">Search</button>
								</form>
							</aside>

							<!-- 카테고리 분류 -->
							<aside class="single_sidebar_widget post_category_widget">
								<h4 class="widget_title">Category</h4>
								<ul class="list cat-list">
									<li><a href="#" class="d-flex">
											<p>Resaurant food</p>
											<p>(37)</p>
									</a></li>
									<li><a href="#" class="d-flex">
											<p>Travel news</p>
											<p>(10)</p>
									</a></li>
									<li><a href="#" class="d-flex">
											<p>Modern technology</p>
											<p>(03)</p>
									</a></li>
									<li><a href="#" class="d-flex">
											<p>Product</p>
											<p>(11)</p>
									</a></li>
									<li><a href="#" class="d-flex">
											<p>Inspiration</p>
											<p>21</p>
									</a></li>
									<li><a href="#" class="d-flex">
											<p>Health Care (21)</p>
											<p>09</p>
									</a></li>
								</ul>
							</aside>

							<!-- 최근 등록한 글 -->
							<aside class="single_sidebar_widget popular_post_widget">
								<h3 class="widget_title">Recent Post</h3>
								<div class="media post_item">
									<img src="assets/img/post/post_1.png" alt="post" />
									<div class="media-body">
										<a href="blog_details.html">
											<h3>From life was you fish...</h3>
										</a>
										<p>January 12, 2019</p>
									</div>
								</div>
								<div class="media post_item">
									<img src="assets/img/post/post_2.png" alt="post" />
									<div class="media-body">
										<a href="blog_details.html">
											<h3>The Amazing Hubble</h3>
										</a>
										<p>02 Hours ago</p>
									</div>
								</div>
								<div class="media post_item">
									<img src="assets/img/post/post_3.png" alt="post" />
									<div class="media-body">
										<a href="blog_details.html">
											<h3>Astronomy Or Astrology</h3>
										</a>
										<p>03 Hours ago</p>
									</div>
								</div>
								<div class="media post_item">
									<img src="assets/img/post/post_4.png" alt="post" />
									<div class="media-body">
										<a href="blog_details.html">
											<h3>Asteroids telescope</h3>
										</a>
										<p>01 Hours ago</p>
									</div>
								</div>
							</aside>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--================Blog Area =================-->
	</main>
	<footer>
		<!-- Footer Start-->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- Footer End-->
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<jsp:include page="/WEB-INF/views/include/js.jsp" />
</body>
</html>
