<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<div class="header-area header-transparent">
        <div class="main-header">
          <div class="header-bottom header-sticky" style="background-color: rgb(26, 26, 58);">
            <div class="container-fluid">
              <div class="row align-items-center">
                <!-- Logo -->
                <div class="col-xl-2 col-lg-2 col-md-1">
                  <div class="logo">
                    <a href="${root}/" style="color:white"
                      ><img src="https://image.flaticon.com/icons/png/512/591/591329.png" alt="logo123" style="width:50px;height:50px;"
                    />&nbsp;CarrotMap</a>
                  </div>
                </div>  
                <div class="col-xl-10 col-lg-10 col-md-8">
                  <!-- Main-menu -->
                  <div class="main-menu f-right d-none d-lg-block">
                    <nav>
                      <ul id="navigation">
                        <li><a href="${root}/">Home</a></li>
                        <li><a href="${root}/mainmap/map">Map</a></li>
                        <li><a href="${root}/house/houseform">방등록</a></li>
                        <li><a href="listing.html">Listing</a></li>
                        <li>
                          <a href="#">게시판</a>
                          <ul class="submenu">
                            <li><a href="${root}/board/notice/list">공지사항</a></li>
                            <li><a href="${root}/board/user/list">자유 게시판</a></li>
                            <li><a href="elements.html">Q&A</a></li>
                            <li><a href="listing_details.html"></a></li>
                          </ul>
                        </li>
                        <li><a href="${root}/about">About</a></li>
                        <li class="add-list">
                          <a href="listing_details.html"><i class="ti-plus"></i>마이페이지</a>
                        </li>
                        <li class="login">
                        
                         <%
                         	if(session.getAttribute("userinfo") == null){
                         	
                         %>
                       		<script>console.log(1)</script>
                       		<a href="${root}/user/sign_in">
                           	<i class="ti-user"></i> Sign in or Register</a>
                         <%
                         	}else{
                         %>
                         	<script>console.log(2)</script>
                       		<a href="#">
                       		
                           	<i class="ti-user"></i>${userinfo.name}님 하이</a>
                           	<ul class="submenu">
                            <li><a href="${root}/user/mypage">회원 정보 수정</a></li>
                            <li><a href="${root}/user/logout">로그아웃</a></li>
                          </ul>
                         <%
                         	}
                         %>
                          	
                        </li>
                      </ul>
                    </nav>
                  </div>
                </div>
                <!-- Mobile Menu -->
                <div class="col-12">
                  <div class="mobile_menu d-block d-lg-none"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>