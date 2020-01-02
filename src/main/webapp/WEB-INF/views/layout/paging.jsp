<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="text-align:center;">
	<nav aria-label="Page navigation example">
		<ul class="pagination">

			<!-- 처음으로 가기 -->
			<c:if test="${paging.curPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="/notice/list?curPage=1&&search=${param.search }">&larr;처음</a></li>
			</c:if>

			<!-- 이전 페이징 리스트로 가기 -->
			<c:if test="${paging.startPage gt paging.pageCount }">
				<li class="page-item"><a class="page-link"
					href="/notice/list?curPage=${paging.startPage - paging.pageCount }&search=${param.search }">&laquo;</a></li>
			</c:if>
			<c:if test="${paging.startPage le paging.pageCount }">
				<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
			</c:if>

			<!-- 이전 페이지로 가기 -->
			<c:if test="${paging.curPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="/notice/list?curPage=${paging.curPage - 1 }&search=${param.search }">&lt;</a></li>
			</c:if>

			<!-- 페이징 리스트 -->
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="i">
				<c:choose>
					<c:when test="${paging.curPage eq i }">
						<li class="page-item active"><a class="page-link"
							href="/notice/list?curPage=${i }&search=${param.search }">${i }</a>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="/notice/list?curPage=${i }&search=${param.search }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 페이지로 가기 -->
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="/notice/list?curPage=${paging.curPage + 1 }&search=${param.search }">&gt;</a></li>
			</c:if>

			<!-- 다음 페이징 리스트로 가기 -->
			<c:if test="${paging.endPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="/notice/list?curPage=${paging.startPage + paging.pageCount }&search=${param.search }">&raquo;</a></li>
			</c:if>
			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
			</c:if>

			<!-- 끝 페이지로 가기 -->
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="/notice/list?curPage=${paging.totalPage }&search=${param.search }">&rarr;끝</a></li>
			</c:if>

		</ul>
	</nav>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

