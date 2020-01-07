<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<style type="text/css">
th {
	text-align : center;
}

td {
	text-align : left;
}
</style>
<div class="container">
	<table class="table table-bordered">
		<tr>
			<th>글번호</th><td colspan="2">${view.cBoardNo }</td>
			<th>작성일</th><td colspan="4">${view.cBoardDate }</td>
		</tr>
		<tr>
			<th>제목</th><td colspan="5">${view.cBoardTitle }</td>
		</tr>
		<tr>
			<th>고객 번호</th><td colspan="2">${view.cusNo }</td>
			<th>작성자</th><td colspan="4">${view.staffName }</td>
		</tr>

		<tr>
			<th style="text-align:center;" colspan="6">본문</th>
		</tr>
		<tr>
			<td colspan="6">
				${view.cBoardContent }
			</td>
		</tr>
	</table>
	<br>
	<div class="text-right">
		<c:if test="${staffNo == view.staffNo }">
			<button class="btn btn-info" id="btnUpdate" onclick="location.href='/cs/update?cBoardNo=${view.cBoardNo}';">수정</button>
			<button class="btn btn-danger" id="btnDelete" data-toggle="modal" data-target="#deleteModal">삭제</button>
		</c:if>
		<button class="btn btn-primary" id="btnList" onclick="location.href='/cs/list';">목록</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>


<div class="modal fade" id="deleteModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">상담 내역</h4>
      </div>
      <div class="modal-body content">
        	상담 내역을 삭제하시겠습니까?
      </div>
      <div class="modal-footer">      		
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.href='/cs/delete?cBoardNo=${view.cBoardNo}';">삭제</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
















