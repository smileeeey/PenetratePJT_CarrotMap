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
<title>게시물 ${board.no}</title>
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
	<!-- Preloader Start-->
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
							<h2>자유게시판</h2>
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
						<div class="single-post">
							<button id="boardBtn"
								class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								type="button" style="color: #eb566c !important">목록</button>
							<div class="feature-img"></div>
							<div class="blog_details">
								<h2>${board.title}</h2>
								<ul class="blog-info-link mt-3 mb-4">
									<li><a href="#"><i class="fa fa-user"></i>${board.userId}</a></li>
									<li><a href="#"><i class="fa fa-comments"></i>${fn:length(comments)} Comments</a></li>
								</ul>
								<div class="blog-author" style="margin: 0">
									<div class="media align-items-center">
										<div class="media-body" style="height:150px; line-height:150px; vertical-align:middle">
											${board.content}
										</div>
									</div>
								</div>	
								
							</div>
						</div>						
						
						
						<div class="navigation-top">
							<div class="d-sm-flex justify-content-between text-center row">

								<div class="viewcnt-info col-sm-2">
									<span class="align-middle"><i class="fas fa-users"></i></span>
									${board.viewCnt} view
								</div>
								<div class="viewcnt-info col-sm-2">
										<button type="button" style="border: 0; background: white;"
											id="likeBtn">
											<form id="likeform">
												<input type="hidden" value="${board.no}" id="boardno"
													name="no" /> <input type="hidden" value="${userinfo.id}"
													id="likeuserId" name="id" />
											</form>
											<span class="align-middle"> <c:choose>
													<c:when test="${userLiked == 1 }">
														<i class="fas fa-heart" id="fillheart"></i>
														<i class="far fa-heart" id="emptyheart"
															style="display: none"></i>
													</c:when>
													<c:otherwise>
														<i class="fas fa-heart" id="fillheart" style="display: none"></i>
														<i class="far fa-heart" id="emptyheart"></i>
													</c:otherwise>
												</c:choose> <span id="likeCnt"> ${likeCnt} </span> like
											</span>
										</button>
								</div>
								<div class="col-sm-8 text-center my-2 my-sm-0">
									<!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
								</div>

							</div>
							<div class="navigation-area">
								<div class="row">
									<div
										class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">


										<div class="detials">
											<c:if test="${board.no>1}">
												<a href="${root}/board/user/select?no=${board.no-1}">
													<h4>Prev Post</h4>
												</a>
											</c:if>
										</div>
									</div>
									<div
										class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
										<c:if test="${board.no<listcnt}">
											<div class="detials">
												<a href="${root}/board/user/select?no=${board.no+1}">
													<h4>Next Post</h4>
												</a>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						
						<div class="comment-form" style="margin: 0">
							<h4>댓글 남기기</h4>
							<form class="form-contact comment_form"
								action="${root}/board/user/comment/insert" id="commentForm"
								method="post">
								<input type="hidden" value="${board.no}" name="boardNo">
								<input type="hidden" value="${comments[0].groupNo+1}"
									name="groupNo"> <input type="hidden"
									value="${userinfo.id}" name="memberId">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<textarea class="form-control w-100" name="comment"
												id="comment" cols="30" rows="2" placeholder="댓글 남기기"></textarea>
										</div>
									</div>
								</div>
								<div class="form-group" style="margin: 5px]">
									<c:if test="${userinfo != null}">
										<button id="commentBtn" type="submit"								
										class="button button-contactForm btn_1 boxed-btn ">등록</button>
									</c:if>
									<c:if test="${userinfo == null}">
										<button id="commentBtn" type="button"								
										class="button button-contactForm btn_1 boxed-btn ">로그인 필요</button>
									</c:if>
								</div>
							</form>
						</div>
						<div class="comments-area" style="margin: 0">
							<h4>댓글 수 ${fn:length(comments)}</h4>
							<c:forEach var="comment" items="${comments}">
								<div class="comment-list" style="padding-bottom: 0">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="desc">
												<p class="comment">
													<i class="far fa-comment"></i> ${comment.comment}
												</p>
												<div class="d-flex justify-content-between">
													<div class="d-flex align-items-center">
														<h5>
															<a href="#">${comment.memberId}</a>
														</h5>
														<p class="date">${comment.writeDate}</p>
													</div>
													<div class="reply-btn">

														<button type="button" class="btn-replyAct "
															style="border: 0; background: white;"
															id="${comment.groupNo}">
															<i class="far fa-plus-square"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-1 comment" style="magin: 0"></div>
									<div class="col-11 comment" style="padding: 0">
										<div class="form-group" style="display: none"
											id="G${comment.groupNo}">
											<form class="form-contact comment_form"
												action="${root}/board/user/comment/insert" id="replyForm${comment.groupNo}"
												method="post">
												<input type="hidden" value="${board.no}" name="boardNo">
												<input type="hidden" value="${comment.groupNo}"
													name="groupNo"> <input type="hidden" value="1"
													name="classNo"> <input type="hidden"
													value="${userinfo.id}" name="memberId">
												<div class="row">
													<div class="col-9">
														<div class="form-group" style="margin: 0">
															<textarea class="form-control w-100" name="comment"
																id="comment" cols="30" rows="4" placeholder="댓글 남기기"></textarea>
														</div>
													</div>
													<div class="col-3">
														<div class="form-group ">
															<c:if test="${userinfo != null}">
															<button id="replytBtn" type="button"
																class="replytBtn1 button button-contactForm btn_1 boxed-btn" name="${comment.groupNo}"
																style="height: 80%; display: inline-block; text-overflow: clip; overflow: hidden; white-space: nowrap;">
																등록
															</button>
															</c:if>
															<c:if test="${userinfo == null}">
															<button type="button"
																class="button button-contactForm btn_1 boxed-btn"
																style="height: 80%; display: inline-block; text-overflow: clip; overflow: hidden; white-space: nowrap;">
																로그인 필요
															</button>
															</c:if>
														</div>
													</div>
												</div>
											</form>
										</div>
										<c:forEach var="reply" items="${comment.list}">
											<div class="comment-list"
												style="margin: 5px 0 0 0; padding: 0;">
												<div class="single-comment justify-content-between d-flex">
													<div class="user justify-content-between d-flex">
														<div class="desc">
															<p class="comment" style="margin: 5px">
																<i class="far fa-comments"></i> ${reply.comment}
															</p>
															<div class="d-flex justify-content-between">
																<div class="d-flex align-items-center">
																	<h5>
																		<a href="#">${reply.memberId}</a>
																	</h5>
																	<p class="date">${reply.writeDate}</p>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>

								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="blog_right_sidebar">
							
							<aside class="single_sidebar_widget popular_post_widget">
								<h3 class="widget_title">중요 공지글</h3>
								<c:forEach var="importance" items="${impboard}" >
									<div class="media post_item">										
										<div class="media-body">
											<a href="${root}/board/user/select?no=${importance.no}">
												<h3><b>${importance.title}</b></h3>
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

	<!-- 	대댓글 이벤트 관리 -->
	<script>
	
	
	let isliked=true;
	var form=$("#likeform")
 	var formdata=form.serialize();
	
