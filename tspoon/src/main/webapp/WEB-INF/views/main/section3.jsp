<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div id="lecture">
    <div class="container mb-100">
        <div class="has-text-centered">
            <h2 class="section-title mb-20">추천강의</h2>
        </div>
        <div>
            <figure class="image is-4by3" style="padding-top: 0;">
                <div class="player" style="width:800px; margin: 0 auto;">
                    <div class="vdo_fr">
                        <video id="video" style="width: 100%">
                            <source src="${path}/resources/video/lecture_video03.mp4" type="video/mp4"/>
                        </video>
                    </div>
                    <div id="progress">
                        <div id="progressBar" class="mb-2"></div>
                    </div>
                    <div id="buttonbar" style="width: 100%">
                        <button id="play" class="player_btn"> <i class="fas fa-play"></i> </button>
                        <button id="pause" style="display: none" class="player_btn"> <i class="fas fa-pause"></i> </button>
                        <button id="stop" class="player_btn"> <i class="fas fa-stop"></i> </button>
                        <span id="currentTime"> 00:00 / 02:11 </span>
                        <div id="btn-right">
                            <input id="vol" type="range" value="500" min="0" max="1000">
                            <button id="volTxt" class="player_btn">50%</button>
                            <button id="full" class="player_btn"><i class="fa-solid fa-expand"></i></button>
                        </div>
                    </div>
                    <script src="${path}/resources/js/vdo.js"></script>
                </div>
            </figure>
            <div class="card-content has-text-centered">
                <h4 class="mb-10"> [수능 완성] 빈틈을 채워나가는 마지막 실전 연습 </h4>
            </div>
        </div>
    </div>
</div>