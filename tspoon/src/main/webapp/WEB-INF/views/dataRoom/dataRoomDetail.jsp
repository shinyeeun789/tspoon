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
    <title>자료실</title>
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
                <a href="${path}/dataRoom/list.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 자료실 목록 </span>
                </a>
            </li>
            <li>
                <a href="${path}/dataRoom/insert.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-file" aria-hidden="true"></i>
                        </span>
                    <span> 자료 상세보기 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            자료 상세 보기
        </p>
        <p class="subtitle has-text-centered has-text-white">
            원하는 자료를 간편하게 찾아보세요!
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 bg-white shadow rounded content">
                    <div class="columns buttons is-right">
                        <a href="${path}/dataRoom/list.do?page=${curPage}<c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="button"> 목록 </a>
                        <c:if test="${sid eq 'admin'}">
                            <a href="${path}/dataRoom/edit.do?no=${dataRoom.articleNo}&page=${curPage}" class="button"> 수정 </a>
                            <a href="${path}/dataRoom/delete.do?no=${dataRoom.articleNo}&page=${curPage}" class="button"> 삭제 </a>
                        </c:if>
                    </div>
                    <div class="columns">
                        <div class="column is-1 p-0">
                            <p> ${dataRoom.articleNo} </p>
                        </div>
                        <div class="column is-11 p-0">
                            <p> ${dataRoom.title} </p>
                        </div>
                    </div>
                    <div class="columns">
                        <p class="column has-text-right p-0">
                            ${dataRoom.regdate}
                        </p>
                    </div>
                    <div class="columns">
                        <textarea class="column textarea has-fixed-size" col="30" rows="15">${dataRoom.content}</textarea>
                    </div>
                    <div class="columns">
                        <p class="column p-0 mt-5 mb-1">
                            학습자료 (클릭하여 다운로드)
                        </p>
                    </div>
                    <div class="columns mb-4">
                        <div class="column p-0">
                            <c:forEach var="file" items="${fileList}">
                                <a href="${pageContext.request.contextPath}/resources/upload/dataRoom/${file.saveFolder}/${file.saveFile}" download="${file.originFile }" class="mr-3"><i class="fas fa-file" style="color: #54c066;"></i> ${file.originFile }</a>
                            </c:forEach>
                        </div>
                    </div>
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

<!-- 파일 입력 요소 변경 시 파일 이름 표시 -->
<script>
    $(".file-input").on("change", () => {
        let fileName = $(".file-input").val().split("\\").pop();
        $("#file-name-display").text("\t 선택한 파일 : " + fileName);
    });
</script>
</body>
</html>
