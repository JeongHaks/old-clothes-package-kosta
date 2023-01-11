<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>지도</title>
<link href="<c:url value="/static/css/map.css"/>" rel='stylesheet'/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186ec7bfee52595efa89ccde838d9dbc&libraries=services"></script>
 <%--
 port = 8088 => 6c505216c8faffd1bf7690ddd222d68e
 port = 8090 => 2c14568201306da6e8ef52d47a10b1dc
 port = 9090 => 3c4f67ffd89ba5324a466e5a4f4bd0f5 
 --%>
<style>
.contents>#offlineview>h2 {
    padding-bottom: 30px;
    font-size: 34px;
    line-height: 1;
    color: #020000;
}
.contents {
    width: 74%;
    max-width: 1400px;
    padding: 0 60px 0 30px;
    margin: 0 auto;
    font-size: 15px;
    line-height: 10px;
    position: relative;
    box-sizing: border-box;
}

.contents {
	padding-bottom: 80px;
}
.contents>#offlineview {
    padding-top: 166px;
}
#section {
    width: 100%;
    position: relative;
}
#selectbox {
    margin: 0;
    padding: 0;
}
.shop {
    width: 100%;
    padding: 30px 0;
    border: 1px solid #9e9e9e;
    border-top: 2px solid #17191f;
    text-align: center;
}
.select {
    display: inline-block;
    vertical-align: top;
    position: relative;
}
.select>#sido {
    width: 100%;
    height:50px;
}
.select>#sigugun {
    width: 100%;
    height:50px;
}
.shopSchList {
    width: 100%;
    margin-top: 24px;
    padding-left: 437px;
    overflow: hidden;
    box-sizing: border-box;
    position: relative;
}
.shopSchList>#map {
    height: 528px;
    border: 1px solid #f1ede2;
    overflow: hidden;
    position: relative;
}
.shopSchList>#b {
    width: 421px;
    height: 528px;
    overflow: hidden;
    overflow-y: auto;
    position: absolute;
    left: 0;
    top: 0;
    margin-top:0px;
    border: 1px solid #ddd;
}
.shopSchList>#b>li {
    width: 107%;
    position: relative;
    left: -31px;
    padding-left: 22px;
    padding-top: 13px;
    padding-bottom: 18px;
    border-bottom: 1px solid #ddd;
}



.shopSchList>#b>li>a {
    width: 100%;
    padding-right: 30px;
    /* border-bottom: 1px solid #ddd; */
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
.shopSchList>#b>li>a> em {
    font-style: normal;
}
/* h1, h2, h4, h5, h6, address, caption, cite, code, dfn, em, th, var {
    font-size: 100%;
    font-weight: normal;
}
h3{
	font-size: 1rem;
} */
.shop>.select {
    left: 6%;
    margin: 0px 24px;
}
#header {
    width: 100%;
    position: relative;
}

.shopSchList>#b>li>a>.store_item {
    width: 100%;
    height: 100px;
    padding: 8px 85px 0 15px;
    font-size: 14px;
    line-height: 20px;
    color: #666;
    letter-spacing: -1px;
    display: table-cell;
    vertical-align: middle;
    box-sizing: border-box;
    display: block;
}
 .listdnames:hover{
	 background-color:skyblue;
	cursor: pointer;
}
 .dnames:hover{
 	 cursor:pointer;
	 background-color:skyblue;
}
#donationcontainer {
	margin-bottom: 25%;
}

label {
	font-size:1rem;
}
input[type=radio] {
    border: 0px;
    width: 50px;
    height: 1em;
}


#indexlist{
	border:1px solid black;
}

.radiobtn{
	position: relative;
    width: 17%;
    top: 350px;
    left: 15%;   
    z-index: 50;
}

#onlineview{
	position: relative;
    width: 1100px;
    top: 145px;
    margin: 0 auto;
}
#onlineview a {
	display: block;
	margin-left: auto;
    width: 100px;
}
.hrr{
	margin: 1rem 0;
    color: inherit;
    border: 0;
    border-top: 2px solid;
    opacity: .25;
    position: relative;
}

