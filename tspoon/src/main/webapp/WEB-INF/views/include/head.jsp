<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path0" value="${pageContext.request.contextPath}" />

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="${path0}/resources/images/logo.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="${path0}/resources/images/tspoon_logo.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="${path0}/resources/images/tspoon_logo.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="${path0}/resources/images/tspoon_logo.png" sizes="64x64">

<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/153ada4eea.js" crossorigin="anonymous"></script>

<!-- mobile responsive meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- plugins -->
<link rel="stylesheet" href="${path0}/resources/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${path0}/resources/css/bulma.min.css" />

<script src="${path0}/resources/js/jquery-3.7.1.min.js"></script>

<!-- Main Stylesheet -->
<link href="${path0}/resources/css/style.css" rel="stylesheet">

<style>

</style>