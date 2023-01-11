<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>지도</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript" src="<c:url value='/static/js/info/hangjungdong.js'/>"></script>

<style>
#wrap {
    width: 100%;
    min-width: 1280px;
    position: relative;
    overflow: hidden;
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
/*
body, div, ul, li, h1, h2, h3, h4, h5, p{
    margin: 0;
    padding: 0;
}
*/
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
#selectbox {
    margin: 0;
    padding: 0;
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
    width: 370px;
    height: 528px;
    overflow: hidden;
    overflow-y: auto;
    position: absolute;
    left: 0;
    top: 0;
    margin-top:0px;
    border: 1px solid #ddd;
}
.shopSchList>.list>li {
    width: 116%;
    position: relative;
    left:-40px;
}
.shopSchList>.list>li>a {
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
.shopSchList>.list>li>a> em {
    font-style: normal;
}
h1, h2, h3, h4, h5, h6, address, caption, cite, code, dfn, em, th, var {
    font-size: 100%;
    font-weight: normal;
}
.shopSchList>#map {
    height: 528px;
    border: 1px solid #f1ede2;
    overflow: hidden;
    position: relative;
}
#header {
    width: 100%;
    position: relative;
}

.shop>.select {
    margin: 0 15px;
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
.select>#dong {
    width: 100%;
    height:50px;
}
.shopSchList>.list>li>a>.store_item {
    width: 100%;
    height: 100px;
    padding: 9%;
    font-size: 14px;
    line-height: 20px;
    color: #666;
    letter-spacing: -1px;
    display: table-cell;
    vertical-align: middle;
    box-sizing: border-box;
    display: block;
}
/*  .bin:focus{
	 background-color:skyblue;
} */
.active{
	background-color:skyblue;
}

</style>

</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<div id="container">
		<div id="contents">
		<h2>헌옷수거함</h2>
			<div id="section">
				<div id="selectbox" style="display:flex;">
					<div class="shop">
						<div class="select" style="width: 156px;">
						<select id="sido"><option value="">선택</option></select>
						</div>
						<div class="select" style="width: 156px;">
						<select id="sigugun"><option value="">선택</option></select>
						</div>
						<div class="select" style="width: 156px;">
						<select id="dong"><option value="">선택</option></select>
						</div>
					</div>
				</div>
				
				
				<div class="search-box">
					<%-- 텍스트: <span id="dongName"></span><br/>--%>
					<input type="hidden" id="dongName" name="dongName" size="25"> <%--도로명 주소로 표시됨[선택된 값말고] --%>
					<!--<button type="button" id="searchBtn" value="검색"><i class="fas fa-search"></i></button>-->
					
				</div>		
			
			
				<%-- 지도를 표시할 div 입니다 --%>
				<div class="shopSchList">
					<ul class="list"></ul>
					<div id="map"></div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>
