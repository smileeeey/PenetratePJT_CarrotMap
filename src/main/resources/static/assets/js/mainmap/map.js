
var imgTrue = new Array('일신건영휴먼빌','대운행복','동원한강파크빌','마포한강2차푸르지오','에덴지우','두영이지안(357-3)','두레','KCC엠파이어리버','마포 한강 푸르지오','합정한강아파트','리버아인','두영이지안','그레이스3차','장미(466-0)','현대하이츠');


function makeHouseList(data){
   var housecard="";
   data.forEach(function(house){
      
	   if(house.dong=='합정동' && imgTrue.indexOf(house.AptName)!=-1){
		   console.log("정해진 이미지 불러!");
		   housecard += `<div class='card' style='width: 18rem'>
               <img src="/carrotmap/assets/img/house/${house.AptName}.png" style="width:300px;height:300px;" class="card-img-top" alt="사지인">
               <div class='card-img-overlay'>
                  <h3 class='card-title' style="display:inline">`+house.dealAmount+`<small style=\"color: black\">만원</small></h3>
                  <p class='card-text' style="display:inline">`+house.floor+`층  /`+house.area+` m2</p>
               </div>
            </div>`;
		   
	   }
	   else{
	      housecard += `<div class='card' style='width: 18rem'>
	                  <img src="/carrotmap/assets/img/marker/imageready.png" class="card-img-top" alt="사지인">
	                  <div class='card-img-overlay'>
	                     <h3 class='card-title' style="display:inline">`+house.dealAmount+`<small style=\"color: black\">만원</small></h3>
	                     <p class='card-text' style="display:inline">`+house.floor+`층  /`+house.area+` m2</p>
	                  </div>
	               </div>`;
      }
   });
   
    $('#housediv').html(housecard);
}

var mapContainer = document.getElementById('mapdiv');
var options = {
   center: new kakao.maps.LatLng(33.450701, 126.570667),
   level: 5 
};

var imageSrc = '/carrotmap/assets/img/marker/location.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)};
    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
    
var map = new kakao.maps.Map(mapContainer, options);
var geocoder = new kakao.maps.services.Geocoder();
var house_markers = [];
var under3=0,under7=0,under15=0,over15=0;
var dealAmountRatio20=0,dealAmountRatio50=0,dealAmountRatio80;

