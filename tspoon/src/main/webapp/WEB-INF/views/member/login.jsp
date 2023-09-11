<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <jsp:include page="../include/head.jsp"/>

</head>
<body>
<div class="container is-fullhd">
    <jsp:include page="../include/hd.jsp"/>
    <section class="hero is-medium is-link">
        <div class="hero-body">
            <p class="title">
                Medium hero
            </p>
            <p class="subtitle">
                Medium subtitle
            </p>
        </div>
    </section>
    <div class="contents">
        <form action="${path1}/loginPro.do" class="box">
            <div class="field">
                <label class="label">ID</label>
                <div class="control">
                    <input class="input" type="text" placeholder="아이디를 입력해주세요">
                </div>
            </div>

            <div class="field">
                <label class="label">Password</label>
                <div class="control">
                    <input class="input" type="password" placeholder="비밀번호를 입력해주세요">
                </div>
            </div>

            <button class="button is-primary"> LogIn </button>
        </form>
    </div>

    <jsp:include page="../include/ft.jsp"/>
</div>
</body>
</html>
