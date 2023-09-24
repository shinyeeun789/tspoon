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

    <style>
        .popup-wrapper {
            position: fixed;
            z-index: 100;
            top: 50%;
            margin-top: -250px;
            left: 50%;
            margin-left: -250px;
        }
        .popup {
            position: relative;
            background-image: url("${path}/resources/images/attendPoint.png");
            background-size: cover;
            border-radius: 20px;
            box-shadow: 5px 5px 10px #555;
            padding: 20px;
            text-align: center;
            width: 500px;
            height: 500px;
        }
        .close-btn {
            position: absolute;
            background-color: transparent;
            border: none;
            right: 20px;
            top: 20px;
        }
        .info {
            margin-top: 130px;
            color: white;
        }
        .point {
            line-height: 100px;
            color: #ff7617;
            font-weight: bold;
        }
    </style>
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
                <a href="${path}/attendance/check.do" class="has-text-white">
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
                <li class="is-active">
                    <a href="${path}/attendance/check.do">
                        <span class="icon is-small"><i class="fa-regular fa-calendar"></i></span>
                        <span> 출석 달력 </span>
                    </a>
                </li>
                <li>
                    <a href="${path}/attendance/list.do">
                        <span class="icon is-small"><i class="fa-solid fa-table"></i></span>
                        <span> 출석 상세 보기 </span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="buttons has-addons is-centered mb-5">
            <div class="container is-max-desktop has-text-centered">
                <h4 class="mb-40" style="color: #007cf0"> 출석체크하고 포인트 받자 <i class="fa-solid fa-face-laugh-squint fa-bounce"></i> </h4>
                <c:forEach var="i" begin="0" end="5">
                    <div class="columns">
                        <c:forEach var="j" begin="0" end="6">
                            <c:set var="date" value="${(7 * i + j) - (calendarInfo.startDayOfWeek - 1)}"></c:set>
                            <c:if test="${date < 1 or date > calendarInfo.endDay}">
                                <div class="column m-1" style="height: 80px;"></div>
                            </c:if>
                            <c:if test="${date > 0 and date <= calendarInfo.endDay and !fn:contains(list, ' '+=date+=' ')}">
                                <div class="column m-1" style="height: 80px; background-color: #EEE;">
                                    <h5> ${date} </h5>
                                </div>
                            </c:if>
                            <c:if test="${date > 0 and date <= calendarInfo.endDay and fn:contains(list, ' '+=date+=' ')}">
                                <div class="column m-1" style="height: 80px; background-color: #6EB3FE">
                                    <h5> ${date} </h5>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:forEach>

                <!-- 오늘 이미 출석체크를 했다면 버튼 비활성화 -->
                <div class="has-text-centered">
                    <c:if test="${attendChk}">
                        <button type="button" class="button is-info is-rounded is-large" disabled> 출석체크 완료 </button>
                    </c:if>
                    <!-- 오늘 출석체크를 하지 않았다면 버튼 활성화 -->
                    <c:if test="${!attendChk}">
                        <a href="${path}/attendance/addAttend.do" class="button is-info is-rounded is-large"> 출석체크 </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 적립된 포인트 팝업창 -->
<c:if test="${!empty point}">
    <div class="popup-wrapper">
        <div class="popup">
            <button class="close-btn" onclick="closePopup()"><i class="fa-solid fa-x" style="color: #fff"></i></button>
            <h3 class="info"> 출석체크하고 </h3>
            <h2 class="point">  </h2>
            <h3 style="color: white"> 받았어요! </h3>
        </div>
    </div>
    <script>
        $(document).ready(() => {
            let beforeNum, ranNum = 0;
            let startRandom = setInterval(() => {
                let beforeNum = ranNum;
                while(true) {
                    if(beforeNum != ranNum) {
                        break;
                    }
                    ranNum = Math.floor(Math.random()*100+10);
                }
                $(".point").text(ranNum + ' point');
            }, 50);

            setTimeout(() => {
                clearInterval(startRandom);
                $(".point").text(`${point} point`);
            }, 1500);
        });

        function closePopup() {
            $(".popup-wrapper").css("display","none");
        }
    </script>
</c:if>


<jsp:include page="../include/ft.jsp"/>

<!-- plugins -->
<script src="${path}/resources/js/masonry.min.js"></script>
<script src="${path}/resources/js/clipboard.min.js"></script>
<script src="${path}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>

</body>
</html>