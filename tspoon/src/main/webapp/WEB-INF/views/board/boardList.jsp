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
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            자유게시판 목록
        </p>
        <p class="subtitle has-text-centered has-text-white">
            자유롭게 나누는 공간, 다양한 주제로 소통하세요
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="buttons has-addons is-centered mb-5">
            <c:if test="${empty curCategory}">
                <a class="button btn-primary" href="${path}/board/list.do"> 전체 </a>
            </c:if>
            <c:if test="${!empty curCategory}">
                <a class="button" href="${path}/board/list.do"> 전체 </a>
            </c:if>
            <c:forEach var="cate" items="${categories}">
                <c:if test="${cate.cate eq curCategory}">
                    <a class="button btn-primary" href="${path}/board/list.do?cate=${cate.cate}"> ${cate.cateName} </a>
                </c:if>
                <c:if test="${cate.cate ne curCategory}">
                    <a class="button" href="${path}/board/list.do?cate=${cate.cate}"> ${cate.cateName} </a>
                </c:if>
            </c:forEach>
        </div>

        <div class="container">
            <form action="${path}/board/list.do" method="get" class="field has-addons has-addons-right">
                <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="T"> 제목 </option>
                        <option value="C"> 내용 </option>
                        <option value="W"> 작성자 </option>
                    </select>
                </span>
                </p>
                <p class="control">
                    <c:if test="${!empty curCategory}">
                        <input type="hidden" id="cate" name="cate" value="${curCategory}">
                    </c:if>
                    <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                </p>
                <p class="control">
                    <input type="submit" class="button btn-primary" value="검색" />
                </p>
            </form>

            <table class="table is-hoverable is-fullwidth">
                <thead>
                <tr>
                    <th class="has-text-centered" width="100"> # </th>
                    <th class="has-text-centered" width="130"> 카테고리 </th>
                    <th class="has-text-centered"> 제목 </th>
                    <th class="has-text-centered" width="150"> 작성자 </th>
                    <th class="has-text-centered" width="210"> 작성일 </th>
                    <th class="has-text-centered" width="80"> 조회수 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="board" items="${boardList}">
                    <tr onclick="javascript: location.href='${path}/board/detail.do?seq=${board.seq}&page=${curPage}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>'" style="cursor: pointer">
                        <td class="has-text-centered"> ${board.seq} </td>
                        <td class="has-text-centered"> ${board.cateName} </td>
                        <td> ${board.title} </td>
                        <td class="has-text-centered"> ${board.nickname} </td>
                        <td class="has-text-centered"> ${board.regdate} </td>
                        <td class="has-text-centered"> ${board.visited} </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- pagination -->
            <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                <c:if test="${curPage > 5}">
                    <a href="${path}/board/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-previous">Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <a href="${path}/board/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-next">Next page</a>
                </c:if>

                <ul class="pagination-list">
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == curPage}">
                                <li>
                                    <a href="${path}/board/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="${path}/board/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>

            <c:if test="${sid ne null}">
                <div class="buttons is-right">
                    <a href="${path}/board/insert.do" class="button btn-primary"> 글 작성하기 </a>
                </div>
            </c:if>
        </div>
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
