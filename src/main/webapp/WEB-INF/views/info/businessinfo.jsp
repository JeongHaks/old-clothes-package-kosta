<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매업체</title>
<link href="<c:url value="/static/css/businessinfos.css"/>" rel='stylesheet'/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186ec7bfee52595efa89ccde838d9dbc&libraries=services"></script>
<link href="<c:url value="/static/css/datepicker.min.css"/>" rel='stylesheet' type="text/css" media="all"/>
<style>
#wrap {
    width: 100%;
    min-width: 1280px;
    position: relative;
    overflow: hidden;
}
#container {
    width: 100%;
    max-width: 1530px;
    padding: 0 60px 0 30px;
    margin: 0 auto;
    font-size: 16px;
    line-height: 12px;
    position: relative;
    box-sizing: border-box;
}

#container {
	padding-bottom: 80px;
}
#container>#contents {
    padding-top: 30px;
}
#container>#contents>h2 {
    padding-bottom: 30px;
    font-size: 34px;
    line-height: 1;
    color: #020000;
}
#section {
    width: 100%;
    position: relative;
}
#selectbox {
    margin: 0;
    padding: 0;
}
.select>#sido {
    width: 100%;
    height:50px;
}
.select>#sigugun {
    width: 100%;
    height:50px;
}
.select {
    display: inline-block;
    vertical-align: top;
    position: relative;
}
.shop>.select {
    margin: 0 15px;
}
.shop {
    width: 100%;
    padding: 30px 0;
    border-right:0px;
    border-left: 0px;
    border-bottom: 1px solid #9e9e9e;
    border-top: 2px solid #17191f;
    border-top: 2px solid #17191f;
    text-align: center;
}
.shopSchList {
    width: 98%;
    margin-top: 23px;
    padding-left: 430px;
    overflow: hidden;
    box-sizing: border-box;
    position: relative;
    margin-left:1%;
}
.shopSchList>.list {
    width: 400px;
    height: 525px;
    overflow: hidden;
    overflow-y: auto;
    position: absolute;
    left: 0;
    top: 9%;
    margin-top:0px;
    border: 1px solid #ddd;
}
.shopSchList>#map {
    height: 528px;
    border: 1px solid #f1ede2;
    overflow: hidden;
    position: relative;
    z-index:0;
}

.shopSchList>.list>li {
   width: 110%;
    position: relative;
    left: -33px;
    border-bottom: 1px solid #ddd;
}
}
.shopSchList>.list>li>span>a {
    width: 100%;
    padding-right: 30px;
    border-bottom: 1px solid #ddd;
    display: table;
    cursor: pointer;
    box-sizing: border-box;
}
ul,li {
    list-style: none outside;
}
a {
    text-decoration: none;
}
.shopSchList>.list>li> em {
    font-style: normal;
}
h1, h2, h3, h4, h5, h6, address, caption, cite, code, dfn, em, th, var {
    font-size: 100%;
    font-weight: normal;
}

.shopSchList>.list>li>.store_item {
    width: 100%;
    height: 140px;
    padding: 23px 85px 0 15px;
    font-size: 14px;
    line-height: 20px;
    color: #666;
    letter-spacing: -1px;
    display: table-cell;
    vertical-align: middle;
    box-sizing: border-box;
    display: block;
}


body, div, ul, li, h1, h2, h3, h4, h5, p{
    margin: 0;
    padding: 0;
}
#heart_img {
	width: 10%;
    position: relative;
    right: -5%;
    top: -0%;
    cursor:pointer;
}
#star{
	position:absolute;
	width:100%;
	overflow:hidden;
	color:#cdcdcd;
}
#star>img{
	margin-right: 2px;
}

#starEnd{
	position:absolute;
	overflow:hidden;
	white-space:nowrap;
}
#starEnd>img{
	margin-right: 2px;	
}
#totalstar{
	position: relative;
    width: 130px;
    top: -21%;
    right: -80%;
    
}
#cate {
	left: -43.8%;
	width:15%;
}
#catelist{
	width:100%;
	height:50px;
}
#btotaladdress{
	position: relative;
    top: 10%;
}
#btotalphone{
	position: relative;
    top: 10%;
}

#applymodal>img{
	width: 40px;
    height: 35px;
}
</style>
<script>
//유효성 검사