// 	isliked 초기화
	$(document).ready(function(){
		 $.ajax({
      		 url: "http://localhost:8887/carrotmap/board/user/check-like",
      		 type:"POST",
      		 data:formdata,
      		 success: (data)=>{	      			 
      			console.log("성공",data );
      			if(data==1){
      				isliked=true;      				;	      				
      			}
      			else {
      				isliked=false;      			
      			}
      		 },
      		 error:(err)=>{
      			 alert("fail");
      		 },      		 
      	 });
	});
	
// 	버튼 누르기
	 $("#likeBtn").click(()=>{
			console.log("before isliked",isliked);	 
		
			 

			 var form=$("#likeform")
			 var formdata=form.serialize();
			 console.log(formdata);
			 
			 let likeCnt=Number($("#likeCnt").text());
			
	// 체크가 되어 있을대
			if(isliked==false){				 
				 $.ajax({
		      		 url: "http://localhost:8887/carrotmap/board/user/update-like",
		      		 type:"POST",
		      		 data:formdata,
		      		 success: (data)=>{
		      			console.log("등록 ",data );
		      			if(data==1){
		      			console.log("등록 성공",data );		      			
	      				$("#likeCnt").text(likeCnt+1);
	      				$("#fillheart").css("display", "initial");
	      				$("#emptyheart").css("display", "none");
		      				
		      			}
		      		 },
		      		 error:(err)=>{
		      			 alert("fail");
		      		 },      		 
		      	 });
			}else{
				$.ajax({
		      		 url: "http://localhost:8887/carrotmap/board/user/delete-like",
		      		 type:"POST",
		      		 data:formdata,
		      		 success: (data)=>{	      			 
		      			if(data==1){
		      				console.log("삭제 성공",data );
		      				console.log("좋아요 취소",data );
		      				$("#likeCnt").text(likeCnt-1);
		      				$("#fillheart").css("display", "none");
		      				$("#emptyheart").css("display", "initial");		      				
		      			
		      			}
		
		      		 },
		      		 error:(err)=>{
		      			 alert("fail");
		      		 },      		 
		      	 });
			}
			isliked=!isliked;
			console.log("after isliked",isliked);	 
			
			

	 });
	
	
