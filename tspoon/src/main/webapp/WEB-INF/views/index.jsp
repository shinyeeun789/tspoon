<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 티스푼 </title>
    <jsp:include page="./include/head.jsp"></jsp:include>
    <style>
        .player_btn {
            border: none;
            background-color: #ffffff;
        }

        #progressBar {
            width: 0px;
            height: 10px;
            background-color: #007cf0;
            transition: 1s;
            margin-top: -10px;
        }

        #btn-right {
            display: inline-block;
            float: right;
        }
    </style>
</head>
<body>
<!-- 헤더 영역 시작 -->
<jsp:include page="./include/hd.jsp"></jsp:include>
<!-- 헤더 영역 끝 -->

<!-- 사이드 메뉴 시작 -->
<jsp:include page="./main/sidemenu.jsp"/>
<!-- 사이드 메뉴 끝 -->

<!-- 슬라이드 배너 영역 시작 -->
<jsp:include page="./main/slideBanner.jsp"/>
<!-- 슬라이드 배너 영역 끝 -->

<!-- 서비스 영역 시작 -->
<jsp:include page="./main/section1.jsp"/>
<!-- 서비스 영역 끝 -->

<!-- 공지사항, 이벤트 영역 시작 -->
<jsp:include page="./main/section2.jsp"/>
<!-- 공지사항, 이벤트 영역 끝 -->

<!-- 추천 강의 영역 시작 -->
<jsp:include page="./main/section3.jsp"/>
<!-- 추천 강의 영역 끝 -->

<jsp:include page="./include/ft.jsp"></jsp:include>

<!-- plugins -->
<script src="${path1}/resources/js/masonry.min.js"></script>
<script src="${path1}/resources/js/clipboard.min.js"></script>
<script src="${path1}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path1}/resources/js/script.js"></script>
</body>
</html>