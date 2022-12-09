<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bmypage.css"/>" rel='stylesheet' />

</head>
<body>
	<c:import url='/WEB-INF/views/mypage/mypage.jsp' />
	<div class="my_Tab">
			<ul class="tabs">
				<li class="on"><a href ="#a">신청 목록</a></li>				
				<li><a href ="#b">거래 후기</a></li>
			</ul>			
			<div class="tab_con on">
				<div>
					<c:import url='/WEB-INF/views/mypage/bapplylist.jsp' />
				</div>
			</div>
			<div class="tab_con">
				<div>
					<c:import url='/WEB-INF/views/mypage/breview.jsp' />
				</div>
			</div>
		</div>
<script src="<c:url value='/resources/js/mypage/mypage.js'/>"></script>
</body>
</html>