
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
    .container {
        width: 800px;
        margin: 0 auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f4f4f4;
    }
    a {
        text-decoration: none;
        color: #0000EE;
    }
    a:hover {
        text-decoration: underline;
    }
    form {
        margin-bottom: 20px;
    }
</style>
<div class="container">
    <br/>
    <hr/>
    <!-- 검색 폼 -->
    <form action="${path}/inquiry/list">
        <select name="searchType">
            <option value="n">---------------------------</option>
            <option value="t">TITLE</option>
            <option value="c">CONTENT</option>
            <option value="u">USER</option>
            <option value="tc">TITLE &amp; CONTENT</option>
            <option value="tu">TITLE &amp; USER</option>
            <option value="tcu">TITLE &amp; CONTENT &amp; USER</option>
        </select>
        <input type="text" name="keyword" placeholder="검색할 키워드를 작성해주세요."/>
        <input type="submit" value="검색"/>
        <select name="perPageNum" onchange="this.form.submit();">
            <c:forEach var="i" begin="5" end="30" step="5">
                <option value="${i}" ${i == perPageNum ? 'selected' : ''}>${i}개씩 보기</option>
            </c:forEach>
        </select>
    </form>

    <!-- 문의 등록 버튼 (로그인한 사용자에게만 표시) -->
    <c:if test="${!empty member}">
        <form action="${path}/inquiry/register">
            <input type="submit" value="문의 등록"/>
        </form>
    </c:if>
    <hr/>

    <!-- 문의 목록 테이블 -->
    <table>
        <tr>
            <th>ID</th>
            <th>TITLE</th>
            <th>USER</th>
            <th>CREATED AT</th>
            <th>STATUS</th>
        </tr>
        <c:choose>
            <c:when test="${!empty list}">
                <!-- 문의 목록 출력 -->
                <c:forEach var="inquiry" items="${list}">
                    <tr>
                        <td>${inquiry.inquiry_id}</td>
                        <td><a href="${path}/inquiry/read?inquiry_id=${inquiry.inquiry_id}">${inquiry.title}</a></td>
                        <td>${inquiry.user_id}</td>
                        <td>${inquiry.created_at}</td>
                        <td>${inquiry.status}</td>
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
                    <td colspan="5">등록된 문의가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</div>
</body>
</html>
