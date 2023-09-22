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
    <title> 자유게시판 </title>
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
                <a href="${path}/board/list.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 자유게시판 목록 </span>
                </a>
            </li>
            <li>
                <a href="${path}/board/detail.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-circle-info"></i>
                        </span>
                    <span> 자유게시판 상세보기 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            자유게시판 상세보기
        </p>
        <p class="subtitle has-text-centered has-text-white">
            자유롭게 나누는 공간, 다양한 주제로 소통하세요
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="buttons is-right">
            <a href="${path}/board/list.do?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="button"> 목록 </a>
            <c:if test="${(sid eq 'admin') or (sid eq detail.nickname)}">
                <a href="${path}/board/edit.do?seq=${detail.seq}" class="button"> 수정 </a>
                <a href="${path}/board/delete.do?seq=${detail.seq}" class="button"> 삭제 </a>
            </c:if>
        </div>
        <div class="columns">
            <div class="column is-one-quarter">
                <p> 카테고리 </p>
                <input type="text" value="${detail.cateName}" class="input" readonly>
            </div>
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
    <c:if test="${sid ne null}">
        <div class="container">
            <form action="${path}/comment/insert.do" method="post" class="columns mt-5">
                <div class="column is-four-fifths">
                    <textarea name="content" id="content" class="textarea has-fixed-size" maxlength="990" cols="30" rows="2" placeholder="댓글을 달아주세요 :)"></textarea>
                </div>
                <div class="column">
                    <input type="hidden" id="seq" name="seq" value="${detail.seq}">
                    <input type="hidden" id="page" name="page" value="${curPage}">
                    <c:if test="${!empty cate}">
                        <input type="hidden" id="cate" name="cate" value="${cate}">
                    </c:if>
                    <c:if test="${!empty keyword}">
                        <input type="hidden" id="type" name="type" value="${type}">
                        <input type="hidden" id="keyword" name="keyword" value="${keyword}">
                    </c:if>
                    <input type="submit" class="button is-fullwidth btn-primary" style="height:72px" value="전송">
                </div>
            </form>
        </div>
    </c:if>

    <div class="container">
        <c:forEach var="comment" items="${commentList}">
            <c:if test="${(sid eq 'admin') or (sid eq comment.nickname)}">
                <div class="buttons is-right mt-5" style="margin-bottom:-10px">
                    <a href="${path}/comment/delete.do?comNo=${comment.comNo}&seq=${detail.seq}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="button is-small"> 삭제 </a>
                </div>
            </c:if>
            <div class="columns">
                <div class="column pb-0">
                    <p> ${comment.nickname} </p>
                </div>
                <div class="column pb-0">
                    <p class="has-text-right"> ${comment.resdate} </p>
                </div>
            </div>
            <div class="columns">
                <div class="column pt-0">
                    <textarea class="textarea has-fixed-size" readonly>${comment.content}</textarea>
                </div>
            </div>
        </c:forEach>
        
        <!-- pagination -->
        <nav class="pagination is-rounded is-centered mt-5 mb-6" role="navigation" aria-label="pagination">
            <c:if test="${commentPage > 5}">
                <a href="${path}/board/detail.do?seq=${detail.seq}&page=${curPage}&commentPage=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-previous">Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <a href="${path}/board/detail.do?seq=${detail.seq}&page=${curPage}&commentPage=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-next">Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == commentPage}">
                            <li>
                                <a href="${path}/board/detail.do?seq=${detail.seq}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${path}/board/detail.do?seq=${detail.seq}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
    </div>
</section>

<jsp:include page="../include/ft.jsp"/>

<!-- plugins -->
<script src="${path}/resources/js/masonry.min.js"></script>
<script src="${path}/resources/js/clipboard.min.js"></script>
<script src="${path}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>

</body>
</html>
