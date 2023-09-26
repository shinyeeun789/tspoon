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
    <title> 관리자 </title>
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
                <a href="${path}/admin/memberList.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-chart-line"></i>
                        </span>
                    <span> 회원 목록 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            회원 목록
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
                        <li><a href="${path}/admin/memberList.do" class="is-active">Customers</a></li>
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
                                <li><a href="${path}/admin/filtering.do">필터링 단어 관리</a></li>
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
                <table class="table is-hoverable is-fullwidth has-text-centered">
                    <thead>
                    <tr>
                        <th width="80" class="has-text-centered">#</th>
                        <th class="has-text-centered">아이디</th>
                        <th width="150" class="has-text-centered">이름</th>
                        <th width="200" class="has-text-centered">이메일</th>
                        <th width="150" class="has-text-centered">전화번호</th>
                        <th width="150" class="has-text-centered">가입일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberList }" var="member" varStatus="status">
                        <tr>
                            <td>${status.count }</td>
                            <td>${member.id }</td>
                            <td>${member.name}</td>
                            <td>${member.email}</td>
                            <td>${member.tel}</td>
                            <td>
                                <fmt:parseDate value="${member.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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