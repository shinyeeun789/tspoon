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
    <title>회원 정보 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>

    <div class="content" id="content">
        <div class="row column text-center">
            <h2 class="h1">회원 정보 보기</h2>
            <hr>
            <div class="container">
                <table id="table1">
                    <tbody>

                    <tr>
                        <th style="background-color:#dcdcdc">아이디</th>
                        <td>${member.id }</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">비밀번호</th>
                        <td>${member.pw }</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">이름</th>
                        <td><p>${member.name }</p></td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">이메일</th>
                        <td>${member.email }</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">전화번호</th>
                        <td>${member.tel }</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">주소</th>
                        <td>(${member.postcode }) ${member.addr1} ${member.addr2}</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">가입일자</th>
                        <td>${member.regdate }</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">생년월일</th>
                        <td>${member.birth }</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">포인트</th>
                        <td>${member.pt }</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">방문횟수</th>
                        <td>${member.visited }</td>
                    </tr>
                    </tbody>
                </table>
                <div class="button-group">
                    <a class="button" href="${path1 }/member/list.do">회원 목록</a>
                    <a class="button" href="${path1 }/member/delete.do?id=${member.id}">회원 강퇴</a>
                    <a class="button" href="${path1 }/member/edit.do?id=${member.id}">회원 정보 수정</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</div>
</body>
</html>