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
    <title>자료실</title>
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/hd.jsp"></jsp:include>

<!-- 배너 -->
<section class="hero is-medium is-link">
    <nav class="breadcrumb has-dot-separator ml-5 mt-5" aria-label="breadcrumbs">
        <ul>
            <li>
                <a href="${path}/">
                        <span class="icon is-small">
                          <i class="fas fa-home" aria-hidden="true"></i>
                        </span>
                    <span> HOME </span>
                </a>
            </li>
            <li>
                <a href="${path}/dataRoom/list.do">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 자료실 목록 </span>
                </a>
            </li>
            <li>
                <a href="${path}/dataRoom/insert.do">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 자료 등록 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered" style="margin-top:-40px">
            자료실 글 작성
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 bg-white shadow rounded content">
                    <form action="${path1}/dataRoom/insert.do" method="post" enctype="multipart/form-data">
                        <div class="columns is-multiline">
                            <div class="form-group column is-12">
                                <label for="title"> 제목 </label>
                                <input type="text" class="input" id="title" name="title" placeholder="제목을 입력해주세요" autocomplete="off" autofocus required>
                            </div>
                            <!-- 내용 입력 부분 -->
                            <div class="form-group column is-12">
                                <textarea name="content" id="content" class="textarea has-fixed-size" placeholder="내용을 입력해주세요" required></textarea>
                            </div>
                            <!-- 파일 선택 부분 -->
                            <div class="form-group column is-8">
                                <label class="file-label">
                                    <input class="file-input" type="file" name="upfile" multiple="multiple">
                                    <span class="file-cta">
                                        <span class="file-icon">
                                            <i class="fas fa-upload"></i>
                                        </span>
                                        <span class="file-label"> 파일 선택 </span>
                                    </span>
                                </label>
                                <p id="file-name-display"></p>
                            </div>
                            <div class="column is-4 has-text-right">
                                <button type="submit" class="btn btn-primary"> 작성하기 </button>
                            </div>
                        </div>
                    </form>
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

<!-- 파일 입력 요소 변경 시 파일 이름 표시 -->
<script>
    $(".file-input").on("change", () => {
        let fileName = $(".file-input").val().split("\\").pop();
        $("#file-name-display").text("\t 선택한 파일 : " + fileName);
    });
</script>
</body>
</html>