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
<link rel="manifest" href="site.webmanifest" />
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico" />

<!-- CSS here -->
<jsp:include page="/WEB-INF/views/include/css.jsp" />
<link rel="stylesheet" href="/carrotmap/assets/css/sign_in.css" />
</head>

<body>
	<%-- 	<c:if test="not empty ${loginFail}"> --%>
	<!-- 		<div class="alert alert-danger" role="alert"> -->
	<!-- 			Please check your ID or Password again:( -->
	<!-- 		</div> -->
	<%-- 	</c:if> --%>
	<script>console.log(${signupMsg})</script>
	<script>console.log('islogin',${islogin})</script>
	<header>
		<!-- Header Start -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<!-- Header End -->
	</header>
	<main>
		<!-- Hero Area Start-->
		<div class="slider-area hero-overly"">
			<!-- start login modal -->
			<div class="container" id="container"
				style="width: 1000px; height: 600px;">
				<div class="form-container sign-up-container">
					<form action="${root}/user/regist" method="post" id="registInfo">
						<h1>회원가입</h1>
<!-- 						<div class="social-container"> -->
<!-- 							<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> -->
<!-- 							<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a> -->
<!-- 							<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a> -->
<!-- 						</div> -->
						 <input id="name"
							type="text" name="name" placeholder="Name" />
						<div class="row" style="width: 100%; margin: 0; padding: 0">
							<div class="col-8" style="padding: 0">
								<input type="email" id="email" name="email" placeholder="Email" />
							</div>
							<div class="col-4">
								<button type="button" id="eamilBtn"
									style="height: 80%; width: 100%; margin: 0; padding: 0; margin-top: 8%">
								이메일 확인	
								</button>
							</div>
						</div>
						<div class="row" style="width: 100%; margin: 0; padding: 0">
							<div class="col-8" style="padding: 0">
								<input type="text" id="id" name="id" placeholder="ID" />
							</div>
							<div class="col-4">
								<button type="button" id="idBtn"
									style="height: 80%; width: 100%; margin: 0; padding: 0; margin-top: 8%">
									아이디 확인
								</button>
							</div>
						</div>

						<input type="password" id="pw" name="pw" placeholder="Password" />
						<input type="password" id="pw2" name="pw2"
							placeholder="Check Password" />

						<button id="signupBtn" type="button">회원가입</button>
					</form>
				</div>
				<div class="form-container sign-in-container">
					<form action="${root}/user/login">
						<h1> 로그인 </h1>
<!-- 						<div class="social-container"> -->
<!-- 							<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> -->
<!-- 							<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a> -->
<!-- 							<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a> -->
<!-- 						</div> -->
						<input type="text" name="id"
							placeholder="아이디" /> <input type="password" name="pw"
							placeholder="비밀번호" /> <a href="#">Forgot your password?</a>
						<button>로그인</button>
					</form>
				</div>
				<div class="overlay-container">
					<div class="overlay">
						<div class="overlay-panel overlay-left">
							<h1 style="color:white">환영합니다</h1>
							<p style="color:white">로그인하여 당근맵의 더 많을 기능을 사용해보세요</p>
							<button class="ghost" id="signIn">로그인</button>
						</div>
						<div class="overlay-panel overlay-right">
							
							<h1>안녕하세요!</h1>
							<p style="color:white">간단한 회원가입으로 더 많은 기능을 즐겨보세요<p>			
							
							<button class="ghost" id="signUp" >회원가입</button>
						</div>
					</div>
				</div>

				<!-- end login modal -->
			</div>
		</div>
		<!--Hero Area End-->
	</main>

	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<jsp:include page="/WEB-INF/views/include/js.jsp" />

	<script>
      const signUpButton = document.getElementById('signUp');
      const signInButton = document.getElementById('signIn');
      const container = document.getElementById('container');
      let idcheck=false;
      let emailcheck=false;

      signUpButton.addEventListener('click', () => {
        container.classList.add('right-panel-active');
      });

      signInButton.addEventListener('click', () => {
        container.classList.remove('right-panel-active');
      });
      
      $("#signupBtn").click(()=>{
     	 let info=$("#registInfo");
     	 console.log(info);
     	 console.log($("#name").val());
     	 console.log($("#email").val());
     	 console.log($("#id").val());
     	 console.log($("#pw").val());
     	 console.log($("#pw2").val());
     	 console.log(idcheck);
     	 console.log(emailcheck);
     	
     
     	 
		
     	if(idcheck && idcheck ){
     		if($("#pw").val() != $("#pw2").val()){
     			alert("비밀번호가 다릅니다.");
     		}     		
     		else if($("#name").val()&& $("#email").val() && $("#id").val() &&$("#pw").val() &&$("#pw2").val() ){
	     		alert("회원 정보 성공");
	     		$('#registInfo').submit();

	     		
	     	}else{
	     		alert("모든 정보를 입력해 주세요");
	     	}
	     		
     	}else{
     		if(!idcheck){alert("ID를 검사해주세요");}
     		if(!eamilcheck){alert("eamil를 검사해주세요");}
     	}
     	 
     	 
     	 
       });
      
   
      
      
      $("#eamilBtn").click(()=>{
     	 let email=$("#email").val();
//      	 alert(email);
     	 $.ajax({
     		 url: "http://localhost:8887/carrotmap/user/emailcheck",
     		 data:{email:email},
     		 type:"GET",
     		 success: (data)=>{
     			 if(data==1){
     				emailcheck=true;
     				 alert("사용가능한 이메일입니다:)");
     			 }
     			 if(data==0){
     				emailcheck=false;
     				 alert("사용불가 : 이미 등록된 이메일입니다:(");
     			 }
     		 },
     		 error:(err)=>{
     			 alert("fail");
     		 },
     		 
     	 })
       });
      
      $("#idBtn").click(()=>{
      	 let id=$("#id").val();
//       	 alert(id);
      	 $.ajax({
      		 url: "http://localhost:8887/carrotmap/user/idcheck",
      		 data:{id:id},
      		 type:"GET",
      		 success: (data)=>{
      			 if(data==1){
      				idcheck=true;
     				 alert("사용가능한 아이디입니다:)");
      			 }
      			 if(data==0){
      				idcheck=false;
    				 alert("사용불가 : 이미 등록된 아이디입니다:(");
      			 }
      		 },
      		 error:(err)=>{
      			 alert("fail");
      		 },
      		 
      	 })
        });
    </script>
</body>
</html>
