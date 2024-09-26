<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="common/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="${path}/home">고객 센터</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${path}/customer_center/announcement">공지사항</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}/customer_center/chatbot">챗봇 상담</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}/customer_center/customer-service">고객 서비스</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}/customer_center/faq">질문과 답변</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}/review/list">리뷰 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}/inquiry/list">문의목록 ${path}/inquiry/list</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%@ include file="common/footer.jsp" %>
