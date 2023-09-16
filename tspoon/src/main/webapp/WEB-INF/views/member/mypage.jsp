<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 마이페이지 </title>
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/hd.jsp"></jsp:include>

<!-- 배너 -->
<section class="hero is-medium is-link">
    <nav class="breadcrumb has-dot-separator ml-5 mt-5" aria-label="breadcrumbs">
        <ul>
            <li>
                <a href="${path1}/">
                        <span class="icon is-small">
                          <i class="fas fa-home" aria-hidden="true"></i>
                        </span>
                    <span> HOME </span>
                </a>
            </li>
            <li>
                <a href="${path1}/member/mypage.do">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 마이페이지 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered" style="margin-top:-40px">
            마이페이지
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 content">
                    <div class="columns is-multiline">
                        <div class="tags has-addons">
                            <span class="tag"> ${member.name}님이 현재 보유한 포인트 </span>
                            <span class="tag is-primary is-light"> ${member.pt} 포인트 </span>
                        </div>
                        <div class="form-group column is-12-desktop">
                            <label for="id"> 아이디 </label>
                            <input type="text" class="input" id="id" value="${member.id}" readonly>
                        </div>
                        <div class="form-group column is-12-desktop">
                            <label for="name"> 이름 </label>
                            <input type="text" class="input" id="name" value="${member.name}" readonly>
                        </div>
                        <div class="form-group column is-12-desktop">
                            <label for="email"> 이메일 </label>
                            <input type="text" class="input" id="email" value="${member.email}" readonly>
                        </div>
                        <div class="form-group column is-12-desktop">
                            <label for="tel"> 전화번호 </label>
                            <input type="text" class="input" id="tel" value="${member.tel}" readonly>
                        </div>
                        <div class="form-group column is-12-desktop">
                            <label for="addr1" class="label"> 주소 </label>
                            <div class="control">
                                <input type="text" id="addr1" class="input" value="${member.addr1}" readonly>
                                <input type="text" id="addr2" class="input mt-3" value="${member.addr2}" readonly>
                                <input type="text" id="postcode" class="input" value="${member.postcode}" readonly>
                            </div>
                        </div>
                        <div class="form-group column is-12-desktop">
                            <label for="birth"> 생년월일 </label>
                            <input type="text" class="input" id="birth" value="${member.birth}" readonly>
                        </div>
                        <div class="column is-12 has-text-right">
                            <a href="${path1}/member/edit.do" class="btn btn-primary color-white"> 개인정보 변경 </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/ft.jsp"/>

<!-- plugins -->
<script src="${path1}/resources/js/masonry.min.js"></script>
<script src="${path1}/resources/js/clipboard.min.js"></script>
<script src="${path1}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path1}/resources/js/script.js"></script>
</body>
</html>
