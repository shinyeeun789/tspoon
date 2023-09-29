<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- date input의 최소값 구하기 -->
<c:set var="minYear" value="<%=new java.util.Date().getYear() + 1881%>"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 마이페이지 </title>
    <jsp:include page="../include/head.jsp"></jsp:include>
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
                <a href="${path}/member/edit.do" class="has-text-white">
                    <span class="icon is-small">
                        <i class="fa-solid fa-user"></i>
                    </span>
                    <span> 개인정보 변경 </span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="hero-body">
        <p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
            개인정보 변경
        </p>
        <p class="subtitle has-text-centered has-text-white">
            개인정보를 간편하게 관리하세요
        </p>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 content">
                    <form action="${path}/member/edit.do" method="post">
                        <div class="columns is-multiline">
                            <div class="form-group column is-12-desktop">
                                <label for="id"> 아이디 </label>
                                <input type="text" class="input" id="id" name="id" value="${member.id}" readonly>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="id"> 비밀번호 </label>
                                <div class="columns">
                                    <div class="column is-four-fifths mt-3">
                                        <div class="control">
                                            <input type="password" class="input" id="pw" name="pw" placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하" class="input"
                                                   pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" disabled>
                                            <input type="hidden" id="pw2" name="pw2" value="${member.pw}">
                                            <p id="msg" style="color: red" hidden> 변경할 비밀번호를 입력해주세요 : ) </p>
                                        </div>
                                    </div>
                                    <div class="column mt-3">
                                        <button type="button" class="button is-link is-fullwidth" onclick="togglePw()"> 비밀번호 변경 </button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="name"> 이름 </label>
                                <input type="text" class="input" id="name" name="name" value="${member.name}" readonly>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="email"> 이메일 </label>
                                <input type="text" class="input" id="email" name="email" value="${member.email}">
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="tel"> 전화번호 </label>
                                <input type="text" class="input" id="tel" name="tel" value="${member.tel}">
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="addr2" class="label"> 주소 </label>
                                <div class="control">
                                    <input type="text" id="addr1" name="addr1" placeholder="기본 주소를 입력해주세요" class="input" autocomplete="off" value="${member.addr1}" readonly>
                                    <input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" class="input mt-3" autocomplete="off" value="${member.addr2}" required>
                                    <div class="columns">
                                        <div class="column is-four-fifths mt-3">
                                            <div class="control">
                                                <input type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" class="input" autocomplete="off" value="${member.postcode}" readonly>
                                            </div>
                                        </div>
                                        <div class="column mt-3">
                                            <button type="button" class="button is-link is-fullwidth" onclick="findAddr()"> 우편번호 검색 </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="tel" class="label"> 생년월일 </label>
                                <div class="control">
                                    <input type="date" id="birth" name="birth" max="${minYear}-12-31" placeholder="생년월일을 입력해주세요" class="input" autocomplete="off" value="${member.birth}" required>
                                </div>
                            </div>
                            <div class="column is-12 has-text-right">
                                <button type="submit" class="btn btn-primary color-white"> 변경하기 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    let read_pw = true;
    function togglePw() {
        read_pw = !read_pw;
        $("#pw").attr("disabled", read_pw);
        $("#msg").slideToggle();
    }

    function findAddr(){
        new daum.Postcode({
            oncomplete:function(data){
                console.log(data);
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("addr1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("addr1").value = jibunAddr;
                }
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<jsp:include page="../include/ft.jsp"/>

<!-- plugins -->
<script src="${path}/resources/js/masonry.min.js"></script>
<script src="${path}/resources/js/clipboard.min.js"></script>
<script src="${path}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>
</body>
</html>
