<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트</title>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
</head>
<body>

<!-- 헤더 영역 시작 -->
<jsp:include page="../include/hd.jsp" />
<!-- 헤더 영역 끝 -->

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
                <a href="${path}/event/insert.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-circle-info"></i>
                        </span>
                    <span> 이벤트 글 작성 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            이벤트 글 작성하기
        </p>
        <p class="subtitle has-text-centered has-text-white">
            흥미로운 이벤트와 특별한 혜택을 만나보세요
        </p>
    </div>
</section>

<!-- 이벤트 글쓰기 시작 -->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 bg-white shadow rounded content">
                    <form action="${path }/event/insert.do" method="post">
                        <div class="columns is-multiline">
                            <div class="form-group column is-12">
                                <label for="title"> 제목 </label>
                                <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" class="input" required>
                            </div>
                            <div class="form-group column is-12">
                                <label for="now"> 이벤트 상태 </label>
                                <div class="control">
                                    <label class="radio">
                                        <input type="radio" name="status" id="now" value="1" checked>
                                        진행중
                                    </label>
                                    <label class="radio">
                                        <input type="radio" name="status" id="end" value="0">
                                        종료
                                    </label>
                                </div>
                            </div>
                            <div class="form-group column is-12">
                                <label class="sdate">시작일</label>
                                <input type="date" name="sdate" id="sdate" class="input" placeholder="시작일 지정해주세요" autocomplete="off" required>
                            </div>
                            <div class="form-group column is-12">
                                <label class="edate">종료일</label>
                                <input type="date" name="edate" id="edate" class="input" placeholder="종료일 지정해주세요" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="form-group column is-12">
                            <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required></textarea>
                            <script>
                                CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/event/imageUpload.do'});
                            </script>
                        </div>
                        <div class="buttons is-right mt-6 mb-100">
                            <c:if test='${sid eq "admin"}'>
                                <a class="button" href="${path }/event/list.do">목록</a>
                                <input type="submit" class="button btn-primary" value="등록" >
                            </c:if>
                        </div>
                    </form>
                    <script>
                        // 시작일 변경 시 종료일 처리
                        $("#sdate").change(() => {
                            $("#edate").prop("min", $("#sdate").val());
                            // 종료일이 변경한 시작일보다 빠른 경우
                            if($("#edate").val() < $("#sdate").val()) {
                                $("#edate").val($("#sdate").val());
                            }
                        });
                        // 종료일 변경 시 시작일 처리
                        $("#edate").change(() => {
                            $("#sdate").prop("max", $("#edate").val());
                        })
                    </script>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 푸터 영역 시작 -->
<jsp:include page="../include/ft.jsp"/>
<!-- 푸터 영역 끝 -->

</body>
</html>