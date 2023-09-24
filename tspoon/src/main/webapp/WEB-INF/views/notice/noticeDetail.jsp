<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 공지사항 </title>
    <jsp:include page="../include/head.jsp"></jsp:include>

    <style>
        #contents {
            border: 1px solid #ddd;
            border-radius: 5px;
            min-height: 500px;
            margin: 15px 15px 100px 15px;
        }
    </style>
</head>
<body>
<jsp:include page="../include/hd.jsp"></jsp:include>

<!-- 배너 -->
<section class="hero is-medium"
         style="background-image: url('${path}/resources/images/pageHeader.jpg'); background-size: cover; background-position: top;">
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
                <a href="${path}/notice/list.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 공지사항 목록 </span>
                </a>
            </li>
            <li>
                <a href="${path}/notice/detail.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-circle-info"></i>
                        </span>
                    <span> 공지사항 상세보기 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            공지사항 상세보기
        </p>
        <p class="subtitle has-text-centered has-text-white">
            중요한 정보와 업데이트된 소식을 한눈에 확인하세요
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="buttons is-right">
            <a href="${path}/notice/list.do?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>"
               class="button"> 목록 </a>
            <c:if test="${(sid eq 'admin') or (sid eq detail.nickname)}">
                <a href="${path}/notice/edit.do?seq=${detail.seq}" class="button"> 수정 </a>
                <a href="${path}/notice/delete.do?seq=${detail.seq}" class="button"> 삭제 </a>
            </c:if>
        </div>
        <div class="columns">
            <div class="column">
                <p> 제목 </p>
                <input type="text" value="${detail.title}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <p> 작성자 </p>
                <input type="text" value="${detail.nickname}" class="input" readonly>
            </div>
            <div class="column">
                <p> 작성일 </p>
                <input type="text" value="${detail.regdate}" class="input" readonly>
            </div>
            <div class="column is-one-fifth">
                <p> 조회수 </p>
                <input type="text" value="${detail.visited}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column p-5" id="contents">
                ${detail.content}
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/ft.jsp"/>

<!-- plugins -->
<script src="${path}/resources/js/masonry.min.js"></script>
<script src="${path}/resources/js/clipnotice.min.js"></script>
<script src="${path}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>

</body>
</html>