</script>
</head>
<body>
<!-- 헌옷 수거 신청 모달창 -->
		<div id="modal" class="modal">
   
		    <div class="modal_content">
		    	<ul>
		    		<li class="item">		    			 
				            
				             <div class="title">
				               <strong>[ 헌옷 수거 신청 ]</strong>
				             <p>※접수가 완료되면 업체가 확인 후 연락드리겠습니다.</p>
				         </div>
				        
				         <div class="allapply">
			         	 	<form class="form" id="form" action="apply" method="POST" onsubmit="return Valids();">
			         	 		<div class="cont">
						              <input type="text" id="aname" name="aname" placeholder="이름">
						              <div class="adre">
						                  <input type="text" id="aaddress" name="aaddress" placeholder="주소(동 까지만 입력)" readonly>
						                  <input type="button" id="aad_bt" name="aad_bt" onclick="findAddr()" value="주소검색">
						              </div>
							              <input type="text" id="aphone" name="aphone" placeholder="(- 제외 (01012341234 )">
							              <input type="text" id="apickup" name="apickup" placeholder="수거 희망 날짜[시간]" readonly>
						              <div class="wei">
						                  <input type="text" id="weight" name="weight" placeholder="옷 무게">
						                  <p>kg</p>
						              	</div>						              	
						              <input type="hidden" id="astatus" name="astatus" value="신청중">
						          </div>	
						          <hr class="hr2">		         	 	
			         	 	<div class="applybtn" id="applybtn">			         	 	  
				              <button type="button" id="modal_close_btn">Close</button>
				              <button type="submit" form="form" id="applycloth">수거신청</button>
				           </div>
				           	  <input type="hidden" id="bno" name="bno" value="">
			         	 	</form>
				         </div>
		    		</li>
		    	</ul>
		    </div>
		    
		    <div class="modal_layer"></div>
		</div>
<div id="wrap">	
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<div id="container">
		<div id="contents">
		<h2>수거 업체 안내</h2>
	<%--시,구,동  --%>
		<div id="section">
			<div id="selectbox">
				<div class="shop">
					<div class="select" style="width: 156px;">
						<select id="sido"><option value="">선택</option></select>
					</div>
					<div class="select" style="width: 156px;">
						<select id="sigugun"><option value="">선택</option></select>
					</div>	
					
					<div class="search-box">
						<%-- 텍스트: <span id="dongName"></span><br/>--%>
						<input type="hidden" id="dongName" name="dongName" size="25" placeholder="Search something.."> <%--도로명 주소로 표시됨[선택된 값말고] --%>
						<!-- <button type="button" id="searchBtn" value="검색"><i class="fas fa-search"></i></button> -->
					</div>
				</div>
			</div>		
			<input type="hidden" class="list" id="list" name="list" value="${list }">			
			<div id="shopSchList" class="shopSchList">
				<div id="cate" class="select">
					<select id="catelist" onchange="catelist()">
						<option value="">선택하세요</option>
						<option value="review">후기 많은순</option>
						<option value="high">높은 평점순</option>
						<option value="low">낮은 평점순</option>
					</select>
					</div>
				<ul id="blist" class="list"></ul>
				<div id="map"></div>				
			</div>
			
			</div>
		</div>
	</div>
	<div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>
