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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.js"></script>
<jsp:include page="/WEB-INF/views/include/css.jsp" />
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
							<h2>공지사항</h2>
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
						<div class="blog_left_sidebar">
							<c:if test="${list.size() !=0}">
								<c:forEach var="board" items="${list}">
									<article class="board">
										<div class="blog_details">
											<a class="d-inline-block"
												href="${root}/board/notice/select?no=${board.no}">
												<h2>${board.title}</h2>
											</a>
											<p>${board.content}</p>
											<ul class="blog-info-link">
												<c:forEach var="category" items="${board.category}">
													<li><i class="fa fa-user"> ${category}</i></li>
												</c:forEach>
												<li><i class="fas fa-eye"></i> ${board.viewCnt}</li>
												<li>No. ${board.no}</li>
												<li>Date. ${board.regTime}</li>
												<c:if test="${board.updateTime !=null}">
													<li>edited. ${board.updateTime}</li>
												</c:if>
											</ul>
										</div>
									</article>
								</c:forEach>
							</c:if>
					
							<!-- 페이징  -->
							<nav class="blog-pagination justify-content-center d-flex">
								<ul class="pagination">
									<li class="page-item"><a href="#" class="page-link"
										aria-label="Previous"> <i class="ti-angle-left"></i>
									</a></li>
									<li class="page-item"><a href="#" class="page-link">1</a>
									</li>
									<li class="page-item"><a href="#" class="page-link"
										aria-label="Next"> <i class="ti-angle-right"></i>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>

					<!-- 사이드 바 -->
					<div class="col-lg-4">
						<div class="blog_right_sidebar">
							<!-- 검색 입력창 -->
							<aside class="single_sidebar_widget search_widget">
								<form action="${root}/board/notice/list">
									<div class="form-group">
										<div class="input-group mb-3">
											<input type="text" class="form-control" name="searchWord" id="searchWord"
												placeholder="Search Keyword" onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Search Keyword'" />
											<div class="input-group-append">
												<button class="btns" type="submit" id=serchBtn>
													<i class="ti-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
								<a href="${root}/board/notice/list" style="color:black">
									<button										
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
									type="submit">
									전체글 보기
									</button>
								</a>
							</aside>
							
							
							<!-- 중요 공지사항-->
							<aside class="single_sidebar_widget popular_post_widget">
								<h3 class="widget_title">중요 공지글</h3>
								<c:forEach var="importance" items="${impboard}" >
									<div class="media post_item">										
										<div class="media-body">
											<a href="${root}/board/notice/select?no=${importance.no}">
												<h3>${importance.title}</h3>
											</a>
											<p>${importance.regTime}</p>
										</div>
									</div>
								</c:forEach>
								
							</aside>
							<aside class="single_sidebar_widget tag_cloud_widget" >
								<a target="_blank" href=https://www.fastcampus.co.kr/book_online_challenge?gclid=EAIaIQobChMI9uj2kIWZ7QIVVct8Ch3QqwhvEAEYASAAEgKMNvD_BwE>
								<img src="/carrotmap/assets/img/ad/14014801417172255184.png" >
								</a>
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
;