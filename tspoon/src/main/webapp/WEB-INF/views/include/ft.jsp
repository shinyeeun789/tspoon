<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath}"/>
<footer>
    <div class="container">
        <div class="columns is-multiline is-align-items-center border-bottom py-5">
            <div class="column is-4-desktop is-12-tablet">
                <ul class="list-inline footer-menu has-text-centered has-text-left-desktop">
                    <li class="list-inline-item"><a href="${path1}/introduce/company.do"> 회사 소개 </a></li>
                    <li class="list-inline-item"><a href="${path1}/board/list.do"> 커뮤니티 </a></li>
                    <li class="list-inline-item"><a href="${path1}/notice/list.do"> 고객지원 </a></li>
                </ul>
            </div>
            <div class="column is-4-desktop is-12-tablet">
                <a class="navbar-brand is-justify-content-center" href="${path1}">
                    <img class="img-fluid" src="${path1}/resources/images/tspoon_logo.png" alt="티스푼 로고" style="width:200px">
                </a>
            </div>
            <div class="column is-4-desktop is-12-tablet">
                <ul class="list-inline social-icons has-text-right-desktop has-text-centered">
                    <li class="list-inline-item"><a href="https://github.com/shinyeeun789/"><i class="ti-github"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="py-4 has-text-centered">
            <small class="text-light">Copyright © 2020 - Design by <a href="https://themefisher.com">themefisher </a> &amp; © 2023 - Develop by ShinYeEun </small>
        </div>
    </div>
</footer>
