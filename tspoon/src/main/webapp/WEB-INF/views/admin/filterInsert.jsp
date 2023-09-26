<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title> 관리자 </title>
    <jsp:include page="../include/head.jsp"></jsp:include>
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
                <a href="${path}/admin/filterInsert.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-square-plus"></i>
                        </span>
                    <span> 필터링 단어 추가 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            필터링 단어 추가
        </p>
        <p class="subtitle has-text-centered has-text-white">
            안녕하세요, 관리자님
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="columns">
            <div class="column is-3">
                <aside class="menu">
                    <p class="menu-label">
                        General
                    </p>
                    <ul class="menu-list">
                        <li><a href="${path}/admin/dashboard.do">Dashboard</a></li>
                        <li><a href="${path}/admin/memberList.do">Customers</a></li>
                    </ul>
                    <p class="menu-label">
                        Administration
                    </p>
                    <ul class="menu-list">
                        <li><a href="${path}/admin/memberMgmt.do">회원 관리</a></li>
                        <li><a href="${path}/admin/qnaMgmt.do">고객지원 관리</a></li>
                        <li>
                            <a href="${path}/admin/boardMgmt.do">커뮤니티 관리</a>
                            <ul>
                                <li><a href="${path}/admin/filtering.do" class="is-active">필터링 단어 관리</a></li>
                                <li><a href="${path}/admin/boardMgmt.do">규칙 위반 게시물</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${path}/admin/eventMgmt.do">이벤트</a>
                            <ul>
                                <li><a href="${path}/admin/eventMgmt.do">이벤트 관리</a></li>
                                <li><a href="${path}/admin/selectWinner.do">당첨자 추첨</a></li>
                            </ul>
                        </li>
                    </ul>
                </aside>
            </div>
            <div class="column is-9">
                <form action="${path}/admin/filterInsert.do" class="columns is-multiline is-centered" method="post">
                    <div class="column is-10-tablet">
                        <label for="word" class="label"> 필터링할 단어 </label>
                        <div class="columns">
                            <div class="column is-four-fifths">
                                <div class="control">
                                    <input type="text" class="input" id="word" name="word"
                                           placeholder="필터링할 단어를 입력해주세요" maxlength="100" autocomplete="off"
                                           autofocus required>
                                </div>
                            </div>
                            <div class="column">
                                <button type="submit" class="button btn-primary is-fullwidth"> 추가</button>
                            </div>
                        </div>
                    </div>
                </form>
                <table class="table is-hoverable is-fullwidth mt-5">
                    <tr>
                        <th class="has-text-centered"> #</th>
                        <th class="has-text-centered"> 필터링 단어</th>
                        <th class="has-text-centered"> 비고</th>
                    </tr>
                    <c:forEach var="filter" items="${filterList}">
                        <tr>
                            <td class="has-text-centered" width="100"> ${filter.fno} </td>
                            <td> ${filter.word} </td>
                            <td class="has-text-centered" width="100"><a
                                    href="${path}/admin/filterDelete.do?fno=${filter.fno}&page=${curPage}"
                                    class="button has-text-centered is-danger is-small"> 삭제 </a></td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty filterList}">
                        <tr>
                            <td class="has-text-centered" colspan="3"> 필터링할 단어가 등록되지 않았습니다 : )</td>
                        </tr>
                    </c:if>
                </table>

                <!-- pagination -->
                <nav class="pagination is-rounded is-centered mb-6" role="navigation"
                     aria-label="pagination">
                    <c:if test="${curPage > 5}">
                        <a href="${path}/admin/filterInsert.do?page=${page.blockStartNum - 1}"
                           class="pagination-previous">Previous</a>
                    </c:if>
                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                        <a href="${path}/admin/filterInsert.do?page=${page.blockLastNum + 1}"
                           class="pagination-next">Next page</a>
                    </c:if>

                    <ul class="pagination-list">
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li>
                                        <a href="${path}/admin/filterInsert.do?page=${i}"
                                           class="pagination-link is-current" aria-label="Page ${i}"
                                           aria-current="page">${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="${path}/admin/filterInsert.do?page=${i}"
                                           class="pagination-link" aria-label="Page ${i}"
                                           aria-current="page">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </nav>
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
