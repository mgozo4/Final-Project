<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<style>
/* 기본 스타일 */
body {
    font-family: 'Spoqa Han Sans Neo', 'sans-serif'; /* 굵고 둥근 폰트 (Spoqa Han Sans Neo 또는 유사한 폰트 사용) */
    background-color: #f5f5f5; /* 밝은 회색 배경 */
}

.container {
    max-width: 720px;
    margin: 0 auto;
    padding: 30px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #ff5a5f; /* 여기어때 메인 색상 */
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: 500; /* 약간 굵은 폰트 */
    color: #333;
    font-size: 1.2rem;
}

.form-control {
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border: 1px solid #ced4da; /* Bootstrap 기본 border 색상 */
}

.btn {
    border-radius: 5px;
}

.btn-primary {
    background-color: #ff5a5f; /* 여기어때 메인 색상 */
    border-color: #ff5a5f;
    transition: background-color 0.3s; /* 호버 효과 부드럽게 */
}

.btn-primary:hover {
    background-color: #e04a4f; /* 호버 시 어두운 색상 */
}

.btn-secondary {
    background-color: #ccc;
    border-color: #ccc;
}

/* 추가적인 스타일 */
.text-md-right {
    text-align: right;
}

textarea.form-control {
    resize: vertical;
}

.btn-lg {
    padding: 10px 20px;
    font-size: 1.2rem;
}

.ml-3 {
    margin-left: 1rem;
}

/* 폼 스타일 개선 */
form {
    background-color: #f8f9fa; /* 밝은 회색 배경 */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 더 깊은 그림자 효과 */
}

.form-group row {
    align-items: center; /* 레이블과 입력 필드 수직 정렬 */
}

.col-form-label {
    padding-top: calc(.375rem + 1px);
    padding-bottom: calc(.375rem + 1px);
    margin-bottom: 0;
    font-size: 1.1rem; /* 레이블 폰트 크기 증가 */
}
 .star-rating {
        display: inline-flex;
        direction: rtl; /* 오른쪽에서 왼쪽으로 배치 */
    }

    .star-rating input {
        display: none; /* input 요소 숨김 */
    }

    .star-rating label {
        font-size: 2rem;
        color: #ddd;
        cursor: pointer;
        transition: color 0.2s;
    }

    .star-rating input:checked ~ label {
        color: #f39c12;
    }

    .star-rating label:hover,
    .star-rating label:hover ~ label {
        color: #f39c12; /* Hover시 별 색 */
    }
</style>
<div class="container my-5">
    <div class="text-center mb-4">
        <h1>리뷰 작성</h1>
    </div>

    <form action="${pageContext.request.contextPath}/review/write" method="post">
    	<!-- @TODO review를 남기고자 하는 숙소 번호를 동적으로 할당하도록 변경 -->
    	<input type="hidden" name="user_id" value="${member.user_id}"/>
		<input type="hidden" name="accommodation_id" value="1"/>
        <div class="form-group row mb-4">
            <label for="rating" class="col-md-2 col-form-label text-md-right">평점</label>
            <div class="col-md-10">
                <input class="form-control" id="rating" name="rating" type="number" min="1" max="5" placeholder="1에서 5 사이의 숫자를 입력하세요" required />
              <div class="star-rating">
    <input type="radio" id="star5" name="rating1" value="5" />
    <label for="star5">☆</label>
    
    <input type="radio" id="star4" name="rating1" value="4" />
    <label for="star4">☆</label>
    
    <input type="radio" id="star3" name="rating1" value="3" />
    <label for="star3">☆</label>
    
    <input type="radio" id="star2" name="rating1" value="2" />
    <label for="star2">☆</label>
    
    <input type="radio" id="star1" name="rating1" value="1" />
    <label for="star1">☆</label>
</div>

            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="content" class="col-md-2 col-form-label text-md-right">내용</label>
            <div class="col-md-10">
                <textarea class="form-control" id="content" name="content" rows="6" placeholder="리뷰 내용을 입력하세요" required></textarea>
            </div>
        </div>

<!--         <div class="form-group row mb-4"> -->
<!--             <label for="images" class="col-md-2 col-form-label text-md-right">이미지 URL</label> -->
<!--             <div class="col-md-10"> -->
<!--                 <input class="form-control" id="images" name="images" type="url" placeholder="이미지 URL을 입력하세요" required /> -->
<!--             </div> -->
<!--         </div> -->

        <div class="form-group row mb-4">
            <div class="col-md-12 text-center">
                <input type="submit" value="작성 완료" class="btn btn-primary btn-lg px-5" />
                <a href="${pageContext.request.contextPath}/review/list" class="btn btn-secondary btn-lg px-5 ml-3">목록으로 돌아가기</a>
            </div>
        </div>
    </form>
</div>
<script>
    // 별을 클릭하면 숫자 필드에 값 설정
    document.querySelectorAll('.star-rating input').forEach(function(radio) {
        radio.addEventListener('change', function() {
            document.getElementById('rating').value = this.value;
        });
    });

    // 숫자 필드의 값이 변경되면 해당하는 별을 선택
    document.getElementById('rating').addEventListener('input', function() {
        var ratingValue = this.value;
        document.querySelectorAll('.star-rating input').forEach(function(radio) {
            if (radio.value == ratingValue) {
                radio.checked = true;
            }
        });
    });
</script>
<%@ include file="../common/footer.jsp"%>
