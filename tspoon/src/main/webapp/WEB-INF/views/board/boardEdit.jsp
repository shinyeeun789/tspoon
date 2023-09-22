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
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
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
                <a href="${path}/board/insert.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-circle-info"></i>
                        </span>
                    <span> 자유게시판 글 수정 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            자유게시판 글 수정
        </p>
        <p class="subtitle has-text-centered has-text-white">
            자유롭게 나누는 공간, 다양한 주제로 소통하세요
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 bg-white shadow rounded content">
                    <form action="${path}/board/edit.do" method="post">
                        <div class="columns is-multiline">
                            <div class="form-group column is-3">
                                <label for="cate"> 카테고리 </label>
                                <div class="select">
                                    <select name="cate" id="cate">
                                        <c:forEach var="category" items="${categories}">
                                            <c:if test="${detail.cateName eq category.cateName}">
                                                <option value="${category.cate}" selected>${category.cateName}</option>
                                            </c:if>
                                            <c:if test="${detail.cateName ne category.cateName}">
                                                <option value="${category.cate}">${category.cateName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group column is-9">
                                <label for="title"> 제목 </label>
                                <input type="hidden" name="seq" id="seq" value="${detail.seq}">
                                <input type="text" class="input" id="title" name="title" placeholder="제목을 입력해주세요" autocomplete="off" value="${detail.title}" autofocus required>
                            </div>
                            <!-- 내용 입력 부분 -->
                            <div class="form-group column is-12">
                                <textarea name="content" id="content" class="textarea" placeholder="내용을 입력해주세요" rows="8" cols="100" maxlength="1400" required>${detail.content}</textarea>
                                <script>
                                    CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/board/imageUpload.do'});
                                </script>
                            </div>
                        </div>
                        <div class="is-4 has-text-right">
                            <button type="submit" class="btn btn-primary"> 수정하기 </button>
                        </div>
                    </form>
                </div>
            </div>
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
