<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
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
	<title> FAQ </title>
	<style>
		.message-header {
			display: block!important;
		}
		.message-header::before {
			content: 'Q';
			padding: 3px 6px;
			margin-right: 10px;
			border-radius: 50%;
			background-color: #fff;
			color: #333;
		}

		.message-body::before {
			content: 'A';
			padding: 3px 6px;
			margin-right: 10px;
			border-radius: 50%;
			background-color: #027BFB;
			color: white;
		}
	</style>
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
				<a href="${path}/faq/list.do" class="has-text-white">
                        <span class="icon is-small">
                          <i class="fa-solid fa-table-list" aria-hidden="true"></i>
                        </span>
					<span> FAQ 목록 </span>
				</a>
			</li>
		</ul>
	</nav>
	<div class="hero-body">
		<p class="title has-text-centered has-text-white" style="margin-top:-40px; text-shadow: 1px 1px 10px #333">
			FAQ 목록
		</p>
		<p class="subtitle has-text-centered has-text-white">
			자주 묻는 질문에 대한 답변을 쉽게 찾아보세요
		</p>
	</div>
</section>

<section class="section">
	<div class="container">
		<div class="container">
			<ul class="faqlist mb-100" style="list-style: none;">
				<c:if test="${!empty faqList}">
					<c:forEach items="${faqList }" var="faq" varStatus="status">
						<li class="mb-10">
							<div class="message-header">${faq.question }</div>
							<div class="message-body mb-30" style="background-color: rgb(245,245,245);">${faq.answer }</div>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${empty faqList}">
					<div class="has-text-centered"> FAQ가 없습니다. </div>
				</c:if>
			</ul>
			<script>
				$(document).ready(function(){
					$(".faqlist li").click(function(){
						$(this).find(".message-body").slideToggle(500);
						$(this).find(".message-header").toggleClass("on");
					});
				});
			</script>
		</div>
	</div>
</section>
<!-- FAQ 영역 끝-->

<!-- 푸터 영영 시작 -->
<jsp:include page="../include/ft.jsp"/>
<!-- 푸터 영역 끝 -->

<!-- plugins -->
<script src="${path}/resources/js/masonry.min.js"></script>
<script src="${path}/resources/js/clipnotice.min.js"></script>
<script src="${path}/resources/js/jquery.matchHeight-min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>
</body>
</html>