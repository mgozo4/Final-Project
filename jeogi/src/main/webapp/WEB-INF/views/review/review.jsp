<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 목록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            padding: 20px;
        }
        .review-list {
            margin-top: 20px;
        }
        .review-item {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            padding: 20px;
            position: relative;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .review-item:hover {
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
            transform: translateY(-5px);
        }
        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .review-header h3 {
            margin: 0;
            font-size: 18px;
            font-weight: 600;
        }
        .review-header .review-date {
            color: #6c757d;
            font-size: 14px;
        }
        .review-rating {
            display: block;
            margin-top: 10px;
            color: #343a40;
            font-size: 15px;
        }
        .review-actions {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        .review-actions .btn {
            font-size: 14px;
        }
        .comment {
            border-top: 1px solid #dee2e6;
            padding: 10px 0;
        }
        .comment-form {
            margin-top: 10px;
        }
        .comment-form input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }
        .pagination {
            margin-top: 20px;
        }
        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }
        .pagination .page-link {
            color: #007bff;
        }
        .pagination .page-link:hover {
            color: #0056b3;
            text-decoration: none;
        }
        .modal-content {
            padding: 20px;
        }
        .modal-title {
            font-weight: 600;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">리뷰 목록</h2>

        <!-- 검색 및 정렬 폼 -->
        <form action="/reviews" method="get" class="mb-4">
            <div class="form-row align-items-center">
                <div class="col-md-4 mb-2 mb-md-0">
                    <input type="text" name="keyword" placeholder="검색어" class="form-control" />
                </div>
                <div class="col-md-3 mb-2 mb-md-0">
                    <select name="sortField" class="form-control">
                        <option value="id">ID</option>
                        <option value="review_date">날짜</option>
                        <option value="rating">평점</option>
                    </select>
                </div>
                <div class="col-md-3 mb-2 mb-md-0">
                    <select name="sortDir" class="form-control">
                        <option value="asc">오름차순</option>
                        <option value="desc">내림차순</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </div>
        </form>

        <!-- 리뷰 목록 -->
        <div id="reviewList" class="review-list">
            <!-- 리뷰 항목이 여기에 동적으로 삽입됩니다 -->
        </div>

        <!-- 페이지네이션 -->
        <nav aria-label="Page navigation">
            <ul id="pagination" class="pagination">
                <!-- 페이지네이션 버튼이 여기에 동적으로 삽입됩니다 -->
            </ul>
        </nav>
    </div>

    <!-- 리뷰 작성 모달 -->
    <div class="modal fade" id="writeReviewModal" tabindex="-1" role="dialog" aria-labelledby="writeReviewModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="writeReviewModalLabel">리뷰 작성</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="writeReviewForm" class="needs-validation" novalidate>
                        <div class="form-group">
                            <label for="reviewTitle">제목</label>
                            <input type="text" class="form-control" id="reviewTitle" name="title" required>
                            <div class="invalid-feedback">제목을 입력해 주세요.</div>
                        </div>
                        <div class="form-group">
                            <label for="reviewContent">내용</label>
                            <textarea class="form-control" id="reviewContent" name="content" rows="4" required></textarea>
                            <div class="invalid-feedback">내용을 입력해 주세요.</div>
                        </div>
                        <div class="form-group">
                            <label for="reviewRating">평점</label>
                            <select class="form-control" id="reviewRating" name="rating" required>
                                <option value="" disabled selected>평점을 선택해 주세요</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                            <div class="invalid-feedback">평점을 선택해 주세요.</div>
                        </div>
                        <button type="submit" class="btn btn-primary">작성</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 리뷰 수정 모달 -->
    <div class="modal fade" id="editReviewModal" tabindex="-1" role="dialog" aria-labelledby="editReviewModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editReviewModalLabel">리뷰 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editReviewForm" class="needs-validation" novalidate>
                        <input type="hidden" id="editReviewId" name="id">
                        <div class="form-group">
                            <label for="editReviewTitle">제목</label>
                            <input type="text" class="form-control" id="editReviewTitle" name="title" required>
                            <div class="invalid-feedback">제목을 입력해 주세요.</div>
                        </div>
                        <div class="form-group">
                            <label for="editReviewContent">내용</label>
                            <textarea class="form-control" id="editReviewContent" name="content" rows="4" required></textarea>
                            <div class="invalid-feedback">내용을 입력해 주세요.</div>
                        </div>
                        <div class="form-group">
                            <label for="editReviewRating">평점</label>
                            <select class="form-control" id="editReviewRating" name="rating" required>
                                <option value="" disabled selected>평점을 선택해 주세요</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                            <div class="invalid-feedback">평점을 선택해 주세요.</div>
                        </div>
                        <button type="submit" class="btn btn-primary">수정</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 댓글 모달 -->
    <div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="commentModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="commentModalLabel">댓글 관리</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="commentsContainer">
                        <!-- 댓글 목록이 여기에 동적으로 삽입됩니다 -->
                    </div>
                    <form id="commentForm" class="mt-3">
                        <input type="hidden" id="reviewIdForComment">
                        <div class="form-group">
                            <label for="commentContent">댓글 내용</label>
                            <input type="text" class="form-control" id="commentContent" required>
                        </div>
                        <button type="submit" class="btn btn-primary">댓글 작성</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // 페이지가 로드될 때 리뷰 목록을 불러오는 함수
        $(document).ready(function() {
            loadReviews();
        });

        function loadReviews() {
            $.ajax({
                url: '/reviews', // 리뷰 목록을 가져오는 API
                method: 'GET',
                success: function(data) {
                    const reviewList = $('#reviewList');
                    reviewList.empty(); // 현재 리뷰 목록을 비웁니다
                    data.reviews.forEach(review => {
                        reviewList.append(`
                            <div class="review-item" onclick="viewDetails(${review.id});">
                                <div class="review-header">
                                    <h3>${review.author}</h3>
                                    <span class="review-date">${review.date}</span>
                                </div>
                                <p>${review.content}</p>
                                <span class="review-rating">평점: ${review.rating}</span>
                                <div class="review-actions">
                                    <button class="btn btn-primary btn-sm" onclick="editReview(${review.id}); event.stopPropagation();">수정</button>
                                    <button class="btn btn-danger btn-sm" onclick="deleteReview(${review.id}); event.stopPropagation();">삭제</button>
                                </div>
                                <div class="comments">
                                    ${review.comments.map(comment => `
                                        <div class="comment">
                                            <strong>${comment.author}:</strong> ${comment.content}
                                        </div>
                                    `).join('')}
                                    <div class="comment-form">
                                        <input type="text" class="form-control" placeholder="댓글 작성하기..." onkeydown="if(event.key === 'Enter') addComment(${review.id});">
                                    </div>
                                </div>
                            </div>
                        `);
                    });
                    updatePagination(data.pagination);
                }
            });
        }

        function updatePagination(pagination) {
            const paginationContainer = $('#pagination');
            paginationContainer.empty();
            for (let i = 1; i <= pagination.totalPages; i++) {
                paginationContainer.append(`
                    <li class="page-item ${i === pagination.currentPage ? 'active' : ''}">
                        <a class="page-link" href="#" onclick="loadPage(${i}); return false;">${i}</a>
                    </li>
                `);
            }
        }

        function loadPage(page) {
            $.ajax({
                url: `/reviews?page=${page}`, // 페이지 번호를 포함한 API 요청
                method: 'GET',
                success: function(data) {
                    // 페이지가 로드될 때 리뷰 목록을 업데이트합니다
                    const reviewList = $('#reviewList');
                    reviewList.empty(); // 현재 리뷰 목록을 비웁니다
                    data.reviews.forEach(review => {
                        reviewList.append(`
                            <div class="review-item" onclick="viewDetails(${review.id});">
                                <div class="review-header">
                                    <h3>${review.author}</h3>
                                    <span class="review-date">${review.date}</span>
                                </div>
                                <p>${review.content}</p>
                                <span class="review-rating">평점: ${review.rating}</span>
                                <div class="review-actions">
                                    <button class="btn btn-primary btn-sm" onclick="editReview(${review.id}); event.stopPropagation();">수정</button>
                                    <button class="btn btn-danger btn-sm" onclick="deleteReview(${review.id}); event.stopPropagation();">삭제</button>
                                </div>
                                <div class="comments">
                                    ${review.comments.map(comment => `
                                        <div class="comment">
                                            <strong>${comment.author}:</strong> ${comment.content}
                                        </div>
                                    `).join('')}
                                    <div class="comment-form">
                                        <input type="text" class="form-control" placeholder="댓글 작성하기..." onkeydown="if(event.key === 'Enter') addComment(${review.id});">
                                    </div>
                                </div>
                            </div>
                        `);
                    });
                    updatePagination(data.pagination);
                }
            });
        }

        function viewDetails(reviewId) {
            // 리뷰 상세보기 로직
        }

        function editReview(reviewId) {
            // 리뷰 수정 로직
            $('#editReviewModal').modal('show');
        }

        function deleteReview(reviewId) {
            // 리뷰 삭제 로직
        }

        function addComment(reviewId) {
            // 댓글 추가 로직
        }

        // 모달 폼 검증
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>
