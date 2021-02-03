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
<title>게시물 등록</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.js"></script>
<jsp:include page="/WEB-INF/views/include/css.jsp" />
</head>
<body>
	  <!-- Preloader Start -->
    <div id="preloader-active">
      <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
          <div class="preloader-circle"></div>
          <div class="preloader-img pere-text">
            <img src="assets/img/logo/loder.jpg" alt="" />
          </div>
        </div>
      </div>
    </div>
    <!-- Preloader Start-->
    <header>
      <!-- Header Start -->
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
      <!-- Header End -->
    </header>
    <main>
      <!-- Hero Start-->
      <div
        class="hero-area2 slider-height2 hero-overly2 d-flex align-items-center"
      >
        <div class="container">
          <div class="row">
            <div class="col-xl-12">
              <div class="hero-cap text-center pt-50">
                <h2>게시글 등록</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--Hero End -->
      <!--================Blog Area =================-->
      <section class="blog_area single-post-area section-padding">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 posts-list">               
              <div class="comment-form">
                <h4>게시글 등록</h4>
                <form
                  class="form-contact comment_form"
                  action="${root}/board/user/insert"
                  method="post"
                  id="commentForm"
                >
                <input type="hidden" value="${userinfo.id}" name="userId" >
                  <div class="row">
                    <div class="col-12">
                      <div class="form-group">
                        <input
                          class="form-control"
                          name="title"
                          id="title"
                          type="text"
                          placeholder="제목"
                        />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <textarea
                          class="form-control w-100"
                          name="content"
                          id="content"
                          cols="30"
                          rows="9"
                          placeholder="내용"
                        ></textarea>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <input
                          class="form-control"
                          name="category1"
                          id="category2"
                          type="text"
                          placeholder="카테고리"
                        />
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                         <input
                          class="form-control"
                          name="category2"
                          id="category2"
                          type="text"
                          placeholder="카테고리"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <button
                      type="submit"
                      class="button button-contactForm btn_1 boxed-btn"
                    >
                      게시글 등록
                    </button>
                  </div>
                </form>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="blog_right_sidebar">
                <aside class="single_sidebar_widget search_widget">
                  <form action="#">
                    <div class="form-group">
                      <div class="input-group mb-3">
                        <input
                          type="text"
                          class="form-control"
                          placeholder="Search Keyword"
                          onfocus="this.placeholder = ''"
                          onblur="this.placeholder = 'Search Keyword'"
                        />
                        <div class="input-group-append">
                          <button class="btns" type="button">
                            <i class="ti-search"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                    <button
                      class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                      type="submit"
                    >
                      Search
                    </button>
                  </form>
                </aside>
               
            
              
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--================ Blog Area end =================-->
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
