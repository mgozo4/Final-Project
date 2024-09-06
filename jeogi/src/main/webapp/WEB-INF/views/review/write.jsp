<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

<div class="container my-5">
    <div class="text-center mb-4">
        <h1>리뷰 작성</h1>
    </div>

    <form action="${pageContext.request.contextPath}/review/write" method="post">
    	<!-- @TODO review를 남기고자 하는 숙소 번호를 동적으로 할당하도록 변경 -->
    	<input type="hidden" name="accommodation_id" value="1"/>
        <div class="form-group row mb-4">
            <label for="rating" class="col-md-2 col-form-label text-md-right">평점</label>
            <div class="col-md-10">
                <input class="form-control" id="rating" name="rating" type="number" min="1" max="5" placeholder="1에서 5 사이의 숫자를 입력하세요" required />
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="content" class="col-md-2 col-form-label text-md-right">내용</label>
            <div class="col-md-10">
                <textarea class="form-control" id="content" name="content" rows="6" placeholder="리뷰 내용을 입력하세요" required></textarea>
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="images" class="col-md-2 col-form-label text-md-right">이미지 URL</label>
            <div class="col-md-10">
                <input class="form-control" id="images" name="images" type="url" placeholder="이미지 URL을 입력하세요" required />
            </div>
        </div>

        <div class="form-group row mb-4">
            <div class="col-md-12 text-center">
                <input type="submit" value="작성 완료" class="btn btn-primary btn-lg px-5" />
                <a href="${pageContext.request.contextPath}/review/list" class="btn btn-secondary btn-lg px-5 ml-3">목록으로 돌아가기</a>
            </div>
        </div>
    </form>
</div>

<%@ include file="../common/footer.jsp"%>
