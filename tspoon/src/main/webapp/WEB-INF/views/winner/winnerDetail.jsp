<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <title> 이벤트 </title>
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
                <a href="${path}/winner/list.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 당첨자 목록 </span>
                </a>
            </li>

            <li>
                <a href="${path}/winner/detail.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-circle-info"></i>
                        </span>
                    <span> 게시글 상세보기 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            당첨자 게시글
        </p>
        <p class="subtitle has-text-centered has-text-white">
            흥미로운 이벤트와 특별한 혜택을 만나보세요
        </p>
    </div>
</section>

<!-- 당첨자 목록 영역 시작 -->
<section class="section">
    <div class="container">
        <div class="buttons is-right">
            <a href="${path}/winner/list.do?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="button"> 목록 </a>
            <c:if test="${sid eq 'admin'}">
                <a href="${path}/winner/delete.do?wno=${detail.wno}" class="button"> 삭제 </a>
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
                <input type="text" value="${detail.author}" class="input" readonly>
            </div>
            <div class="column">
                <p> 작성일 </p>
                <input type="text" value="${detail.resdate}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column p-5" id="contents">
                ${detail.content}
            </div>
        </div>
    </div>
</section>

<!-- 푸터 영역 시작 -->
<jsp:include page="../include/ft.jsp"/>
<!-- 푸터 영역 끝 -->

</body>
</html>

</body>
</html>
