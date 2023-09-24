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
    <title> 출석체크 </title>
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
                <a href="${path}/attendance/list.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 출석체크 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            출석체크
        </p>
        <p class="subtitle has-text-centered has-text-white">
            출석체크로 포인트를 획득하세요
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="tabs is-centered">
            <ul>
                <li>
                    <a href="${path}/attendance/check.do">
                        <span class="icon is-small"><i class="fa-regular fa-calendar"></i></span>
                        <span> 출석 달력 </span>
                    </a>
                </li>
                <li class="is-active">
                    <a href="${path}/attendance/list.do">
                        <span class="icon is-small"><i class="fa-solid fa-table"></i></span>
                        <span> 출석 상세 보기 </span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="container is-max-desktop has-text-centered" style="min-height:50vh">
            <h4 class="mb-40" style="color: #007cf0;"> 출석체크 정보 </h4>
            <table class="table is-fullwidth is-hoverable">
                <thead>
                    <tr>
                        <th class="has-text-centered"> # </th>
                        <th class="has-text-centered"> 이름 </th>
                        <th class="has-text-centered"> 출석체크 날짜 </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="attends" items="${attendances}">
                        <tr class="has-text-centered">
                            <td width="120"> ${attends.ano} </td>
                            <td width="200"> ${attends.id} 님 </td>
                            <td> ${attends.attend} </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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