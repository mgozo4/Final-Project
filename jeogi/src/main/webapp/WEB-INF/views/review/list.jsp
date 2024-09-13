<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%>

<style>
.card {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.card-img-top {
	border-bottom: 1px solid #ddd;
}

.card-body {
	padding: 20px;
}

.card-title {
	font-size: 1.25rem;
	color: #333;
}

.card-subtitle {
	font-size: 1rem;
	color: #777;
}

.card-text {
	font-size: 0.875rem;
	color: #555;
}

.card-text span {
	font-size: 1rem;
	color: #007bff; /* Bootstrap's primary color */
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	transition: background-color 0.3s ease, border-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}

.container {
	max-width: 1200px;
}

.row {
	margin: 0;
}

.col-md-4 {
	padding: 0 15px;
}

.text-center {
	text-align: center;
}

.my-4 {
	margin-top: 1.5rem;
	margin-bottom: 1.5rem;
}

.my-5 {
	margin-top: 3rem;
	margin-bottom: 3rem;
}
</style>

<div class="container my-5">
	<h1 class="text-center mb-4">리뷰 목록</h1>

	<div class="row">
		<c:forEach var="review" items="${reviews}">
			<div class="col-md-4 mb-4">
				<div class="card shadow-sm rounded">
					<c:choose>
						<c:when test="${not empty review.images}">
							<img src="${review.images}" alt="리뷰 이미지" class="card-img-top"
								style="height: 200px; object-fit: cover;">
						</c:when>
						<c:otherwise>
							<img src="default-image.jpg" alt="기본 이미지" class="card-img-top"
								style="height: 200px; object-fit: cover;">
						</c:otherwise>
					</c:choose>
					<div class="card-body">
						<h5 class="card-title">리뷰 ID: ${review.review_id}</h5>
						<h6 class="card-subtitle mb-2 text-muted">작성자 ID:
							${review.user_id}</h6>
						<p class="card-text">
							평점: <span class="star-rating"> <c:forEach var="i"
									begin="1" end="5">
									<c:choose>
										<c:when test="${i <= review.rating}">
                    						&#9733; 
										</c:when>
										<c:otherwise>
 						                   &#9734; 
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</span><br> 내용: ${review.content}
						</p>
						<p class="card-text text-muted">작성일: ${review.created_at}</p>
						<div class="d-flex justify-content-end">
							<a href="#" class="btn btn-primary"
								onclick="detail(${review.review_id})">자세히 보기</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="text-center my-4">
		<a href="${pageContext.request.contextPath}/review/write"
			class="btn btn-primary">리뷰 작성하기</a>
	</div>

</div>

<script>
    function detail(review_id) {
    	console.log("dlwlsdn")
        window.location.href = '${pageContext.request.contextPath}/review/detail?review_id=' + review_id;
    }
</script>

<%@ include file="../common/footer.jsp"%>