function makeHouseMarkers(data,makeMarkersFunc){
      house_markers = [];
      
      data.house.forEach(function(house){
         
            geocoder.addressSearch(house.address, function(result, status) {
         
                 if (status === kakao.maps.services.Status.OK) {
                  
                  var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);
                    
                   var marker = new kakao.maps.Marker({
                      position: markerPosition,
                      image:markerImage
                  });
                  
                  // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
               var iwContent = `
                  <div style="padding:5px;">
                     <img src="/carrotmap/assets/img/marker/imageready.png" class="card-img-top" alt="사지인">
                     <p>${house.AptName}</p>
                     <p>${house.dealAmount}만원</p>
                     <p>${house.floor}층 / ${house.area}m2</p>
                  </div>`; 
               // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
               
               if(house.dong=='합정동' && imgTrue.indexOf(house.AptName)!=-1){
            	   iwContent = `
                       <div style="padding:5px;">
                          <img src="/carrotmap/assets/img/house/${house.AptName}.png" class="card-img-top" style="width:300px;height:300px;" alt="사지인">
                          <p>${house.AptName}</p>
                          <p>${house.dealAmount}만원</p>
                          <p>${house.floor}층 / ${house.area}m2</p>
                       </div>`; 
        		   
        	   }
               
               // 인포윈도우를 생성합니다
               var infowindow = new kakao.maps.InfoWindow({
                   content : iwContent
               })
                  
                  // 마커에 마우스오버 이벤트를 등록합니다
               kakao.maps.event.addListener(marker, 'mouseover', function() {
                 // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                   infowindow.open(map, marker);
               });
               
               // 마커에 마우스아웃 이벤트를 등록합니다
               kakao.maps.event.addListener(marker, 'mouseout', function() {
                   // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                   infowindow.close();
               });
               
               // 마커에 클릭이벤트를 등록합니다
               kakao.maps.event.addListener(marker, 'click', function() {
                  var cell = document.getElementById("mymodal"); 
                  while ( cell.hasChildNodes() ) { 
                     cell.removeChild( cell.firstChild ); 
                  }
                  
	              var content = `
	                 <div class="modal-content container" id="markerClickModal">
	                    <div class="row">
	                       <div style="background-color:gray;height:50px;">
	                       </div>
	                    </div>
	                    <div class="row">
	                       <div class="col-md-5" style="height:690px">
	                          <img src="/carrotmap/assets/img/marker/imageready.png" class="card-img-top" alt="사지인">
	                          <br>
	                          <hr>
	                          <div style="margin-left:20px;padding:5px;">
	                          	<h4>${house.AptName}</h4>
		                          <h2 style="display:inline"><b>${house.dealAmount}</b></h2><h5 style="display:inline"> 만원</h5>
		                          <h5>${house.floor} 층  /  ${house.area} m2</h5>
		                          <h5><b>${house.buildYear}</b>년 건축 
		                          <h5>서울시 ${house.address}</h5>
	                          
	                          </div>
	                       </div>
	                       <div class="col-md-7" style="height:690px">
	                       		<!-- chart -->
	                       		<h2 style="text-align:center;">${house.dong} 주택가격 분포</h2>
						    	<div class="card-body" style="margin-top:20px;margin-left:130px;width:300px;height:300px;">
				                	<canvas id="chDonut3" style="width:150px;height:150px;"></canvas>
				            	</div>
				            	<!--  -->
				            	<hr style="margin-top:10px;margin-bottom: 15px;">
				            	<h3>로드뷰</h3>
				            	<div class="map_wrap" style="width: 500px;height: 300px;margin: 20px 30px;">
				            		<div id="myLoadView" style="width:100%;height:100%;">
				            			
				            		</div>
				            	</div>
	                       </div>
	                    </div>
	                 </div>
	              `;
                  
	              if(house.dong=='합정동' && imgTrue.indexOf(house.AptName)!=-1){
	            	  
	            	  content = `
	 	                 <div class="modal-content container" id="markerClickModal">
	 	                    <div class="row">
	 	                       <div style="background-color:gray;height:50px;">
	 	                       </div>
	 	                    </div>
	 	                    <div class="row">
	 	                       <div class="col-md-5" style="height:690px">
	 	                          <img src="/carrotmap/assets/img/house/${house.AptName}.png" class="card-img-top" alt="사지인">
	 	                          <br>
	 	                          <hr>
	 	                          <div style="margin-left:20px;padding:5px;">
	 	                          	<h4>${house.AptName}</h4>
	 		                          <h2 style="display:inline"><b>${house.dealAmount}</b></h2><h5 style="display:inline"> 만원</h5>
	 		                          <h5>${house.floor} 층  /  ${house.area} m2</h5>
	 		                          <h5><b>${house.buildYear}</b>년 건축 
	 		                          <h5>서울시 ${house.address}</h5>
	 	                          
	 	                          </div>
	 	                       </div>
	 	                       <div class="col-md-7" style="height:690px">
	 	                       		<!-- chart -->
	 	                       		<h2 style="text-align:center;">${house.dong} 주택가격 분포</h2>
	 						    	<div class="card-body" style="margin-top:20px;margin-left:130px;width:300px;height:300px;">
	 				                	<canvas id="chDonut3" style="width:150px;height:150px;"></canvas>
	 				            	</div>
	 				            	<!--  -->
	 				            	<hr style="margin-top:10px;margin-bottom: 15px;">
	 				            	<h3>로드뷰</h3>
	 				            	<div class="map_wrap" style="width: 500px;height: 300px;margin: 20px 30px;">
	 				            		<div id="myLoadView" style="width:100%;height:100%;">
	 				            			
	 				            		</div>
	 				            	</div>
	 	                       </div>
	 	                    </div>
	 	                 </div>
	 	              `;
	            	  
	              }
	              
                   $('.modal').append(content);
                   $('.modal').modal();
                   
                   
                   

					var donutOptions = {
						  cutoutPercentage: 85, 
						  legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
						};
				
					var totalCnt = under3+under7+under15+over15; 
					// donut 3
					var chDonutData3 = {
					    labels: [dealAmountRatio20+'억 미만',dealAmountRatio20+' - '+dealAmountRatio50+'억', dealAmountRatio50+' - '+dealAmountRatio80+'억',dealAmountRatio80+'억 이상'],
					    datasets: [
					      {
					        backgroundColor: ['#007bff','#28a745','#dc3545',,'#6c757d'],
					        borderWidth: 0,
					        data: [under3/totalCnt,under7/totalCnt,under15/totalCnt,over15/totalCnt]
					      }
					    ]
					};
					var chDonut3 = document.getElementById("chDonut3");
					if (chDonut3) {
					  new Chart(chDonut3, {
					      type: 'doughnut',
					      data: chDonutData3,
					      options: donutOptions
					  });
					}
					
					//로드뷰 생성하기
					var roadviewContainer = document.getElementById('myLoadView'); //로드뷰를 표시할 div
					var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
					var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

					var position = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
					roadviewClient.getNearestPanoId(position, 50, function(panoId) {
					    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
					});
                   
               });
               
               house_markers.push(marker);
                } 
            });    
         });
         
         setTimeout(function() {
            console.log('fuckyou '+house_markers.length);
            makeMarkersFunc(house_markers);
         }, 2000);


}
function calRatio(data) {
			let max=0;
			let min=200000;
			data.forEach(function (house) {
		          if(Number(house.dealAmount.replace(',', '')) > max)
		          	 max=Number(house.dealAmount.replace(',', ''));
		          if(Number(house.dealAmount.replace(',', '')) < min) 
		          	min=Number(house.dealAmount.replace(',', ''));
	          
	          
	    	});
    	
    	let num20=min+(max-min)*0.2;
    	let num50=min+(max-min)*0.5;
    	let num80=min+(max-min)*0.8;

        data.forEach(function (house) {
          if (Number(house.dealAmount.replace(',', '')) < num20) ++under3;
          else if (Number(house.dealAmount.replace(',', '')) < num50) ++under7;
          else if (Number(house.dealAmount.replace(',', '')) < num80) ++under15;
          else ++over15;
    	});
    	
    	dealAmountRatio20 = (num20/10000).toFixed(1);
    	dealAmountRatio50 = (num50/10000).toFixed(1);
    	dealAmountRatio80 = (num80/10000).toFixed(1);
  }
 

