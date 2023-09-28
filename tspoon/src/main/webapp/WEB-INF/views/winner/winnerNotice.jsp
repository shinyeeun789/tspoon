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
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            당첨자 목록
        </p>
        <p class="subtitle has-text-centered has-text-white">
            흥미로운 이벤트와 특별한 혜택을 만나보세요
        </p>
    </div>
</section>

<!-- 당첨자 목록 영역 시작 -->
<div class="container">
    <div class="tabs is-centered is-boxed mt-6">
        <ul>
            <li>
                <a href="${path}/event/list.do">
                    <span class="icon is-small"><i class="fa-solid fa-star"></i></span>
                    <span> 이벤트 목록 </span>
                </a>
            </li>
            <li class="is-active">
                <a href="${path}/winner/list.do">
                    <span class="icon is-small"><i class="fa-solid fa-trophy"></i></span>
                    <span> 당첨자 목록 </span>
                </a>
            </li>
        </ul>
    </div>

    <form action="${path}/winner/list.do" method="get" class="field has-addons has-addons-right mt-6">
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
            <input type="submit" class="button btn-primary" value="검색" />
        </p>
    </form>

    <div class="container">
        <table class="table is-fullwidth is-hoverable">
            <thead>
            <tr>
                <th class="has-text-centered" width="80">번호</th>
                <th class="has-text-centered">제목</th>
                <th class="has-text-centered" width="200">작성자</th>
                <th class="has-text-centered" width="200">작성일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="winner" items="${winnerList}">
                <tr onclick="javascript: location.href='${path}/winner/detail.do?wno=${winner.wno}&page=${curPage}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>'" class="has-text-centered" style="cursor: pointer">
                    <td> ${winner.wno} </td>
                    <td> ${winner.title} </td>
                    <td> ${winner.author} </td>
                    <td> ${winner.resdate} </td>
                </tr>
            </c:forEach>
            <c:if test="${empty winnerList}">
                <tr>
                    <td colspan="6" class="has-text-centered"> 아직 당첨자가 추첨되지 않았어요 </td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <!-- pagnation -->
        <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
            <c:if test="${curPage > 5}">
                <a href="${path}/winner/list.do?page=${page.blockStartNum - 1}" class="pagination-previous" >Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <a href="${path}/winner/list.do?page=${page.blockLastNum + 1}" class="pagination-next" >Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == curPage}">
                            <li>
                                <a href="${path}/winner/list.do?page=${i}" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page" >${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${path}/winner/list.do?page=${i}" class="pagination-link" aria-label="Page ${i}" aria-current="page" >${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>

        <!-- 이벤트 관리자만 글쓰기 가능 처리 -->
        <c:if test='${sid eq "admin"}'>
            <div class="buttons is-right">
                <a class="button btn-primary" href="${path }/winner/insert.do"> 글 작성하기 </a>
            </div>
        </c:if>
    </div>
</div>
<!-- 이벤트 영역 끝-->

<!-- 푸터 영역 시작 -->
<jsp:include page="../include/ft.jsp"/>
<!-- 푸터 영역 끝 -->

</body>
</html>