<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div>
<div id="wrapper2">
<style type="text/css">
.product-bottom button{
	margin : 20px;
}
</style>

<script type="text/javascript">
function cancel(){
	history.go(-1);
}
</script>

<div class="product-bottom">
	<button type="button" class="btn btn-lg btn-outline-danger" data-toggle="modal" data-target="#myModal">이전</button>
	<button type="button" id="next-stage" class="btn btn-lg btn-outline-primary" style="float:right">다음</button>
</div>


<div id="myModal" class="modal fade">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">경고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>저장된 내용이 모두 사라집니다</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="cancel()">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- Custom scripts for all pages-->
<script src="/resources/js/add-product.js"></script>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>