function moveMapCenter(data){
   
   map.setCenter(new kakao.maps.LatLng(data.loc.lat, data.loc.lng));
	calRatio(data.house);
	console.log('여기여기여ㅣ ',under3,' ', under7)
   makeHouseMarkers(data,function(house_markers){
       console.log('마커다 임마');
      console.log('house_markers.length:'+house_markers.length);
      
      for (let i = 0; i < house_markers.length; i++) {
           house_markers[i].setMap(map);
       } 
   });
   
   
   
   if(data.house.length==0){
         
         
         // 마커가 표시될 위치입니다 
      var markerPosition  = new kakao.maps.LatLng(data.loc.lat, data.loc.lng); 
      
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
         map:map,
          position: markerPosition
      });
         
      alert(`해당 위치에는 거래 정보가 없습니다:(`);
   }
   
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function house_removeMarker() {
    for ( var i = 0; i < house_markers.length; i++ ) {
        house_markers[i].setMap(null);
    }   
    house_markers = [];
}


function setMarkers(map) {
    for (var i = 0; i < house_markers.length; i++) {
        house_markers[i].setMap(map);
    }            
}
$("#dong-filter-inputBtn").click(()=>{
   house_removeMarker();
     accessControllerByDong($("#dong-filter-input").val());
     
});


function accessControllerByDong(param_dong){
   
   $.ajax({
       type:"GET",
        url: "http://localhost:8887/carrotmap/mainmap/house",
        data:{dong:param_dong},
        datatype : "application/json",
        success: (data)=>{
           var data = JSON.parse(data);
           console.log(data);
           makeHouseList(data.house);
           moveMapCenter(data);
        },
        error:(err)=>{
           
        },
     })
   
}



  $(document).ready(()=>{
     
     // 현재 위치 얻어오기
     // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
   if (navigator.geolocation) {
       
        // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new daum.maps.services.Geocoder();
       
       // GeoLocation을 이용해서 접속 위치를 얻어옵니다
       navigator.geolocation.getCurrentPosition(function(position) {
           
           var lat = position.coords.latitude; // 위도
           var lng = position.coords.longitude; // 경도
           
           var dong  = '누구동';
          
          var getDongByLngLat = function(result, status) {
             if (status === kakao.maps.services.Status.OK) {
         
                 console.log('지역 명칭 : ' + result[0].address_name);
                 dong = result[0].address_name.split(' ')[2];
                 console.log(dong);
                 console.log('행정구역 코드 : ' + result[0].code);
             }
         };
         
         geocoder.coord2RegionCode(lng,lat, getDongByLngLat);
         
         setTimeout(function() {
           accessControllerByDong(dong);
         }, 100);
           
        });
     }
     
});








