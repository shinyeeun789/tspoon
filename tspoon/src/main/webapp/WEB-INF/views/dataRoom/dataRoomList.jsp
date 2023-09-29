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
    <title> 자료실 </title>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <c:if test="${!empty msg}">
        <script>
            alert(${msg});
        </script>
    </c:if>
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
                <a href="${path}/dataRoom/list.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 자료실 목록 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            자료실 목록
        </p>
        <p class="subtitle has-text-centered has-text-white">
            원하는 자료를 간편하게 찾아보세요!
        </p>
    </div>
</section>

<section class="pt-6">
    <div class="container" style="min-height: 80vh">
        <form action="${path}/dataRoom/list.do" method="get" class="field has-addons has-addons-right mr-5">
            <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="T"> 제목 </option>
                        <option value="C"> 내용 </option>
                    </select>
                </span>
            </p>
            <p class="control">
                <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
            </p>
            <p class="control">
                <input type="submit" class="button btn-outline-primary" value="검색" />
            </p>
        </form>

        <div class="columns is-multiline p-6">
            <table class="table is-hoverable is-fullwidth">
                <thead>
                <tr>
                    <th class="has-text-centered" width="100">#</th>
                    <th class="has-text-centered"> 제목 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${dataRoomList}">
                    <tr onclick="location.href='${path}/dataRoom/detail.do?no=${item.articleNo}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>'" style="cursor: pointer">
                        <td class="has-text-centered"> ${item.articleNo} </td>
                        <td> ${item.title} </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty dataRoomList}">
                    <tr>
                        <td colspan="2" class="has-text-centered"> 등록된 자료가 없습니다 : ) </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
        <!-- pagination -->
        <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
            <c:if test="${curPage > 5}">
                <a href="${path}/dataRoom/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-previous">Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <a href="${path}/dataRoom/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-next">Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == curPage}">
                            <li>
                                <a href="${path}/dataRoom/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${path}/dataRoom/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
        <c:if test="${sid eq 'admin'}">
            <div class="buttons is-right mr-5">
                <a href="${path}/dataRoom/insert.do" class="btn btn-primary"> 글 작성하기 </a>
            </div>
        </c:if>
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
