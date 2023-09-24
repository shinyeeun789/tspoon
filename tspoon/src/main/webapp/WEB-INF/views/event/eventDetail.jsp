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
    <jsp:include page="../include/head.jsp" />

    <style>
        #contents {
            border: 1px solid #ddd;
            border-radius: 5px;
            min-height: 500px;
            margin: 15px 15px 100px 15px;
        }
    </style>
</head>
<body>
<jsp:include page="../include/hd.jsp" />

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
                <a href="${path}/event/list.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
                    <span> 이벤트 목록 </span>
                </a>
            </li>
            <li>
                <a href="${path}/event/detail.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-circle-info"></i>
                        </span>
                    <span> 이벤트 상세보기 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            이벤트 상세보기
        </p>
        <p class="subtitle has-text-centered has-text-white">
            흥미로운 이벤트와 특별한 혜택을 만나보세요
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="buttons is-right" style="margin-top: 30px;">
            <a class="button" href="${path}/event/list.do?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>">목록</a>
            <c:if test='${sid eq "admin"}'>
                <a class="button" href="${path}/event/edit.do?eno=${detail.eno}">수정</a>
                <a class="button" href="${path}/event/delete.do?eno=${detail.eno}">삭제</a>
            </c:if>
        </div>
        <div class="columns">
            <div class="column">
                <p> 제목 </p>
                <input type="text" value="${detail.title}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <p> 이벤트 기간 </p>
                <input type="text" value="${detail.sdate } ~ ${detail.edate}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column p-5" id="contents">
                ${detail.content}
            </div>
        </div>
    </div>
    <div class="container mb-100">
        <c:if test="${sid ne null && detail.status eq '1'}">
            <div class="columns">
                <div class="column">
                    <input type="hidden" name="id" id="id" value="${sid}">
                    <input type="hidden" name="eno" id="eno" value="${detail.eno}">
                    <input type="hidden" name="app_chk" id="app_chk" value="no">
                    <button type="button" id="ck_btn" class="button is-fullwidth is-large btn-primary" onclick="appCheck()">신청하기</button>
                </div>
            </div>
            <script>
                function appCheck() {
                    var child;
                    let params = { id: $("#id").val(), eno: $("#eno").val()};
                    $.ajax({
                        url: "${path}/apply/appCheck.do",
                        type: "post",
                        dataType: "json",
                        data: params,
                        success:function(data) {
                            console.log("HI");
                            let appPass = data.result;
                            if(!appPass) {
                                alert("이미 신청한 회원입니다.");
                            } else {
                                child = window.open("${path}/apply/insert.do?eno="+$("#eno").val()+"&id="+$("#id").val(), "child", "width=700, height=500");
                            }
                        },
                        error:function(res) {
                            alert(" 잠시 후 다시 시도해주세요.");
                            console.log(res.responseText);
                        }
                    })
                }
            </script>
        </c:if>
    </div>
</section>

<!-- 푸터 영영 시작 -->
<jsp:include page="../include/ft.jsp" />
<!-- 푸터 영역 끝 -->

</body>
</html>