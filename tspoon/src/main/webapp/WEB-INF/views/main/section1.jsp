<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<section class="section pb-0" id="service">
    <div class="container">
        <h2 class="section-title has-text-centered"> 티스푼만의 서비스 </h2>
        <div class="columns is-multiline">
            <!-- topic -->
            <div class="column is-3-widescreen is-4-desktop is-6-tablet">
                <div class="card match-height">
                    <div class="card-body">
                        <i class="card-icon ti-comment mb-5"></i>
                        <h3 class="card-title h4">학부모 커뮤니티</h3>
                        <p class="card-text">우리 아이를 위한 지혜로운 학부모들의 소통 공간</p>
                        <a href="${path}/board/list.do" class="stretched-link"></a>
                    </div>
                </div>
            </div>
            <!-- topic -->
            <div class="column is-3-widescreen is-4-desktop is-6-tablet">
                <div class="card match-height">
                    <div class="card-body">
                        <i class="card-icon ti-calendar mb-5"></i>
                        <h3 class="card-title h4">출석체크</h3>
                        <p class="card-text">매일매일 출석체크 버튼을 눌러 포인트를 획득하세요</p>
                        <c:if test="${empty sid}">
                            <a href="${path}/member/login.do" class="stretched-link" onclick="return alert('로그인 후 접근 가능한 페이지입니다 : )')"></a>
                        </c:if>
                        <c:if test="${!empty sid}">
                            <a href="${path}/attendance/check.do" class="stretched-link"></a>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- topic -->
            <div class="column is-3-widescreen is-4-desktop is-6-tablet">
                <div class="card match-height">
                    <div class="card-body">
                        <i class="card-icon ti-desktop mb-5"></i>
                        <h3 class="card-title h4">교육뉴스</h3>
                        <p class="card-text">아이들의 미래를 밝히는 교육 트렌드, 뉴스로 알아가다</p>
                            <a href="${path}/news/list.do" class="stretched-link"></a>
                    </div>
                </div>
            </div>
            <!-- topic -->
            <div class="column is-3-widescreen is-4-desktop is-6-tablet">
                <div class="card match-height">
                    <div class="card-body">
                        <i class="card-icon ti-crown mb-5"></i>
                        <h3 class="card-title h4">이벤트</h3>
                        <p class="card-text">매일이 이벤트! 다양한 상품과 함께하는 특별한 경험</p>
                        <a href="${path}/event/list.do" class="stretched-link"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
