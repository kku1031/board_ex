<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf"%>
<div class="container">
<div class="searchArea">
	<form action="${contextPath}/board/list" id="searchFrom">		
		<select name="type">
			<option value="">===</option>
			<option value="T" ${pageMarker.criteria.type eq 'T' ? 'selected':''}>제목</option>
			<option value="C" ${pageMarker.criteria.type eq 'C' ? 'selected':''}>내용</option>
			<option value="W" ${pageMarker.criteria.type eq 'W' ? 'selected':''}>작성자</option>
		</select>		
		<input type="text" class="form-control" name="keyword" value="${pageMarker.criteria.keyword}">
		<button class="btn btn-primary">검색</button>
	</form>
</div>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>수정일</th>
		</tr>
		<c:if test="${not empty list}">
		<c:forEach items="${list}" var="b">
			<tr>
				<td>${b.bno}</td>
				<td><a href="get?bno=${b.bno}">${b.title}</a></td>
				<td>${b.writer}</td>
				<td><fmt:parseDate var="regDate" value="${b.regDate}"
						pattern="yyyy-MM-dd'T'HH:mm:ss" /> <fmt:formatDate
						value="${regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				<td><fmt:parseDate var="updateDate" value="${b.updateDate}"
						pattern="yyyy-MM-dd'T'HH:mm:ss" /> <fmt:formatDate
						value="${updateDate}" pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5">
					게시글이 존재하지 않습니다.
				</td>
			</tr>
		</c:if>
	</table>
<form action="${contextPath}/board/list" id="pageForm">
	<input type="hidden" name="page" value="${pageMarker.criteria.page}">
	<input type="hidden" name="type" value="${pageMarker.criteria.type}">
	<input type="hidden" name="keyword" value="${pageMarker.criteria.keyword}">
	<ul class="pagination">
		<c:if test="${pageMarker.prev}">
			<li class="page-item">
				<a class="page-link" href="${pageMarker.startPage-1}">[이전페이지]</a></li>
		</c:if>
		<c:forEach begin="${pageMarker.startPage}" end="${pageMarker.endPage}" var="pageNum">
			<li class="page-item ${pageMarker.criteria.page == pageNum ? 'active':''}">
				<a href="${pageNum}" class="page-link">${pageNum}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMarker.next}">
			<li class="page-item">
				<a href="${pageMarker.endPage+1}" class="page-link">[다음페이지]</a></li>
		</c:if>
	</ul>
</form>

	<a href="${pageContext.request.contextPath}/board/register"
		class="btn btn-primary">글 등록</a>

	<c:if test="${not empty message}">
	${message}
</c:if>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jspf"%>
<script>
$(function() {
	let pageForm = $('#pageForm');
	$('#pageForm a').on('click', function (e) {
		e.preventDefault();
		pageForm.find('input[name="page"]').val($(this).attr('href'));
		$('#pageForm').submit();
	});
})

</script>
