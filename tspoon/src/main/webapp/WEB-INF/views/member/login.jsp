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
    <title>로그인</title>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <script type="text/javascript">
        <c:if test="${msg == 0}">
            $(document).ready(() => {
                $("#msg").html("<svg xmlns='http://www.w3.org/2000/svg' width='13' height='13' fill='currentColor' class='bi bi-exclamation-circle' viewBox='0 0 16 16'>" +
                    "<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/>" +
                    "<path d='M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z'/>" +
                    "</svg> 아이디 또는 비밀번호가 틀렸습니다");
            });
        </c:if>
    </script>
</head>
<body>
<jsp:include page="../include/hd.jsp"></jsp:include>

<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 shadow rounded content">
                    <h2 class="section-title"> Login </h2>
                    <form action="${path1}/member/login.do" method="post">
                        <div class="columns is-multiline">
                            <div class="form-group column is-12-desktop">
                                <label for="id"> 아이디 </label>
                                <input type="text" class="input" id="id" name="id" placeholder="아이디를 입력해주세요" autocomplete="off" required>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="pw"> 비밀번호 </label>
                                <input type="password" class="input" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" required>
                                <p id="msg" style="color: red"></p>
                            </div>
                            <div class="column is-12 has-text-right">
                                <button type="submit" class="btn btn-primary"> 로그인 </button>
                            </div>
                            <div class="column is-12 has-text-centered">
                                <p> 아직 회원이 아니신가요? <a href="${path1}/member/term.do"> 회원가입하기 </a> </p>
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
</body>
</html>
