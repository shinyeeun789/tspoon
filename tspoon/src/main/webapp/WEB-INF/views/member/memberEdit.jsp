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
    <title>개인정보 변경</title>
    <jsp:include page="../include/head.jsp"></jsp:include>
    </script>
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
                <a href="${path}/member/mypage.do" class="has-text-white">
                    <span class="icon is-small">
                        <i class="fa-solid fa-user"></i>
                    </span>
                    <span> 마이페이지 </span>
                </a>
            </li>
            <li>
                <a href="${path}/member/edit.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-pen-to-square"></i>
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
                    <form action="${path}/member/edit.do" method="post" onsubmit="return editCheck(this)">
                        <div class="columns is-multiline">
                            <div class="form-group column is-12-desktop">
                                <label for="id"> 아이디 </label>
                                <input type="text" class="input" id="id" name="id" value="${member.id}" readonly>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="pw" class="label"> 비밀번호 </label>
                                <div class="control">
                                    <div class="columns">
                                        <div class="column is-four-fifths">
                                            <input type="password" id="pw" name="pw" placeholder="비밀번호 변경 버튼을 눌러 입력창을 활성화하세요" class="input"
                                                   pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" minlength="8" maxlength="16" disabled>
                                            <input type="hidden" id="pw2" name="pw2" value="${member.pw}">
                                            <p id="pw_msg" style="color: red; font-size: 9pt" hidden> 비밀번호는 숫자, 영문, 특수문자를 1개 이상 포함한 8자리 이상 16자리 이하로 설정해주세요:) </p>
                                        </div>
                                        <div class="column">
                                            <button type="button" class="button is-link is-fullwidth" onclick="activatePw()"> 비밀번호 변경 </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="name" class="label"> 이름 </label>
                                <div class="control">
                                    <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" class="input" value="${member.name}" readonly>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="email" class="label"> 이메일 </label>
                                <div class="control">
                                    <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요" class="input" value="${member.email}" autocomplete="off" required>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="tel" class="label"> 전화번호 </label>
                                <div class="control">
                                    <input type="tel" id="tel" name="tel" placeholder="전화번호를 입력해주세요" class="input" value="${member.tel}" autocomplete="off" required>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="addr2" class="label"> 주소 </label>
                                <div class="control">
                                    <input type="text" id="addr1" name="addr1" placeholder="기본 주소를 입력해주세요" class="input" value="${member.addr1}" autocomplete="off" readonly>
                                    <input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" class="input mt-3" value="${member.addr2}" autocomplete="off" required>
                                    <div class="columns">
                                        <div class="column is-four-fifths mt-3">
                                            <div class="control">
                                                <input type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" value="${member.postcode}" class="input" autocomplete="off" readonly>
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
                                    <input type="date" id="birth" name="birth" placeholder="생년월일을 입력해주세요" class="input" value="${member.birth}" autocomplete="off" required>
                                </div>
                            </div>
                            <div class="column is-12 has-text-right">
                                <button type="submit" class="btn btn-primary"> 개인정보 변경 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    let state = true;
    function activatePw() {
        state = !state;
        document.getElementById("pw").disabled = state;
        document.getElementById("pw_msg").hidden = state;
    }
</script>
<script>
    function findAddr(){
        new daum.Postcode({
            oncomplete:function(data){
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