// 	대댓글 등록창 열기
	 $(".btn-replyAct").click((e)=>{
		 
		 
// 		console.log(e.target.parentNode);		 
// 		console.log("G"+e.target.parentNode.id);		 
// 		const targetid="G"+e.target.parentNode.id;
// 		document.getElementById(targetid).style.display="initial";
// 		console.log(document.getElementById(targetid));		 
		 
			const targetid="G"+e.target.parentNode.id;
			console.log("G"+e.target.parentNode.id);		 
			console.log( document.getElementById(targetid).style.getPropertyValue("display"));		 
			if( document.getElementById(targetid).style.getPropertyValue("display")=="none"){
				console.log("!23")
				document.getElementById(targetid).style.display="initial";
			}else{
				console.log("adf")
				document.getElementById(targetid).style.display="none";
				
			}

        });
	 

	 
// 	 대댓글 등록
	 $(".replytBtn1").click((e)=>{
		 
		 e.preventDefault();
		 console.log("버튼 이벤트")
		 console.log(e.target.name)
		 let targettag ="#replyForm"+e.target.name;
		 
		 console.log($("#replyForm").val());
		 var form=$(targettag)

      	 var formdata=form.serialize();
		 console.log(formdata)
      	 $.ajax({
      		 url: "http://localhost:8887/carrotmap/board/user/comment/insert-rest",
      		 data: formdata,
      		 type:"POST",
      		 success: (data)=>{
      			 
      			console.log("성공" );
      			console.log(data);
      			form.parent().after(
      				`
              		<div class="comment-list" style="margin:5px 0 0 0 ;padding: 0;">
 						<div class="single-comment justify-content-between d-flex">
 							<div class="user justify-content-between d-flex">
 								<div class="desc">
 									<p class="comment" style="margin:5px">
 										<i class="far fa-comments"></i>`+" "+data.comment +`
 									</p>
 									<div class="d-flex justify-content-between">
 										<div class="d-flex align-items-center">
 											<h5>
 												<a href="#">`+data.memberId +`</a>
 											</h5>
 											<p class="date">`+(new Date()).getUTCFullYear()+"-"+(new Date()).getUTCMonth()+"-"+(new Date()).getUTCDate()+`</p>
 										</div>
 									</div>
 								</div>
 							</div>
 						</div>
                   </div>
                   `
                )
      		 },
      		 error:(err)=>{
      			 alert("fail");
      		 },      		 
      	 })
        });
	</script>
	<!--  목록보기 -->
	<script>		
		  $("#boardBtn").click(()=>{		    	 
		    	  location.href = "/carrotmap/board/user/list";
		  });
	</script>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />
</body>
</html>
