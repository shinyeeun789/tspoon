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
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
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
                <a href="${path}/admin/selectWinner.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-gift"></i>
                        </span>
                    <span> 당첨자 추첨 </span>
                </a>
            </li>
            <li>
                <a href="${path}/admin/winnerList.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-regular fa-rectangle-list"></i>
                        </span>
                    <span> 당첨자 발표 글 작성 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            당첨자 발표 글 작성
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
                                <li><a href="${path}/admin/filtering.do">필터링 단어 관리</a></li>
                                <li><a href="${path}/admin/boardMgmt.do">규칙 위반 게시물</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${path}/admin/eventMgmt.do">이벤트</a>
                            <ul>
                                <li><a href="${path}/admin/eventMgmt.do">이벤트 관리</a></li>
                                <li><a href="${path}/admin/selectWinner.do" class="is-active">당첨자 추첨</a></li>
                            </ul>
                        </li>
                    </ul>
                </aside>
            </div>
            <div class="column is-9">
                <form action="${path }/winner/insert.do" method="post">
                    <div class="columns is-multiline">
                        <div class="form-group column is-12">
                            <label for="title"> 제목 </label>
                            <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" class="input" value="${event.title} 당첨자 발표" required>
                            <input type="hidden" name="eno" id="eno" value="${event.eno}">
                        </div>
                        <div class="form-group column is-12">
                            <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required>
<table border="1" cellpadding="1" cellspacing="1" style="width:100%; text-align:center">
    <thead>
        <tr><td>#</td><td>아이디</td><td>이름</td></tr>
    </thead>
    <tbody>
                            <c:forEach var="winner" items="${winners}" varStatus="status">
        <tr><td>${status.index}</td><td>${winner.id}</td><td>${winner.name}</td></tr>
                            </c:forEach>
    </tbody>
</table>
축하드립니다! 당첨자분들께는 개별적으로 연락드려 상세한 안내를 드리겠습니다.
                            </textarea>
                            <script>
                                CKEDITOR.replace('content', {filebrowserUploadUrl: '${path}/winner/imageUpload.do'});
                            </script>
                        </div>
                        <c:if test='${sid eq "admin"}'>
                            <div class="form-group column is-12">
                                <div class="buttons is-right mb-100">
                                    <input type="submit" class="button btn-primary" value="등록">
                                </div>
                            </div>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- 푸터 영역 시작 -->
<jsp:include page="../include/ft.jsp"/>
<!-- 푸터 영역 끝 -->

</body>
</html>