</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186ec7bfee52595efa89ccde838d9dbc&libraries=services"></script>
	<script>
		$(document).ready(function(){
			let requ = '<li><a href="javascript:void(0);"><span class="store_item"><h5 style="margin:auto auto;text-align: center; color: cadetblue;">지역을 선택해주세요.</h5><span><a></li>';
			$('.list').append(requ);
		})
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var markers = [];//마커 저장할 배열
		var markers2 = [];//마커 저장할 배열
		var info = [];//인포윈도우 저장할 배열
		var info2 = [];//인포윈도우 저장할 배열
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="width:100%; padding:5px;margin-left:60%;box-sizing:content-box;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
		        	console.log(message);
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
		        iwRemoveable = false;

		    // 인포윈도우를 생성합니다
		    var infowindow3 = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		  //마우스 오버 시 인포윈도우 오픈 + 위치 이동
		      kakao.maps.event.addListener(marker3, 'mouseover', function() {
		    	map.panTo(marker3.getPosition());
		    	 infowindow3.open(map, marker3);
            });
			  //마우스 아웃 시 인포윈도우 클로즈
            kakao.maps.event.addListener(marker3, 'mouseout', function() {
            	infowindow3.close();
            });
		    
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    //infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}    
		
		
		
		
		<%--검색 버튼 클릭시 --%>
			$(document).on("change","#dong",function(){
			var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성
			geocoder.addressSearch($('#dongName').val(),function(result,status){
				//정상적으로 검색이 되었을 경우
				if(status === kakao.maps.services.Status.OK){
					var coords = new kakao.maps.LatLng(result[0].y,result[0].x); //좌표추출
					
					//검색 마커 있으면 마커 지우기
					if(markers!=null){
						setMarkers(null);
						markers=[];
					};
					//인포윈도우 마커 있으면 인포윈도우 지우기
					if(info!=null){
						setInfo(null);
						info=[];
					};
					
					//추출한 좌표를 통해 도로명 주소 추출
					var contentadd = "<div style= 'width:100%; padding:5px; box-sizing:content-box;'>"+document.getElementById('dongName').value+"</div>";
					var lat = result[0].y;
					var lng = result[0].x;
					console.log(geocoder+"geo");
					console.log(contentadd);
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
								$('#dongName').val(result[0].road_address.address_name);
							}
						}
						geocoder.coord2Address(coord.getLng(),coord.getLat(),callback);
					}
					
					//결과값으로ㅗ 받은 위치를 마커로 표시
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});
					marker.setMap(map);//지도에 표시
					markers.push(marker);//마커 정보 배열에 넣기
					//인포윈도우로 장소에 대한 설명을 표시합니다.
					var infowindow = new kakao.maps.InfoWindow({
						content: contentadd //검색된 주소 표시
					});
					info.push(infowindow);//인포 윈도우 배열에 인포 윈도우 넣기
					infowindow.open(map,marker);//인포윈도우 오픈
					//지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
					map.setCenter(coords);
				}
				
			});
		});
		
		<%--검색 버튼 클릭 시 selectbox 데이터 넘기기--%>
		$(function(){
			$('#dong').change(function(){	
				let sido = $("#sido option:selected").text(); //selectbox에서 sido 선택값
				let sigugun = $('#sigugun option:selected').text(); //selectbox에서 sigugun 선택값
				let dong = $('#dong option:selected').text(); //selectbox에서 dong 선택값
				if(sido=="선택"||sigugun=="선택"||dong=="선택"){
					alert("지역을 전부 설정해주세요"); //하나라도 미선택 시 alert창
					return false;
				}
				console.log(sido+"!");
				console.log(sigugun+"!");
				console.log(dong+"!");
				//ajax로 selectbox 선택한 값 넘겨서 리스트 받아오기
				$.ajax({
					type: 'post',
					url: 'csvToBean',
					dataType: 'json',
					data: JSON.stringify({
						"sido" : sido,
						"sigugun" : sigugun,
						"dong" : dong	
					}),
					contentType: "application/json",
					success: function(data){
						$('.list').empty(); //리스트 나타나는 곳에 기존 데이터 있을 수 있으니 비우기
						setMarkers2(null); //기존에 있는 마커 있으면 초기화
						setInfo2(null); //기존에 있는 인포윈도우 초기화
						var bli = "";
						console.log("데이터길이:"+data.length);
						if(data.length==0){
							bli += '<li id="listmove" class="listmove"><a href="javascript:void(0);"><span class="store_item"><h3 style="text-align: center; font-size: 17px; margin-left: 16px; margin-top:7px; color: cadetblue;">선택된 지역에 헌옷수거함 데이터가 없습니다.</h3><br></span></a></li><br>';
						}
						data.forEach(function(item,i){
							bli += "<li id='listmove' class='listmove'><a href='javascript:void(0);' class='bin' data-value='"+item+"' data-value2='"+i+"'><span class='store_item'>"+item+"</span></a></li>";
							var geocoder = new kakao.maps.services.Geocoder();
							//리스트에 있는 위치들은 별도 마커로 표기
							var imageSrc = "static/image/icons8-marker-100.png",
								imageSize = new kakao.maps.Size(40,44),
								imageOption = {offset: new kakao.maps.Point(20,44)};
							var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
							
							
							geocoder.addressSearch(item, function(result, status){
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
							        
							     // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
							        var iwContent = '<div style="width:100%; padding:5px;box-sizing:content-box;">'+item+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							            iwRemoveable = false; // removeable 속성을 true 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
							     // 인포윈도우를 생성합니다
							        var infowindow2 = new kakao.maps.InfoWindow({
							            content : iwContent,
							            removable : iwRemoveable
							        });
							        info2.push(infowindow2);
							        //인포윈도우 열리는 function
							        function displayInfowindow2(marker2, item) {
									    infowindow2.open(map, marker2);
									}
							      //마우스 오버 시 인포윈도우 오픈 + 위치 이동
							      kakao.maps.event.addListener(marker2, 'mouseover', function() {
							    	setInfo2(null);  
							    	$(".listmove").removeClass("active");  
							    	map.panTo(marker2.getPosition());
					              	displayInfowindow2(marker2, item);
					              	document.querySelectorAll("#listmove")[i].classList.add("active");
					              	document.querySelectorAll("#listmove")[i].scrollIntoView();
					              });
								  //마우스 아웃 시 인포윈도우 클로즈
					              kakao.maps.event.addListener(marker2, 'mouseout', function() {
					            	document.querySelectorAll("#listmove")[i].classList.remove("active");
					              	infowindow2.close();
					              });
					            //mouseenter 와 mouseover는 비슷한 유형의 이벤트.마우스 올릴 때 
				            	document.querySelectorAll("#listmove")[i].addEventListener('click', (event) =>{
				            		//this.map.panTo(marker2.getPosition());
				            		$(".listmove").removeClass("active");
				            		setInfo2(null);
				            		document.querySelectorAll("#listmove")[i].classList.add("active");
				            		map.setCenter(marker2.getPosition())
				            		infowindow2.open(map,marker2);
				           		});
				            
					            /* //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
					            document.querySelectorAll("#listmove")[i].addEventListener('click', (event) =>{
					            	infowindow2.close();
					            });	 */
								}
							})
						})
						bli += "</ul>"
						$('.list').append(bli); //binlist 위치에 받아온 리스트 출력
						console.log(markers2);
						
					},
					error: function(){alert("조건 전송 오류");}
				});
			})
		})
		
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
		
		/*
		//a태그에 클릭 시 해당 리스트의 마커 위치로 이동시키는 function
		function listCheck(e){
			data = $(e).attr('data-value');
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch(data, function(result, status){
				if (status === kakao.maps.services.Status.OK) {
			        // 결과값으로 받은 위치를 마커로 표시합니다
				var coords3 = new kakao.maps.LatLng(result[0].y, result[0].x);
				map.setCenter(coords3);
				}
			})	
		}
		*/
		
	</script>
	
<%--js 불러와서 사용하기. --%>	
	<script src="<c:url value='/static/js/info/sigundong.js'/>"></script>
</body>
</html>