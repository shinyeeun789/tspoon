<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 티스푼 소개 </title>
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/hd.jsp"></jsp:include>

<!-- 배너 -->
<section class="hero is-medium" style="background-image: url('${path}/resources/images/pageHeader.jpg'); background-size: cover; background-position: top;">
    <nav class="breadcrumb has-dot-separator ml-5 mt-5" aria-label="breadcrumbs">
        <ul>
            <li>
                <a href="${path}/" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fas fa-home" aria-hidden="true"></i>
                        </span>
                    <span> HOME </span>
                </a>
            </li>
            <li>
                <a href="${path}/introduce/company.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-street-view" aria-hidden="true"></i>
                        </span>
                    <span> 오시는 길 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            오시는 길
        </p>
        <p class="subtitle has-text-centered has-text-white">
            티스푼에 대해 소개합니다
        </p>
    </div>
</section>

<section class="section">
    <div class="container mb-100">
        <div class="is-center">
            <div id="map" style="margin: 0px auto; width: 700px; height: 400px; background: white;"></div>
        </div>
        <hr>
        <div style="border: grey; margin-left: 350px;">
            <h4 class="mb-20"> <i class="fa-solid fa-location-dot"></i> 주소 </h4>
            <p class="mb-50"> 서울 금천구 디지털로9길 23 마리오아울렛 2관 11층 <p>
            <h4 class="mb-20"> <i class="fa-solid fa-phone"></i> Tel</h4>
            <p class="mb-50"> 02-123-4567 </p>
            <h4 class="mb-20"> <i class="fa-solid fa-fax"></i> Fax </h4>
            <p class="mb-50"> 02-098-7654 </p>
        </div>
    </div>
</section>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
<script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
<script type="text/javascript">
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.4786713,126.8864968), // 지도의 중심좌표
            level: 2 // 지도의 확대 레벨
        };
    var map = new daum.maps.Map(mapContainer, mapOption);
    // 마커가 표시될 위치입니다
    var markerPosition  = new daum.maps.LatLng(37.4786713,126.8864968);
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        position: markerPosition
    });
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    var iwContent = '<div style="padding:5px;">마리오아울렛 2관<br><a href="" style="color:blue;" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new daum.maps.LatLng(37.4786713,126.8864968); //인포윈도우 표시 위치입니다
    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        position : iwPosition,
        content : iwContent
    });
    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    infowindow.open(map, marker);
</script>

<!-- 푸터 영역 시작 -->
<jsp:include page="../include/ft.jsp"/>
<!-- 푸터 영역 끝 -->

<!-- plugins -->
<script src="${path}/resources/js/masonry.min.js"></script>
<script src="${path}/resources/js/clipnotice.min.js"></script>
<script src="${path}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>
</body>
</html>