.dimg{
	position: relative;
}

.names{
	position: relative;
    color: green;
    width: 130%;
}

.addressh4{
	position: relative;
    width: 121%;
}

.phoneh4{
	position: relative;
}
.storebtn{
	background-color: #400000;
    width: 100px;
    height: 37px;
    color: #ffffff;
    position: relative;
    /* top: 760px; */
}

.storybtn{
    background-color: #400000;
    position: relative;
    width: 100px;
    height: 37px;
    color: #ffffff;
}

.goodbtn{
    position: relative;
    background-color: #400000;
    width: 100px;
    color: #ffffff;
}
.dnames h3{
	position: relative;
    left: 3.6%;
    top: 12px;
	color: var(--p-color);
	font-weight: bold;
	font-size: 15.5px;
}
.info{

	width: 100%;
    padding: 2px;
    position: relative;
    top: 5px;
    box-sizing: content-box;
}

#listmove{
	width: 139%;
    font-size: 14px;
    position: relative;
    box-sizing: content-box;
    top: -3px;
}
.refresh img{
	
}
#refreshimg {
	width: 20px;
	margin: 0.65em 1em 0 -8em;
	
}
</style>

</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	
	<div id="donationcontainer">
		<div class="radiobtn">
			<div class="form-radio" style="text-align:left; margin-left:29%; margin-top:-100px;">
		        <input type="radio" name="donation_level" value="online" id="online" checked="checked" />
		        <label for="person" style="width: 45px;">온라인</label>
				&nbsp; &nbsp;
		        <input type="radio" name="donation_level" value="offline" id="offline" />
		        <label for="business">오프라인</label>
			</div>
		</div>
		<br>		
		<br>
	<%--오프라인 위치 안내 --%>
		<div class="contents">
			<div id="offlineview">
			<h2 id="donationlist">기부업체 안내</h2>
				<div id="section">
					<div id="selectbox" style="display:flex;">
						<div class="shop">		
							<span class="refresh">								
								<a onClick="history.go(0)" style="cursor: pointer;"><img id="refreshimg" src="/static/image/refresh.png"></a>											
							</span>								
							<div class="select" style="width: 156px;">
								<select id="sido"><option value="">선택</option></select>
							</div>
							<div class="select" style="width: 156px;">
								<select id="sigugun"><option value="">선택</option></select>
							</div>
							<!-- <div class="select" style="margin-left:340px; top:-39px;">
								<select id="dong"><option value="">선택</option></select>
							</div>  -->
						</div>
					</div>
					<%-- 지도를 표시할 div 입니다 --%>
					<div>
						<%-- 텍스트: <span id="dongName"></span><br/>--%>
						<input type="hidden" id="dongName" name="dongName" size="25"> <%--도로명 주소로 표시됨[선택된 값말고] --%>
						<!-- <input type="button" id="searchBtn" value="검색"> --> 
			
					</div>
					<div class="shopSchList">
						<ul id="b">
							<c:forEach var="donation" items="${donation}">
                        		<input type="hidden" class="allname" name="allname" id="allname" value="${donation.dname}">
                        		<input type="hidden" class="alladdress" name="alladdress" id="alladdress" value="${donation.daddress}">
                        		<input type="hidden" class="allphone" name="totalphone" id="totalphone" value="${donation.dphone}">
                        		<input type="hidden" class="lngx" name="lngx" id="lngx" value="${donation.lngx }">      
                        		<input type="hidden" class="laty" name="laty" id="laty" value="${donation.laty }">                        		
                           			<li class="dnames"id="dnames"><h3><strong>기부 업체명 : ${donation.dname }</strong></h3><br>
                           			&nbsp;&nbsp;&nbsp;&nbsp;주소 : ${donation.daddress }<br><br>
                           			&nbsp;&nbsp;&nbsp; 전화 번호 : ${donation.dphone }</li>
								 
                     		</c:forEach>
							
						
						
						</ul>
						<div id="map"></div>
					</div>
				</div>						
			</div>			
		</div>	
		<%--온라인 사이트 안내 --%>
		<div id="onlineview">
			<h1 id=donationsite>기부사이트 안내</h1>			
			<c:forEach var="online" items="${donation }">	
				<c:if test="${online.dname eq '굿윌스토어 굿윌본부' || online.dname eq '아름다운 가게 서울본부' || online.dname eq '숲스토리 의정부본점'}">			
					<hr class="hrr" width="1000px;">									
					<div class="leftimg"><img class="dimg" src="/static/image/${online.dfile }" alt="굿윌 본부점"></div>
					<div class="rightcontent"><br>
						<h3 class="names">[업체명 : ${online.dname }]</h3>
						<h4 class="addressh4">주소 : ${online.daddress }  </h4>
						<h4 class="phoneh4">전화 번호 : ${online.dphone }</h4>						
					</div>	
				</c:if>
				<c:if test="${online.dname eq '굿윌스토어 굿윌본부'}"><a href="https://www.goodwillstore.org/donation/application.php" target="_blank"><button style="cursor:pointer;" class="goodbtn">신청서 작성</button></a></c:if>		
				<c:if test="${online.dname eq '아름다운 가게 서울본부'}"><a href="https://www.beautifulstore.org/donation" target="_blank"><button style="cursor:pointer;" class="storebtn">신청서 작성</button></a></c:if>				
				<c:if test="${online.dname eq '숲스토리 의정부본점'}"><a href="https://www.soopstory.net/main/html.php?htmid=proc/go_donate.html" target="_blank"><button style="cursor:pointer;" class="storybtn">신청서 작성</button></a></c:if>						
			</c:forEach>	
			<c:if test="${empty donation}">		
				<a href="https://www.beautifulstore.org/donation" target="_blank"><button style="cursor:pointer;" class="storebtn">신청서 작성</button></a>
				<a href="https://www.soopstory.net/main/html.php?htmid=proc/go_donate.html" target="_blank"><button style="cursor:pointer;" class="storybtn">신청서 작성</button></a>
				<a href="https://www.goodwillstore.org/donation/application.php" target="_blank"><button style="cursor:pointer;" class="goodbtn">신청서 작성</button></a>
			</c:if>				
		</div>
	</div>	
    <div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>	
	<script>	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.3732436, 129.147811), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };		
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);     
	var markers1 = [];//마커 저장할 배열
	var info1 = [];//인포윈도우 저장할 배열

	  //주소 리스트를 받을 배열
    var addressArray = [];
    var wishList = $('.alladdress'); //주소를 리스트에 담아온다.
	console.log("wishList  : " + wishList.length);
	for(var i=0; i< wishList.length; i++){ //길에 맞게 groupAddress에 담는다 순서대로
	   addressArray.push(
            {'groupAddress' : $("input[name=alladdress]").eq(i).val(), //주소
            'lngx' : $("input[name=lngx]").eq(i).val(), //위도
            'laty' : $("input[name=laty]").eq(i).val(), //경도
            'name' : $("input[name=allname]").eq(i).val(),//이름
            'phone' : $("input[name=totalphone]").eq(i).val()//전화 번호
       });  
	}
	
	//비워져있는 목록에 기본 문구
	$(document).ready(function(){		
		console.log("adddresss : " + addressArray.length);		
		for(var i =0; i<addressArray.length; i++){
			 var alladdress = addressArray[i].groupAddress; 
	         var alllngx = addressArray[i].lngx;
	         var alllaty = addressArray[i].laty;
	         var allname = addressArray[i].name;
	         var allphone = addressArray[i].phone;
	         var dnames = document.querySelectorAll("#dnames")[i].innerText;
	         console.log("alladdress : " + dnames);
	         
	         getmultiAddr(alllaty,alllngx); //좌표를 함수에 전달
	         function getmultiAddr(alllaty,allngx){
	             var coord1 = new kakao.maps.LatLng(alllaty, alllngx); //좌표를 담아준다.
	             var inputcontent = '<div class="wrap">' +
	              '<div class="info"  style="width:100%; padding:2px;box-sizing:content-box;">' +
	                '<div class="title" style="margin-bottom:10px;font-weight: var(--font-weight-bold);">' + 
	                        allname +                        
	                        '</div><br>' +
	                   '<div class="body" style="margin-bottom:10px;">' +                        
	                      '<div class="desc" style="margin-bottom:10px;">'+
	                          '<div class="ellipsis">' +'주소 :'+ alladdress +'</div><br>' +                          
	                          '<div class="phone ellipsis">'+'전화 번호 :' + allphone  +'</div>' +
	                       '<div style="margin-bottom:10px;"><br><a href="https://map.kakao.com/link/to/'+alladdress+','+alllaty+','+alllngx+'"style="color:blue" target="_blank">길찾기</a></div>'+
	                       '</div>' +
	                   '</div>' +
	                   '</div>' +
	               '</div>';
	             var contentt11 = '<div style="width:100%; padding:5px;">'+inputcontent+'</div>';
	             var iwRemoveable = true; 
	           //이미지 마커 
	             var imageSrc1 = "static/image/icons8-marker-100.png",
	             imageSize1 = new kakao.maps.Size(40,44),
	             imageOption1 = {offset: new kakao.maps.Point(20,44)};
	             var markerImage1 = new kakao.maps.MarkerImage(imageSrc1,imageSize1,imageOption1);

				//마커 표시	             
	            var marker1 = new kakao.maps.Marker({ 	  
	            	 map : map,
	                 image: markerImage1,
	                 clickable: true,
	                 position : coord1
	              });
	             marker1.setMap(map);
	             markers1.push(marker1); 
	             //정보를 담아서 보여준다.    
	             var infowindow = new kakao.maps.InfoWindow({
	                   content : contentt11,
	                   removable : iwRemoveable
	             });
	             info1.push(infowindow);
	             
	           	   //인포윈도우 열리는 function
			        function displayInfowindow1(marker1) {
					    infowindow.open(map, marker1);
					}
			      //마우스 오버 시 인포윈도우 오픈 + 위치 이동
			        kakao.maps.event.addListener(marker1, 'mouseover', function() {
			    		map.panTo(marker1.getPosition());
	              		displayInfowindow1(marker1);
	              	});
			        /* //마우스 아웃 시 인포윈도우 클로즈
			       kakao.maps.event.addListener(marker1, 'mouseout', function() {
			        	infowindow.close();
			        }); */
	             //mouseenter 와 mouseover는 비슷한 유형의 이벤트.마우스 올릴 때 
	               document.querySelectorAll("#dnames")[i].addEventListener('click', (event) =>{	            	  
	                  this.map.panTo(marker1.getPosition());    
	                  infowindow.open(map,marker1);
	               });
	             
	              //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
	               document.querySelectorAll("#dnames")[i].addEventListener('mouseout', (event) =>{	                     
	                  infowindow.close();
	               });
	         }//getmultiAddr닫기
	
		}//for문 닫기		
		
	});
	//마커 삭제
	function replay(){
		console.log("호출된다");
		for(var i = 0; i < markers1.length; i++){
			markers1[i].setMap(null);		
		}
	}
	
		
	

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
	
	var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성
	let sido;
	let sigugun;
	var markers = [];//마커 저장할 배열
	var markers2 = [];//마커 저장할 배열	
	var info = [];//인포윈도우 저장할 배열
	var info2 = [];//인포윈도우 저장할 배열
	$(document).on("change","#sigugun",function(){
			replay();
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
				url: 'donationlist',
				dataType: 'json',
				data: JSON.stringify({
					"sido" : sido,
					"sigugun" : sigugun				
				}),
			contentType: "application/json",		
			<%--들어온 값을 지도 마커에 표시!--%>
			success: function(data){
				console.log("datalength:"+data.length);
				$('#b').empty(); //리스트 나타나는 곳에 기존 데이터 있을 수 있으니 비우기
				setMarkers2(null); //기존에 있는 마커 있으면 초기화
				setInfo2(null); //기존에 있는 인포윈도우 초기화
				var dli = "";
				if(data.length==0){
					dli += '<li><a><span class="store_item"><h3 style="text-align: center;font-size: 19px;font-weight: 700;">선택된 지역엔 기부업체가 없습니다.</h3></span></a></li><br>';
				}
				data.forEach(function(data,i){
					
				console.log("data : " + data.length);
				console.log("i : " + i);
				console.log("i lenght : " + i.length);
				var ddno = data.dno;
				console.log("dno : " + ddno);
				console.log("찍히나 : " + data.daddress);
				
				dli += '<li class="listdnames" id="listmove" style="cursor:pointer;" ><br>';
				dli += '<span id="bnames"><strong>기부업체명: '+data.dname +'</strong><br>';	
				dli += '<br>주소 :'+ data.daddress +'<br>';                      
                dli += '<br>전화 번호 :' + data.dphone  +'<br>';						
				dli += '</span></li><br>&nbsp&nbsp';				
				
				
					
				var nonedata = data.daddress;
				console.log("nonedata" +nonedata);
				var donationaddress = data.daddress;
				var donationname = data.dname;
				var donationphone = data.dphone;
				var lngx = data.lngx;
				var laty = data.laty;
				var geocoder = new kakao.maps.services.Geocoder();
				//리스트에 있는 위치들은 별도 마커로 표기
				var imageSrc = "static/image/icons8-marker-100.png",
					imageSize = new kakao.maps.Size(40,44),
					imageOption = {offset: new kakao.maps.Point(20,44)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
				geocoder.addressSearch(donationaddress, function(result, status){
					if(status == kakao.maps.services.Status.OK){
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
				        
				        // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				        var iwContent = '<div style="width:100%; padding:3px;box-sizing:content-box;">&nbsp&nbsp' +
				        				'<div style="margin-bottom:10px;font-weight: var(--font-weight-bold);">'+ "주소 :  "+ donationaddress + '</div><br>' +
				        				'<div style="margin-bottom:10px;">'+ "업체명 :  "+ donationname + '</div><br>' + 
				        				'<div style="margin-bottom:10px;">'+ "전화 번호 :  "+ donationphone + '</div>' + 
				        				'<div style="margin-bottom:10px;"><br><a href="https://map.kakao.com/link/to/'+donationaddress+','+laty+','+lngx+'"style="color:blue" target="_blank">길찾기</a></div>'+
				        				'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
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
		              	});
					  	//마우스 아웃 시 인포윈도우 클로즈
		             /*  	kakao.maps.event.addListener(marker2, 'mouseout', function() {
		              		infowindow2.close();
		              	}); */
		            	//mouseenter 와 mouseover는 비슷한 유형의 이벤트.마우스 올릴 때 
		            	document.querySelectorAll("#listmove")[i].addEventListener('click', (event) =>{
		            		this.map.panTo(marker2.getPosition());	 
		            		infowindow2.open(map,marker2);
		           		});
		            
			            //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
			            document.querySelectorAll("#listmove")[i].addEventListener('mouseout', (event) =>{
			            	infowindow2.close();
			            });	
					}
				})
				});
			dli += '<br>';
			dli += "</div>";
			dli += "</div>";			
			$('#b').append(dli);
			},
			error:function(){
				alert("조건 전송 오류");
			}			
		});
			
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
						var contentfinal = '<div style="width:100%; padding:5px;">'+contentadd+'</div>';
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
			function setMarkers1(map) {
			    for (var i = 0; i < markers1.length; i++) {
			        markers1[i]?.setMap(null);			        
			    }   
			    
			}
			//인포윈도우 표시하거나 삭제하는 함수
			function setInfo1(map) {
			    for (var i = 0; i < info1.length; i++) {
			        info1[i]?.setMap(null);			        
			    }            
			}
	</script>
	
	
	
<%--js 불러와서 사용하기. --%>	
	<script src="<c:url value='/static/js/info/sigun.js'/>"></script>
	<script src="<c:url value='/static/js/info/hangjungdong.js'/>"></script>	
	<script src="<c:url value='/static/js/info/radiochangeview.js'/>"></script>
</body>
</html>