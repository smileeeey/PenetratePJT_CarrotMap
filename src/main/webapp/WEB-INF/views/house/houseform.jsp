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
<link rel="stylesheet" href="/carrotmap/assets/css/houseform.css" />
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

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
							<h2>방 등록</h2>
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

						<!-- 방 등록 수정 start -->

						<div>
							<form action="${root}/house/regist" method="post"
								enctype="multipart/form-data">
								<button id="slidBtn" onclick="execDaumPostcode()">주소 찾기</button>
								<!--dong -->
								<div class="form-group">
									<label for="exampleFormControlInput1">동</label> <input
										type="text" class="form-control" id="dong" name="dong"
										readonly="readonly">
								</div>
								<!--code -->
								<div class="form-group">
									<label for="exampleFormControlInput1">지역코드</label> <input
										type="text" class="form-control" id="code" name="code"
										readonly="readonly">
								</div>
								<!--jibun -->
								<div class="form-group">
									<label for="exampleFormControlInput1">지번</label> <input
										type="text" class="form-control" id="jibun" name="jibun"
										readonly="readonly">
								</div>
								<!--AptName -->
								<div class="form-group">
									<label for="exampleFormControlInput1">건물이름</label> <input
										type="text" class="form-control" id="AptName" name="AptName">
								</div>
								<!--dealAmount -->
								<div class="form-group">
									<label for="exampleFormControlInput1">가격</label> <input
										type="number" class="form-control" id="dealAmount"
										name="dealAmount">
								</div>
								<!-- -->
								<div class="form-group">
									<label for="exampleFormControlInput1">건축년도 </label> <input
										type="date" class="form-control" id="buildYear"
										name="buildYear">
								</div>
								<!-- -->
								<div class="form-group">
									<input type="hidden" class="form-control" id="dealYear"
										name="dealYear">
								</div>
								<!-- dealDay-->
								<div class="form-group">
									<input type="hidden" class="form-control" id="dealDay"
										name="dealDay">
								</div>
								<!--area -->
								<div class="form-group">
									<label for="exampleFormControlInput1">평수 </label> <input
										type="text" class="form-control" id="area" name="area">
								</div>
								<!--floor -->
								<div class="form-group">
									<label for="exampleFormControlInput1">층 </label> <input
										type="number" class="form-control" id="floor" name="floor">
								</div>
								<!--file-->
								<div class="form-group">
									<label for="exampleFormControlInput1">사진 </label> <label
										for="file"
										class="form-control button rounded-0 primary-bg text-white  btn_1 boxed-btn"
										style="margin: auto; width: 100%; padding: 10px;" > 파일
										업로드</label> 
										<input type="file"
										class="form-control button rounded-0 primary-bg text-white  btn_1 boxed-btn"
										id="file" name="file"  
										 id="fileUpload" multiple="multiple" style="display: none">
								</div>


								<button id="slidBtn">Submit</button>

							</form>
						</div>
						<!-- 방 등록 end -->

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

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script>
	
	$("#fileUpload").change(function(){
	    console.log('Hello I am event ^-^;');
	    fileList = $("#fileUpload")[0].files;
	    fileListTag = '';
	    for(i = 0; i < fileList.length; i++){
	        fileListTag += "<li>"+fileList[i].name+"</li>";
	    }
	    $('#fileList').html(fileListTag);

	});
	
	
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.

		new daum.Postcode(
				{
					oncomplete : function(data) {
						console.log(data)
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
				
						
						let add=data.jibunAddress.split(' ');
					    let jibun=add[add.length-1];
					    
						$("#dong").val(data.bname) ;
						$("#code").val(data.sigunguCode);
						$("#jibun").val(jibun);
						$("#AptName").val(data.buildingName);
						
						console.log($("#dong").val() )
		
					}
				}).open({autoClose:true});
	</script>


	<jsp:include page="/WEB-INF/views/include/js.jsp" />
</body>
</html>
