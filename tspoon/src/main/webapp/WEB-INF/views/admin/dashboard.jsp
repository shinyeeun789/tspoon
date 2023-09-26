<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title> 관리자 </title>
    <jsp:include page="../include/head.jsp"></jsp:include>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                <a href="${path}/admin/dashboard.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-chart-line"></i>
                        </span>
                    <span> DASHBOARD </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            DASHBOARD
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
                        <li><a href="${path}/admin/dashboard.do" class="is-active">Dashboard</a></li>
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
                                <li><a href="${path}/admin/selectWinner.do">당첨자 추첨</a></li>
                            </ul>
                        </li>
                    </ul>
                </aside>
            </div>
            <div class="column is-9">
                <section class="info-tiles">
                    <div class="tile is-ancestor has-text-centered">
                        <div class="tile is-parent">
                            <article class="tile is-child box">
                                <p class="subtitle"> <i class="fa-solid fa-user"></i> 회원 수 </p>
                                <p class="title"> ${memberCnt}명 </p>
                            </article>
                        </div>
                        <div class="tile is-parent">
                            <article class="tile is-child box">
                                <p class="subtitle"> <i class="fa-solid fa-list-ul"></i> 전체 게시글</p>
                                <p class="title"> ${boardCnt}개 </p>
                            </article>
                        </div>
                        <div class="tile is-parent">
                            <article class="tile is-child box">
                                <p class="subtitle"> <i class="fa-solid fa-gift"></i> 이벤트 참여자</p>
                                <p class="title"> ${applyCnt}명 </p>
                            </article>
                        </div>
                        <div class="tile is-parent">
                            <article class="tile is-child box">
                                <p class="subtitle"> <i class="fa-solid fa-question"></i> 미완료 질문글</p>
                                <p class="title"> ${noAnswerCnt}개 </p>
                            </article>
                        </div>
                    </div>
                </section>
                <div class="columns mb-50">
                    <div class="column is-12">
                        <div class="card events-card p-5">
                            <header class="card-header">
                                <p class="card-header-title">
                                    진행 중인 이벤트
                                </p>
                            </header>
                            <div class="card-table">
                                <table class="table is-fullwidth is-hoverable">
                                    <tbody>
                                    <c:forEach var="event" items="${ongoingEvents}" varStatus="state">
                                        <tr>
                                            <td style="vertical-align: middle"> <i class="fa-solid fa-bell"></i> &nbsp; ${event.title} </td>
                                            <td class="has-text-right" style="vertical-align: middle"><a class="button is-small btn-primary" href="${path}/event/detail.do?eno=${event.eno}"> 상세보기 </a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <footer class="card-footer">
                                <a href="${path}/event/list.do" class="card-footer-item"> view all </a>
                            </footer>
                        </div>
                    </div>
                </div>
                <div>
                    <h3 class="mb-30"> DASHBOARD <i class="fa-solid fa-chart-simple"></i> </h3>
                    <canvas id="myChart" style="display: block; box-sizing: border-box; height: 373px; width: 884px;"></canvas>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).ready(function() {
        const labelList = [];
        const visits = [];
        const members = [];

        $.ajax({
            url:"${path}/admin/getAdminChart.do",
            type:"post",
            dataType:"json",
            success: function(data) {
                for(let i=0; i<data.length; i++) {
                    let temp = data[i];
                    labelList[i] = temp.label;
                    visits[i] = temp.attendCnt;
                    members[i] = temp.memberCnt;
                }

                let ctx = document.getElementById("myChart");

                let mixedChart = {
                    type: 'bar',
                    labels: labelList,
                    datasets: [
                        {
                            label: '출석 수',
                            data: visits,
                            type: 'line',
                            backgroundColor: 'transparent',
                            borderColor: '#282c37',
                            tension: 0.5
                        },
                        {
                            label: '회원 수',
                            data: members,
                            backgroundColor: '#9baec8'
                        }
                    ]
                };

                let myChart = new Chart(ctx, {
                    type: 'bar',
                    data: mixedChart,
                    options: {
                        legend: {
                            display: true
                        }
                    }
                });
            }
        });
    });
</script>

<jsp:include page="../include/ft.jsp"/>

<!-- plugins -->
<script src="${path}/resources/js/masonry.min.js"></script>
<script src="${path}/resources/js/clipnotice.min.js"></script>
<script src="${path}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>

</body>
</html>