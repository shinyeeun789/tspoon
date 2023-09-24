<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath}"/>
<nav class="navbar is-sticky-top navigation" role="navigation" aria-label="main navigation">
    <div class="container">
        <div class="navbar-brand">
            <a class="navbar-item" href="${path1}">
                <img class="img-fluid" src="${path1}/resources/images/tspoon_logo.png" alt="tspoon" width="155px">
            </a>

            <a role="button" class="navbar-burger burger" aria-expanded="false" data-target="navbar-links">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div id="navbar-links" class="navbar-menu">
            <div class="navbar-start ml-auto">
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link is-arrowless" href="https://bulma.io/documentation/overview/start/">
                        소개
                    </a>
                    <div class="navbar-dropdown is-boxed">
                        <a class="navbar-item" href="https://bulma.io/documentation/overview/start/">
                            티스푼 소개
                        </a>
                        <a class="navbar-item" href="https://bulma.io/documentation/overview/modifiers/">
                            오시는 길
                        </a>
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link is-arrowless" href="${path1}/board/list.do">
                        커뮤니티
                    </a>
                    <div class="navbar-dropdown is-boxed">
                        <a class="navbar-item" href="${path1}/board/list.do">
                            커뮤니티
                        </a>
                        <c:if test="${!empty sid}">
                            <a class="navbar-item" href="${path1}/attendance/check.do">
                                출석체크
                            </a>
                        </c:if>
                        <c:if test="${empty sid}">
                            <a class="navbar-item" href="${path1}/member/login.do" onclick="return alert('로그인 후 접근 가능한 페이지입니다 : )')">
                                출석체크
                            </a>
                        </c:if>
                        <hr class="dropdown-divider">
                        <a class="navbar-item" href="${path1}/news/list.do">
                            교육뉴스
                        </a>
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link is-arrowless" href="${path1}/">
                        서비스
                    </a>
                    <div class="navbar-dropdown is-boxed">
                        <a class="navbar-item" href="${path1}/">
                            우리아이 급식표
                        </a>
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link is-arrowless" href="${path1}/notice/list.do">
                        고객지원
                    </a>
                    <div class="navbar-dropdown is-boxed">
                        <a class="navbar-item" href="${path1}/notice/list.do">
                            공지사항
                        </a>
                        <a class="navbar-item" href="${path1}/qna/list.do">
                            Q&A
                        </a>
                        <a class="navbar-item" href="${path1}/faq/list.do">
                            FAQ
                        </a>
                        <hr class="dropdown-divider">
                        <a class="navbar-item" href="${path1}/dataRoom/list.do">
                            자료실
                        </a>
                    </div>
                </div>
            </div>

            <div class="navbar-end ml-0">
                <div class="navbar-item py-0">
                    <c:if test="${empty sid}">
                        <a href="${path1}/member/login.do" class="btn btn-sm btn-outline-primary ml-4"> 로그인 </a>
                        <a href="${path1}/member/term.do" class="btn btn-sm btn-primary ml-4"> 회원가입 </a>
                    </c:if>
                    <c:if test="${!empty sid and sid ne 'admin'}">
                        <a href="${path1}/member/logout.do" class="btn btn-sm btn-outline-primary ml-4"> 로그아웃 </a>
                        <a href="${path1}/member/mypage.do" class="btn btn-sm btn-primary ml-4"> 마이페이지 </a>
                    </c:if>
                    <c:if test="${!empty sid and sid eq 'admin'}">
                        <a href="${path1}/member/logout.do" class="btn btn-sm btn-outline-primary ml-4"> 로그아웃 </a>
                        <a href="${path1}/" class="btn btn-sm btn-primary ml-4"> 관리자페이지 </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</nav>
