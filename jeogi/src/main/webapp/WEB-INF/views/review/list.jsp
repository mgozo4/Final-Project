<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  <!-- JSTL 함수 라이브러리 추가 -->
<%@ include file="../common/header.jsp"%>

<div class="container my-5">
    <h1 class="text-center mb-4">리뷰 목록</h1>

    <table class="table table-striped table-hover">
        <thead class="thead-dark">
            <tr>
                <th>리뷰 ID</th>
                <th>작성자 ID</th>
                <th>평점</th>
                <th>내용</th>
                <th>이미지</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${reviews}">
                <tr onclick="detail(${review.review_id})">
                    <td>${review.review_id}</td>
                    <td>${review.user_id}</td>
                    <td>${review.rating}</td>
                    <td>${fn:length(review.content) > 50 ? fn:substring(review.content, 0, 50) + '...' : review.content}</td>
<%--                     <td><img src="${review.images}" alt="리뷰 이미지" class="img-fluid" style="width: 100px;" /></td> --%>
					<td></td>
                    <td>${review.created_at}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="text-center my-4">
        <a href="${pageContext.request.contextPath}/review/write" class="btn btn-primary">리뷰 작성하기</a>
    </div>

</div>

<script>

    function detail(review_id) {
            window.location.href = '${pageContext.request.contextPath}/review/detail?review_id=' + review_id;
    }

</script>

<%@ include file="../common/footer.jsp"%>
