<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> ${title} </title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <jsp:include page="../include/hd.jsp"></jsp:include>

    <div class="content" id="content">
        <div class="row column text-center">
            <h2 class="h1">${title}</h2>
            <hr>
            <div class="container">
                <table>
                    <thead>
                    <tr>
                        <th width="80">No</th>
                        <th>ID</th>
                        <th width="150">Name</th>
                        <th width="150">RegDate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberList }" var="member" varStatus="status">
                        <tr>
                            <td>${status.count }</td>
                            <td><a href="${path1}/member/detail.do?id=${member.id }" title="${member.email}">${member.id }</a></td>
                            <td><a href="${path1}/member/detail.do?id=${member.id}" title="${member.tel}">${member.name }</a></td>
                            <td>
                                <fmt:parseDate value="${member.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="button-group">
                    <a href="${path1}/member/insert.do" class="button"> 회원 직권 추가 </a>
                </div>
            </div>
        </div>
    </div>

    <!-- 액션 태그로 대입 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</div>
</body>
</html>