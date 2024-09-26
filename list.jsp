<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- list.jsp -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	.container{
		width:800px;
		margin:0 auto;
	}
</style>
<div class="container">
<br/>
<hr/>
	<form action="${path}/board/list">
		<select name="searchType">
			<option value="n">---------------------------</option>
			<option value="t">TITLE</option>
			<option value="c">CONTENT</option>
			<option value="w">WRITER</option>
			<option value="tc">TITLE &amp; CONTENT</option>
			<option value="tw">TITLE &amp; WRITER</option>
			<option value="tcw">TITLE &amp; CONTENT &amp; WRITER</option>
		</select>
		<input type="text" name="keyword" placeholder="검색할 키워드를 작성해주세요."/>
		<input type="submit" value="검색"/>
		<select name="perPageNum" onchange="this.form.submit();">
			<c:forEach var="i" begin="5" end="30" step="5">
				<option value="${i}">${i}개씩 보기</option>
			</c:forEach>
		</select>
	</form>
	<c:if test="${!empty userInfo}">
		<form action="${path}/board/register">
			<input type="submit" value="글작성"/>
		</form>
	</c:if>
	<hr/>
	<table border="1">
		<tr>
			<th>BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REGDATE</th>
			<th>VIEWCNT</th>
		</tr>
		<c:choose>
			<c:when test="${!empty list}">
				<!-- 게시글 리스트 목록 출력 -->
				<c:forEach var="board" items="${list}">
					<tr>
						<td>${board.bno}</td>
						<td>${board.title}</td>
						<td>${board.writer}</td>
						<td>${board.regdate}</td>
						<td>${board.viewcnt}</td>
					</tr>
				</c:forEach>
				<!-- 페이징 블럭 출력 -->
				<tr>
					<th colspan="5">
						<c:if test="${pm.first}">
							<a href="${pm.makeQuery(1)}">[처음]</a>
						</c:if>
						<c:if test="${pm.prev}">
							<a href="${pm.makeQuery(pm.prevPage)}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
							<a href="${pm.makeQuery(i)}">[${i}]</a>
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="${pm.makeQuery(pm.nextPage)}">[다음]</a>
						</c:if>
						<c:if test="${pm.last}">
							<a href="${pm.makeQuery(pm.maxPage)}">[마지막]</a>
						</c:if>
					</th>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 게시물이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</body>
</html>