</div>
	<script>	
	$(document).ready(function(){
		let requ = '<li><a href="javascript:void(0);"><span class="store_item"><h5 style="height:100px; padding:8%; margin:auto auto;text-align: center; color: cadetblue;">지역을 선택해주세요.</h5><span><a></li>';
		$('#blist').append(requ);
	})
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.3732436, 129.147811), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };		
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성
	//마커 회수용 배열 변수
	var businbno=0;
	var userno=0;
	var markers = [];//마커 저장할 배열
	var markers2 = [];//마커 저장할 배열
	var info = [];//인포윈도우 저장할 배열
	var info2 = [];//인포윈도우 저장할 배열
	//var bdata = [];//판매업체 정보 저장할 배열
	/* var listlist = [];
	var list2 = $('.list');
	for(var i=0;i<list2.length;i++){
		listlist.push({
			'bcheck' : $("input[name=list]").eq(i).val() //			
		});
	} */
	var businlist = "${list}";	
	var	auth = "${authUser}";
	var authsect = "${authUser.sect}";
	//시도 변수 선언
	let sido;
	let sigugun;

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;"> 현재 나의 위치 </div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker3 = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow3 = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    
	  //마우스 오버 시 인포윈도우 오픈 + 위치 이동
	      kakao.maps.event.addListener(marker3, 'click', function() {
	    	map.panTo(marker3.getPosition());
	    	 infowindow3.open(map, marker3);
      });
		  //마우스 아웃 시 인포윈도우 클로즈
      /* kakao.maps.event.addListener(marker3, 'mouseout', function() {
      	infowindow3.close();
      }); */
		  
	    map.setCenter(locPosition);   
	}	
	
	<%--검색 버튼 클릭시 --%>
	$(document).on("change","#sigugun",function(){
	/* $('#searchBtn').click(function(){ */
		sido = $("#sido option:selected").text(); //selectbox에서 sido 선택값
		sigugun = $('#sigugun option:selected').text(); //selectbox에서 sigugun 선택값
		//도 -> 경상남도 => 경남
		if(sido.length ==4){	sido = sido.charAt(0) + sido.charAt(2);	} 
		//경기도 / 제주특별자치도 / 부산광역시 / 서울특별시 => 경기,제주,부산,서울
		if(sido.length ==3 || sido.length==7 || sido.length==5){ 	sido = sido.substr(0,2);	}
		//하나라도 미선택 시 alert창
		if(sido=="선택"||sigugun=="선택"){ 	alert("지역을 전부 설정해주세요"); 		return false;	}				
		//ajax로 selectbox 선택한 값 넘겨서 리스트 받아오기
		 $.ajax({
			type: 'post',
			url: 'businesslist',
			dataType: 'json',
			data: JSON.stringify({
				"sido" : sido,
				"sigugun" : sigugun				
			}),
		contentType: "application/json",		
		<%--들어온 값을 지도 마커에 표시!--%>
		success: function(data){			
			$('#blist').empty(); //리스트 나타나는 곳에 기존 데이터 있을 수 있으니 비우기
			setMarkers2(null); //기존에 있는 마커 있으면 초기화
			setInfo2(null); //기존에 있는 인포윈도우 초기화
			var bli = "";
			if(data.length==0){
				bli += '<li><a><span class="store_item"><h4 style="text-align: center; height:100px; padding:8%; margin:auto auto; color: cadetblue;">선택된 지역에 업체가 없습니다.</h4></span></a></li><br>';
			}
				data.forEach(function(data,i){	
				//리스트 목록 보여주기					
				var bbno = data.bno;				
				bli += '<li class="listdnames" id="listmove" style="cursor:pointer;">' ;
				bli += '<span id="bnames" class="store_item"><a href="/mypage/bmypage/'+data.bno+'/review" target="_blank">' + "<strong>상호명 : "+ data.bname + '</strong></a>';
				if(auth==""){ //둘 다 로그인 안했을 때 
					bli += '<em><img src="/static/image/heart.png" id="heart_img" class="heart_img" alt="'+data.bno+'" title="찜하기"></em>';
				}else if(authsect == 'business'){
					bli += '';
				}else if(authsect == 'users'){	
					if(data.likescheck == 1){								
						bli += '<em><img src="/static/image/redheart.png" id="heart_img" class="heart_img" alt="'+data.bno+'" title="찜하기"></em>';
					}else if(data.likescheck == null){
						bli += '<em><img src="/static/image/heart.png" id="heart_img" class="heart_img" alt="'+data.bno+'" title="찜하기"></em>';
					}else{
						bli += '<em><img src="/static/image/heart.png" id="heart_img" class="heart_img" alt="'+data.bno+'" title="찜하기"></em>';
					}
				}
				if(authsect != 'business'){
					bli += '<button class="buttonapply'+data.bno+'" id="applymodal" data-value="'+data.bno+'"><img class="apply" title="신청서 작성" src="/static/image/apply.png" /></button>'; //신청서 작성 form [modal]	
				}			
				console.log(data.bstar +"별점");
				bli += '<div id="totalstar" class="totalstar">';
				bli += '<div id="star"><img src="/static/image/binstar.png"><img src="/static/image/binstar.png"><img src="/static/image/binstar.png"><img src="/static/image/binstar.png"><img src="/static/image/binstar.png"></div>' // 별점
				bli += '<div id="starEnd" style="width:'+(data.bstar/5)*100+'%;"><img src="/static/image/star.png"><img src="/static/image/star.png"><img src="/static/image/star.png"><img src="/static/image/star.png"><img src="/static/image/star.png"></div>' // 별점
				bli += '</div>';
				bli += '<em id="btotaladdress">' +" 주소 : "  + data.baddress + ' ' + data.bdetailadd + '</em>';
				if(data.bphone != null){
					bli += '<br><em id="btotalphone">' + "전화 번호 : " + data.bphone + '</em>';
				}else{
					bli += '<em id="btotalphone">' + "전화 번호 : 없음"+'</em>';
				}
				
				bli += '<div class="kakaoids" id="kakao-talk-channel-chat-button'+data.bno+'"></div>'; //카카오 버튼
			
				bli += '</span></li>' ;
				
				var businaddress = data.baddress;
				var businname = data.bname;
				var businphone = data.bphone;
				var businbno = data.bno;
				var geocoder = new kakao.maps.services.Geocoder();
				//리스트에 있는 위치들은 별도 마커로 표기
				var imageSrc = "static/image/icons8-marker-100.png",
					imageSize = new kakao.maps.Size(40,44),
					imageOption = {offset: new kakao.maps.Point(20,44)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
				
				//주소를 좌표로 전환
				geocoder.addressSearch(businaddress, function(result, status){
					if (status === kakao.maps.services.Status.OK) {
				        var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker2 = new kakao.maps.Marker({
				            map: map,
				            position: coords2,
				            image: markerImage,
				            clickable: true
				        });
				        marker2.setMap(map);
				        markers2.push(marker2); 
				        var lat = result[0].y;
						var lng = result[0].x;
														
						console.log("업체lat: " + lat);	
						console.log("업체 lng: " + lng);
				     // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				        var iwContent = '<div style="width:100%; padding:5px;box-sizing:content-box;">' +
				        				'<div style="margin-bottom:10px;">상호명 : '+ businname + '</div>' + 
				        				'<div style="margin-bottom:10px;">주소 : '+ businaddress + ' ' + data.bdetailadd +'</div>' +
				        				'<div>전화번호 : '+ businphone + '</div>' +
				        				'<div style="margin-bottom:10px;"><br><a href="https://map.kakao.com/link/to/'+businaddress+','+lat+','+lng+'"style="color:blue" target="_blank">길찾기</a></div>'+
				        				'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				            iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				     // 인포윈도우를 생성합니다
				        var infowindow2 = new kakao.maps.InfoWindow({
				            content : iwContent,
				            removable : iwRemoveable
				        });
				        info2.push(infowindow2);
				        //인포윈도우 열리는 function
				        function displayInfowindow2(marker2) {
						    infowindow2.open(map, marker2);
						}
				      //마우스 오버 시 인포윈도우 오픈 + 위치 이동
				        kakao.maps.event.addListener(marker2, 'mouseover', function() {
				    		map.panTo(marker2.getPosition());
		              	displayInfowindow2(marker2);
				        	setInfo2(null);  
					    	$(".listdnames").removeClass("active");
					    	$(".heart_img").removeClass("overlay");
		              		$(".totalstar").removeClass("overlay");
		              		$(".apply").removeClass("overlay");
		              		$(".kakaoids").removeClass("overlay");
				        	map.panTo(marker2.getPosition());
			              	displayInfowindow2(marker2);
			              	document.querySelectorAll("#listmove")[i].classList.add("active");
			              	document.querySelectorAll("#totalstar")[i].classList.add("overlay");
		            		document.querySelectorAll("#heart_img")[i].classList.add("overlay");
		            		document.querySelectorAll(".apply")[i].classList.add("overlay");
		            		document.querySelectorAll(".kakaoids")[i].classList.add("overlay");
			              	document.querySelectorAll("#listmove")[i].scrollIntoView();
		              	});
					  	/* //마우스 아웃 시 인포윈도우 클로즈
		              	kakao.maps.event.addListener(marker2, 'mouseout', function() {
		              		$(".listdnames").removeClass("active");  
		              		$(".heart_img").removeClass("overlay");
		              		$(".totalstar").removeClass("overlay");
		              		$(".apply").removeClass("overlay");
		              		$(".kakaoids").removeClass("overlay");
		              		infowindow2.close();
		              	}); */
		            	//mouseenter 와 mouseover는 비슷한 유형의 이벤트.마우스 올릴 때 
		            	document.querySelectorAll("#listmove")[i].addEventListener('click', (event) =>{
		            		this.map.panTo(marker2.getPosition());	 
		            		$(".listdnames").removeClass("active");
		            		$(".heart_img").removeClass("overlay");
		              		$(".totalstar").removeClass("overlay");
		              		$(".apply").removeClass("overlay");
		              		$(".kakaoids").removeClass("overlay");
		            		setInfo2(null);
		            		document.querySelectorAll("#listmove")[i].classList.add("active");
		            		document.querySelectorAll("#totalstar")[i].classList.add("overlay");
		            		document.querySelectorAll("#heart_img")[i].classList.add("overlay");
		            		document.querySelectorAll(".apply")[i].classList.add("overlay");
		            		document.querySelectorAll(".kakaoids")[i].classList.add("overlay");
		            		map.setCenter(marker2.getPosition())
		            		infowindow2.open(map,marker2);
		           		});
		            
			            //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
			            document.querySelectorAll("#listmove")[i].addEventListener('mouseout', (event) =>{
			            	infowindow2.close();
			            });	
			            $(document).ready(function(){
							
							if (!Kakao.isInitialized()) {
								// 사용할 앱의 JavaScript 키를 설정해 주세요.
								Kakao.init('6c505216c8faffd1bf7690ddd222d68e');
							};	 
						    
						    // 채널 1:1 채팅 버튼을 생성합니다.
						    if(data.bkakaoid != null){
						    Kakao.Channel.createChatButton({
						      container: '#kakao-talk-channel-chat-button'+data.bno+'',
						      channelPublicId: data.bkakaoid,
						      title: 'consult',
						      size: 'small',
						      color: 'yellow',
						      shape: 'pc',
						      supportMultipleDensities: true,
						    });
						    }
						});
			            //모달 켜기
			            $(".buttonapply"+data.bno+"").click(function(){
			            	var logincheck = "${logincheck}"; //false
			    			if(logincheck == "false") {
			    				alert("로그인 후 이용해주세요.");
			    				location.href="/login";
			    			}else{		            
			            	 document.getElementById("modal").style.display="block";
			            	 var bno = $(".buttonapply"+data.bno+"").data('value');
			            	 document.getElementById("bno").value=bno;
			    			}
			            });
			           
			            
			            	
					}//status 상태
				})//geocoder 
			}); //data.forEach							
			$('#blist').append(bli); //binlist 위치에 받아온 리스트 출력			
			},	
		error: function(){alert("조건 전송 오류");}
		}); //ajax 

		
		geocoder.addressSearch($('#dongName').val(),function(result,status){
			//정상적으로 검색이 되었을 경우
			if(status === kakao.maps.services.Status.OK){
				if(markers != null){
					setMarkers(null);
					markers=[];
				};
				if(info != null){
					setInfo(null);
					info=[];
				};
				var coords = new kakao.maps.LatLng(result[0].y,result[0].x); //좌표추출
				var address = $('input[name=totaladdress]').val();
				//var address1 = document.getElementById('totaladdress').value;
									
				console.log("total address : " +  address);
				//console.log("total address : " +  address1);
				//추출한 좌료를 통해 도로명 주소 추출
				var contentadd = document.getElementById('dongName').value;
				var contentfinal = '<div style="width:100%; padding:5px;box-sizing:content-box;">'+contentadd+'</div>';
				var lat = result[0].y;
				var lng = result[0].x;
				var daddress = $('input[name=totaladdress]').val();								
				console.log("lat: " + lat);	
				console.log("lng: " + lng);
				getAddr(lat,lng);
				function getAddr(lat,lng){
					//주소=>좌표 전환 객체 선언
					var geocoder = new kakao.maps.services.Geocoder();
					var coord = new kakao.maps.LatLng(lat, lng); //x,y값 받아온 걸아 담아서 coord에  담는다.
					var callback = function(result,status){ //결과를  callback에 담는다.
						if(status === kakao.maps.services.Status.OK){ //성공했다면
							//추출한 도로명 주소를 해당 input의 value값으로 적용
							$('#dongName').val();
						}
					}
					geocoder.coord2Address(coord.getLng(),coord.getLat(),callback);
					console.log(result);
					console.log(coord.getLat());
				}
				//결과값으로ㅗ 받은 위치를 마커로 표시
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
				//인포윈도우로 장소에 대한 설명을 표시합니다.
				var infowindow = new kakao.maps.InfoWindow({
					content: contentfinal //검색된 주소 표시
				});
				
				//마커와 정보 검색을 연속으로 하였을 시 전에 했던 검색 결과는 지워지고 새로 검색된 값을 표시.
				markers.push(marker);
				info.push(infowindow);
				
				infowindow.open(map,marker);
				//지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
				map.setCenter(coords);							
			}
			
		});//geocoder 2
	}); //검색버튼
	
	
	 
	//좋아요 간련 함수
	$(function () {		
		$(document).ready(function(){								
		$(document).on("click","img[id='heart_img']",function(e) {
			var logincheck = "${logincheck}"; //false
			var targetElement = e.target;	
			//let bno = businbno;
			let bno = targetElement.getAttribute('alt');			
			console.log(bno + "gnmng");					
			if(logincheck == "false") {
				alert("로그인 후 이용해주세요.");
				location.href="/login";
			}
			$.ajax({
					type: "post",
					url: "/businessinfo/likes",
					data: {bno:bno},
					success: function(data) {
						console.log("좋아요 수 : " + data);
						if(data == 1) {
							targetElement.setAttribute("src", "/static/image/redheart.png");							
						} else {
							targetElement.setAttribute("src", "/static/image/heart.png");							
						}
					}, error: function() {
		                console.log('바보야!');
					}
				})
			});			
		});
	});
	//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i]?.setMap(map);
	    }            
	}
	function setMarkers2(map) {
	    for (var i = 0; i < markers2.length; i++) {
	        markers2[i]?.setMap(map);
	    }            
	}
	//인포윈도우 표시하거나 삭제하는 함수
	function setInfo(map) {
	    for (var i = 0; i < info.length; i++) {
	        info[i]?.setMap(map);
	    }            
	}
	function setInfo2(map) {
	    for (var i = 0; i < info2.length; i++) {
	        info2[i]?.setMap(map);
	    }            
	}		
	
	//카테고리별 리스트 출력
	function catelist(){
		let category = $("#catelist option:selected").val(); //selectbox에서 sido 선택값
		console.log("마지막: " + category);
		 $.ajax({
				type: 'post',
				url: 'categoryb',
				dataType: 'json',
				data: JSON.stringify({
					"sido" : sido,
					"sigugun" : sigugun,			
					"category" : category
				}),
			contentType: "application/json",		
			<%--들어온 값을 지도 마커에 표시!--%>
			success: function(data){			
				$('#blist').empty(); //리스트 나타나는 곳에 기존 데이터 있을 수 있으니 비우기
				setMarkers2(null); //기존에 있는 마커 있으면 초기화
				setInfo2(null); //기존에 있는 인포윈도우 초기화
				var bli = "";
				data.forEach(function(data,i){	
				//리스트 목록 보여주기					
				var bbno = data.bno;				
				bli += '<li class="listdnames" id="listmove">' ;
				bli += '<span id="bnames" class="store_item"><a href="/mypage/bmypage/'+data.bno+'/review" target="_blank">' + "<strong>상호명 : "+ data.bname + '</strong></a>';
				if(auth==""){ //둘 다 로그인 안했을 때 
					bli += '<em><img src="/static/image/heart.png" id="heart_img" class="heart_img" alt="'+data.bno+'" title="찜하기"></em>';
				}else if(authsect == 'business'){
					bli += '';
				}else if(authsect == 'users'){	
					if(data.likescheck == 1){								
						bli += '<em><img src="/static/image/redheart.png" id="heart_img" class="heart_img" alt="'+data.bno+'" title="찜하기"></em>';
					}else if(data.likescheck == null){
						bli += '<em><img src="/static/image/heart.png" id="heart_img" class="heart_img" alt="'+data.bno+'" title="찜하기"></em>';
					}else{
						bli += '<em><img src="/static/image/heart.png" id="heart_img" class="heart_img" alt="'+data.bno+'" title="찜하기"></em>';
					}
				}
				if(authsect != 'business'){
					bli += '<button class="buttonapply'+data.bno+'" id="applymodal" data-value="'+data.bno+'"><img class="apply" title="신청서 작성" src="/static/image/apply.png" /></button>'; //신청서 작성 form [modal]	
				}			
				console.log(data.bstar +"별점");
				bli += '<div id="totalstar" class="totalstar">';
				bli += '<div id="star"><img src="/static/image/binstar.png"><img src="/static/image/binstar.png"><img src="/static/image/binstar.png"><img src="/static/image/binstar.png"><img src="/static/image/binstar.png"></div>' // 별점
				bli += '<div id="starEnd" style="width:'+(data.bstar/5)*100+'%;"><img src="/static/image/star.png"><img src="/static/image/star.png"><img src="/static/image/star.png"><img src="/static/image/star.png"><img src="/static/image/star.png"></div>' // 별점
				bli += '</div>';
				bli += '<em id="btotaladdress">' +" 주소 : "  + data.baddress + ' ' + data.bdetailadd + '</em>';
				if(data.bphone != null){
					bli += '<br><em id="btotalphone">' + "전화 번호 : " + data.bphone + '</em>';
				}else{
					bli += '<em id="btotalphone">' + "전화 번호 : 없음"+'</em>';
				}
				
				bli += '<div class="kakaoids" id="kakao-talk-channel-chat-button'+data.bno+'"></div>'; //카카오 버튼
			
				bli += '</span></li>' ;
					
					
					var businaddress = data.baddress;
					var businname = data.bname;
					var businphone = data.bphone;
					var businbno = data.bno;
					var geocoder = new kakao.maps.services.Geocoder();
					//리스트에 있는 위치들은 별도 마커로 표기
					var imageSrc = "static/image/icons8-marker-100.png",
						imageSize = new kakao.maps.Size(40,44),
						imageOption = {offset: new kakao.maps.Point(20,44)};
					var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
					
					//주소를 좌표로 전환
					geocoder.addressSearch(businaddress, function(result, status){
						if (status === kakao.maps.services.Status.OK) {
					        var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker2 = new kakao.maps.Marker({
					            map: map,
					            position: coords2,
					            image: markerImage,
					            clickable: true
					        });
					        marker2.setMap(map);
					        markers2.push(marker2); 
					            
					        var lat = result[0].y;
							var lng = result[0].x;
															
							console.log("업체lat: " + lat);	
							console.log("업체 lng: " + lng);
					     // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
					        var iwContent = '<div style="width:100%; padding:5px;box-sizing:content-box;">' +
					        				'<div style="margin-bottom:10px;">상호명 : '+ businname + '</div>' + 
					        				'<div style="margin-bottom:10px;">주소 : '+ businaddress + ' ' + data.bdetailadd +'</div>' +
					        				'<div>전화번호 : '+ businphone + '</div>' +
					        				'<div style="margin-bottom:10px;"><br><a href="https://map.kakao.com/link/to/'+businaddress+','+lat+','+lng+'"style="color:blue" target="_blank">길찾기</a></div>'+
					        				'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					            iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
					     // 인포윈도우를 생성합니다
					        var infowindow2 = new kakao.maps.InfoWindow({
					            content : iwContent,
					            removable : iwRemoveable
					        });//    
					        info2.push(infowindow2);
					        //인포윈도우 열리는 function
					        function displayInfowindow2(marker2) {
							    infowindow2.open(map, marker2);
							}
					      //마우스 오버 시 인포윈도우 오픈 + 위치 이동
					        kakao.maps.event.addListener(marker2, 'mouseover', function() {
					    		map.panTo(marker2.getPosition());
			              	displayInfowindow2(marker2);
					        	setInfo2(null);  
						    	$(".listdnames").removeClass("active");
						    	$(".heart_img").removeClass("overlay");
			              		$(".totalstar").removeClass("overlay");
			              		$(".apply").removeClass("overlay");
			              		$(".kakaoids").removeClass("overlay");
					        	map.panTo(marker2.getPosition());
				              	displayInfowindow2(marker2);
				              	document.querySelectorAll("#listmove")[i].classList.add("active");
				              	document.querySelectorAll("#totalstar")[i].classList.add("overlay");
			            		document.querySelectorAll("#heart_img")[i].classList.add("overlay");
			            		document.querySelectorAll(".apply")[i].classList.add("overlay");
			            		document.querySelectorAll(".kakaoids")[i].classList.add("overlay");
				              	document.querySelectorAll("#listmove")[i].scrollIntoView();
			              	});
						  	/* //마우스 아웃 시 인포윈도우 클로즈
			              	kakao.maps.event.addListener(marker2, 'mouseout', function() {
			              		$(".listdnames").removeClass("active"); 
			              		$(".heart_img").removeClass("overlay");
			              		$(".totalstar").removeClass("overlay");
			              		$(".apply").removeClass("overlay");
			              		$(".kakaoids").removeClass("overlay");
			              		infowindow2.close();
			              	}); */
			            	//mouseenter 와 mouseover는 비슷한 유형의 이벤트.마우스 올릴 때 
			            	document.querySelectorAll("#listmove")[i].addEventListener('click', (event) =>{
			            		this.map.panTo(marker2.getPosition());	 
			            		$(".listdnames").removeClass("active");
			            		$(".heart_img").removeClass("overlay");
			              		$(".totalstar").removeClass("overlay");
			              		$(".apply").removeClass("overlay");
			              		$(".kakaoids").removeClass("overlay");
			            		setInfo2(null);
			            		document.querySelectorAll("#listmove")[i].classList.add("active");
			            		document.querySelectorAll("#totalstar")[i].classList.add("overlay");
			            		document.querySelectorAll("#heart_img")[i].classList.add("overlay");
			            		document.querySelectorAll(".apply")[i].classList.add("overlay");
			            		document.querySelectorAll(".kakaoids")[i].classList.add("overlay");
			            		map.setCenter(marker2.getPosition())
			            		infowindow2.open(map,marker2);
			           		});
			            
				            //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
				            document.querySelectorAll("#listmove")[i].addEventListener('mouseout', (event) =>{
				            	infowindow2.close();
				            });	
				            $(document).ready(function(){
								
								if (!Kakao.isInitialized()) {
									// 사용할 앱의 JavaScript 키를 설정해 주세요.
									Kakao.init('186ec7bfee52595efa89ccde838d9dbc');
								};	 
							    
							    // 채널 1:1 채팅 버튼을 생성합니다.
							   if(data.bkakaoid != null){
							    Kakao.Channel.createChatButton({
							      container: '#kakao-talk-channel-chat-button'+data.bno+'',
							      channelPublicId: data.bkakaoid,
							      title: 'consult',
							      size: 'small',
							      color: 'yellow',
							      shape: 'pc',
							      supportMultipleDensities: true,
							    });
							   }
							});
				            //모달 켜기
				            $(".buttonapply"+data.bno+"").click(function(){
				            	 document.getElementById("modal").style.display="block";
				            	 var bno = $(".buttonapply"+data.bno+"").data('value');
				            	 document.getElementById("bno").value=bno;
				            	 
				            });
						}//status 상태
					})//geocoder 
				}); //data.forEach							
				$('#blist').append(bli); //binlist 위치에 받아온 리스트 출력
				console.log(markers2);			
			},	
			error: function(){alert("구,동 검색 먼저해주세요.");}
			});
		}
		 //모달 닫기
		 $("#modal_close_btn").click(function(){
			 document.getElementById("modal").style.display="none";
	     });
		 //날짜 
		  $(function(){
		 $("#apickup").datepicker({
			    language: 'ko',
			    timepicker: true,
			    timeFormat: "hh:ii AA"
			});	
		  });
		  
		//주소 찾기
		  function findAddr(){
		  	new daum.Postcode({
		          oncomplete: function(data) {
		              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		              // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		              var roadAddr = data.roadAddress; // 도로명 주소 변수
		              
		              // 우편번호와 주소 정보를 해당 필드에 넣는다.
		             
		              if(roadAddr !== ''){
		                  document.getElementById("aaddress").value = roadAddr;
		                  
		              } 
		          }
		      }).open();
		  }
		//msg 체크
		var msg ="${msg}";
		if(msg != ""){
			alert(msg);
		}
		
	

	</script>
	
	<%--js 불러오기 --%>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
      integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>    
	<script src="<c:url value='/static/js/info/datepicker.js'/>"></script>
	<script src="<c:url value='/static/js/info/datepicker.ko.js'/>"></script>
	<script src="<c:url value='/static/js/info/sigun.js'/>"></script>
	<script src="<c:url value='/static/js/info/businessinfo.js'/>"></script>
	<script src="<c:url value='/static/js/info/hangjungdong.js'/>"></script>
	<script src="<c:url value='/static/js/info/validations.js'/>"></script>
</body>
</html>