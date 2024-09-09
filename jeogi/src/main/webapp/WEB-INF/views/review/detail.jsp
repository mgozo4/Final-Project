<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 상세</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .review-detail-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .review-label {
            font-weight: bold;
        }
        .review-actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="container review-detail-container">
        <h1 class="text-center my-4">리뷰 상세</h1>

        <c:if test="${not empty msg}">
            <p class="alert alert-danger text-center">${msg}</p>
        </c:if>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">리뷰 ID</label>
            <div class="col-sm-9">
                <p class="form-control-plaintext">${review.review_id}</p>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">작성자 ID</label>
            <div class="col-sm-9">
                <p class="form-control-plaintext">${review.user_id}</p>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">평점</label>
            <div class="col-sm-9">
                <p class="form-control-plaintext">${review.rating}</p>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">내용</label>
            <div class="col-sm-9">
                <textarea class="form-control" rows="5" readonly>${review.content}</textarea>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">이미지 URL</label>
            <div class="col-sm-9">
                <img src="${review.images}" alt="리뷰 이미지" class="img-fluid" />
            </div>
        </div>

        <div class="review-actions my-4">
            <a href="${pageContext.request.contextPath}/review/update?review_id=${review.review_id}" class="btn btn-warning">수정</a>
            <form action="${pageContext.request.contextPath}/review/delete" method="post" style="display:inline;">
                <input type="hidden" name="review_id" value="${review.review_id}" />
                <input type="submit" value="삭제" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');"/>
            </form>
            <a href="${pageContext.request.contextPath}/review/list" class="btn btn-secondary">목록으로 돌아가기</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
