<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성</title>
</head>
<body>
    <h1>리뷰 작성</h1>
  <form action="${pageContext.request.contextPath}/review/createReview" method="post" enctype="multipart/form-data">
        <input type="hidden" name="accommodationId" value="${accommodationId}">
        <input type="hidden" name="userId" value="${userId}">
        
        <label for="rating">평점:</label>
        <input type="number" id="rating" name="rating" min="1" max="5" required>
        <br>
        
        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="4" cols="50" required></textarea>
        <br>
        
        <label for="images">사진 첨부:</label>
        <input type="file" id="images" name="images" multiple>
        <br>
        
        <input type="submit" value="리뷰 작성">
    </form>
    
    <a href="${pageContext.request.contextPath}/review/reviewList?">리뷰 목록으로 돌아가기</a>
</body>
</html>