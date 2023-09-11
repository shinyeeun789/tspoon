<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 수정하기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>

    <div class="content" id="contents">
        <div class="row column text-center">
            <h2 class="h1">회원 정보 수정</h2>
            <hr>
            <div class="container">
                <form action="${path1 }/board/edit.do" method="post">
                    <table id="table1">
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">아이디</th>
                            <td>
                                <input type="text" name="id" id="id" class="input" value="${member.id }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">비밀번호</th>
                            <td>
                                <input type="password" name="pw" id="pw" class="input" value="${member.pw }" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">이메일</th>
                            <td>
                                <input type="email" name="email" id="email" class="input" value="${member.email }" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">전화번호</th>
                            <td>
                                <input type="tel" name="tel" id="tel" class="input" value="${member.tel }" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">주소</th>
                            <td>
                                <input type="addr1" name="addr1" id="addr1" class="input" value="${member.addr1 }" required>
                                <input type="addr2" name="addr2" id="addr2" class="input" value="${member.addr2 }" required>
                                <input type="postcode" name="postcode" id="postcode" class="input" value="${member.postcode }" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">생년월일</th>
                            <td>
                                <input type="date" name="birth" id="birth" class="input" value="${member.birth }" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="submit success button" value="회원 정보 수정" >
                                <a class="button" href="${path1 }/member/list.do">회원 목록</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</div>
</body>
</html>