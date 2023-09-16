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
    <title>회원가입</title>
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

<section class="section" style="background-image: url('${path1}/resources/images/bg-dots.png')">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 bg-white shadow rounded content">
                    <h2 class="section-title"> Join </h2>
                    <form action="${path1}/member/join.do" method="post" onsubmit="return joinCheck(this)">
                        <div class="columns is-multiline">
                            <div class="form-group column is-12-desktop">
                                <label for="id" class="label"> 아이디 </label>
                                <div class="columns">
                                    <div class="column is-four-fifths">
                                        <div class="control">
                                            <input type="text" class="input" id="id" name="id" placeholder="영문 소문자, 숫자를 혼용하여 아이디를 입력해주세요"
                                                   pattern="^[a-z0-9]{8,16}" maxlength="16" autocomplete="off" autofocus required>
                                            <input type="hidden" name="id_chk" id="id_chk" value="no">
                                            <p id="msg" style="color: red"></p>
                                        </div>
                                    </div>
                                    <div class="column">
                                        <button type="button" class="button is-link is-fullwidth" onclick="idCheck()"> 중복 확인 </button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="pw" class="label"> 비밀번호 </label>
                                <div class="control">
                                    <input type="password" id="pw" name="pw" placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하" class="input"
                                           pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="pw_chk" class="label"> 비밀번호 확인 </label>
                                <div class="control">
                                    <input type="password" id="pw_chk" name="pw_chk" placeholder="비밀번호 확인을 입력해주세요" class="input"
                                           pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                                    <p id="pw_msg" style="color:red;"></p>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="name" class="label"> 이름 </label>
                                <div class="control">
                                    <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" class="input" autocomplete="off" required>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="email" class="label"> 이메일 </label>
                                <div class="control">
                                    <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요" class="input" autocomplete="off" required>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="tel" class="label"> 전화번호 </label>
                                <div class="control">
                                    <input type="tel" id="tel" name="tel" placeholder="전화번호를 입력해주세요" class="input" autocomplete="off" required>
                                </div>
                            </div>
                            <div class="form-group column is-12-desktop">
                                <label for="addr2" class="label"> 주소 </label>
                                <div class="control">
                                    <input type="text" id="addr1" name="addr1" placeholder="기본 주소를 입력해주세요" class="input" autocomplete="off" readonly>
                                    <input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" class="input mt-3" autocomplete="off" required>
                                    <div class="columns">
                                        <div class="column is-four-fifths mt-3">
                                            <div class="control">
                                                <input type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" class="input" autocomplete="off" readonly>
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
                                    <input type="date" id="birth" name="birth" placeholder="생년월일을 입력해주세요" class="input" autocomplete="off" required>
                                </div>
                            </div>


                            <div class="column is-12 has-text-right">
                                <button type="submit" class="btn btn-primary"> 회원가입 </button>
                            </div>
                            <div class="column is-12 has-text-centered">
                                <p> 이미 회원이신가요? <a href="${path1}/member/login.do"> 로그인하기 </a> </p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function() {
        $("#id").keyup(function() {
            $("#id_chk").val("no");
            if($(this).val() != "") {
                $("#msg").html("아이디 중복 체크를 진행해주세요");
            }
        });
        $("#pw, #pw_chk").keyup(function() {
            $("#pw_msg").html("");
        });
    });

    // 아이디 중복 체크 함수
    function idCheck() {
        if($("#id").val() == "") {
            $("#msg").html("아이디를 입력한 후 중복 체크를 진행해주세요");
            $("#id").focus();
            return;
        }

        let params = { id:$("#id").val() };
        $.ajax({
            url: "${path1}/member/idCheck.do",
            type: "post",
            dataType: "json",
            data: params,
            success:function(data) {
                let idPass = data.result;
                if(!idPass) {
                    $("#id_chk").val("no");
                    $("#msg").text("기존에 사용되고 있는 아이디입니다.");
                    $("#id").focus();
                } else if(idPass) {
                    $("#id_chk").val("yes");
                    $("#msg").text("사용 가능한 아이디입니다.");
                } else if(idPass == "") {
                    $("#msg").text("아이디가 확인되지 않았습니다. 다시 시도해주세요.")
                }
            },
            error:function(res) {
                alert("아이디 중복 확인에 실패했습니다. 잠시 후 다시 시도해주세요.");
                console.log(res.responseText);
            }
        })
    }
</script>
<script>
    function joinCheck(f) {
        if(f.pw.value != f.pw_chk.value) {
            $("#pw_msg").html("비밀번호와 비밀번호 확인이 서로 다릅니다");
            f.pw.focus();
            return false;
        }
        if(f.id_chk.value != "yes") {
            $("#msg").html("아이디 중복 체크를 진행해주세요");
            f.id.focus();
            return false;
        }
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
<script src="${path1}/resources/js/masonry.min.js"></script>
<script src="${path1}/resources/js/clipboard.min.js"></script>
<script src="${path1}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path1}/resources/js/script.js"></script>
</body>
</html>
