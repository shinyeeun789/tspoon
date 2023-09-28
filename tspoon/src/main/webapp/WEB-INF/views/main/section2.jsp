<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div style="background-color: #eee; margin: 100px 0px; padding: 100px 0px">
    <div class="container">
        <h2 class="section-title has-text-centered"> 티스푼에서 제공하는 </h2>
        <div class="columns">
            <div class="column">
                <div style="position: relative">
                    <h4 class="mb-20" id="notice"> NOTICE </h4>
                    <a href="${path}/notice/list.do" class="button btn-outline-primary is-small" style="position: absolute; top: 0px; right: 0px"> 더보기 </a>
                </div>
                <table class="table is-fullwidth" style="border-radius: 10px">
                    <tbody>
                    <c:forEach var="notice" items="${noticeList}">
                        <tr onclick="javascript:location.href='${path}/notice/detail.do?seq=${notice.seq}&page=1'" style="cursor: pointer">
                            <td> ${notice.seq} </td>
                            <td> ${notice.title} </td>
                            <td> ${notice.regdate} </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="column">
                <div style="position: relative">
                    <h4 class="mb-20" id="event"> EVENT </h4>
                    <a href="${path}/event/list.do" class="button btn-outline-primary is-small" style="position: absolute; top: 0px; right: 0px"> 더보기 </a>
                </div>
                <table class="table is-fullwidth" style="border-radius: 10px">
                    <tbody>
                    <c:forEach var="event" items="${eventList}">
                        <tr onclick="javascript:location.href='${path}/event/detail.do?eno=${event.eno}&page=1'" style="cursor: pointer">
                            <td> ${event.eno} </td>
                            <td> ${event.title} </td>
                            <td> ${event.regdate} </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>