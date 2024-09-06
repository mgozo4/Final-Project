<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

<div class="container my-5">
    <div class="text-center mb-4">
        <h1>리뷰 수정</h1>
    </div>

    <!-- 성공 또는 실패 메시지 표시 -->
    <c:if test="${not empty msg}">
        <div class="alert ${success ? 'alert-success' : 'alert-danger'}" role="alert">
            ${msg}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/review/update" method="post">
        <input type="hidden" name="review_id" value="${review.review_id}" />

        <div class="form-group row mb-4">
            <label for="rating" class="col-md-2 col-form-label text-md-right">평점</label>
            <div class="col-md-10">
                <input class="form-control" id="rating" name="rating" type="number" value="${review.rating}" min="1" max="5" required />
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="content" class="col-md-2 col-form-label text-md-right">내용</label>
            <div class="col-md-10">
                <textarea class="form-control" id="content" name="content" rows="6" required>${review.content}</textarea>
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="images" class="col-md-2 col-form-label text-md-right">이미지 URL</label>
            <div class="col-md-10">
                <input class="form-control" id="images" name="images" type="url" value="${review.images}" required />
            </div>
        </div>

        <div class="form-group row mb-4">
            <div class="col-md-12 text-center">
                <input type="submit" value="수정 완료" class="btn btn-primary btn-lg px-5" />
                <a href="${pageContext.request.contextPath}/review/list" class="btn btn-secondary btn-lg px-5 ml-3">목록으로 돌아가기</a>
            </div>
        </div>
    </form>
</div>

<%@ include file="../common/footer.jsp"%>
