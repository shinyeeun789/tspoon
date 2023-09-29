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
                          <i class="fa-solid fa-building" aria-hidden="true"></i>
                        </span>
                    <span> 소개 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            티스푼 소개
        </p>
        <p class="subtitle has-text-centered has-text-white">
            티스푼에 대해 소개합니다
        </p>
    </div>
</section>

<section class="section">
    <div class="container mb-100">
        <div class="columns">
            <div class="column is-three-quarters">
                <h3 class="mt-5 mb-40"> ABOUT US </h3>
                <h2 class="mb-10"> 티스푼은 학부모들을 위한 </h2>
                <h3 style="font-weight: normal" class="mb-30">  효율적인 소통과 정보 공유를 지원하는 플랫폼입니다. </h3>
                <p> 우리는 학부모들이 자녀의 교육과 관련된 경험과 지식을 나누며, 서로 도움을 주고 받을 수 있는 안전하고 유익한 커뮤니티를 제공합니다.
                    티스푼은 학부모들의 일상을 더 편리하게 만들어주며, 함께 성장하는 가치 있는 커뮤니티를 지향합니다. </p>
            </div>
            <div class="column">
                <figure class="image">
                    <img src="${path}/resources/images/company.jpg" alt="회사소개 이미지" class="is-rounded">
                </figure>
            </div>
        </div>
        <div class="columns has-text-centered pt-4 pb-4 border" style="margin-top: 100px;">
            <div class="column border-right pt-5">
                <i class="fa-solid fa-building fa-flip fa-xl"></i>
                <h4 class="mt-4"> 티스푼 </h4>
                <p> 회사명 </p>
            </div>
            <div class="column border-right pt-5">
                <i class="fa-regular fa-calendar fa-flip fa-xl"></i>
                <h4 class="mt-4"> 2023.9.1 </h4>
                <p> 설립일 </p>
            </div>
            <div class="column border-right pt-5">
                <i class="fa-regular fa-face-smile fa-flip fa-xl"></i>
                <h4 class="mt-4"> 신예은 </h4>
                <p> 대표이사 </p>
            </div>
            <div class="column border-right pt-5">
                <i class="fa-solid fa-users fa-flip fa-xl"></i>
                <h4 class="mt-4"> 400명 </h4>
                <p> 인력현황 </p>
            </div>
        </div>
    </div>
</section>

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
