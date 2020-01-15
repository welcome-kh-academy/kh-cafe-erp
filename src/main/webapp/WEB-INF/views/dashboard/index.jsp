<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin.css" rel="stylesheet">

<script type="text/javascript">
$(document).ready( function () {
	
	//파이 차트 가져오기
	$.ajax({
		  url: "/dashboard/pieChart",
		  method: "GET",
		  success: function (result) {
			  getPieChart(result.pieChart);
		  }
	});
	
	//막대 차트 가져오기
	$.ajax({
		  url: "/dashboard/barChart",
		  method: "GET",
		  success: function (result) {
			  getBarChart(result.barChart);
		  }
	});
});

</script>

<style type="text/css">
/* 헤더 css 지우기 */
#wrapper{
	min-height:0px;
	margin : 0px;
}
</style>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item active">대쉬보드</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
          <div class=" col-sm-4 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">CS</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="/cs/list">
                <span class="float-left">이동하기</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class=" col-sm-4 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-coffee"></i>
                </div>
                <div class="mr-5">KH cafe 홈페이지</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">이동하기</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class=" col-sm-4 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">주문 관리</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="/order/orderlist">
                <span class="float-left">이동하기</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
        </div>

        <!-- Area Chart Example-->
        <div class="container-fluid">

        <div class="row">
          <div class="col-lg-8">
            <div class="card mb-3">
              <div class="card-header">
                <i class="fas fa-chart-bar"></i>
                	최근 7일 판매량</div>
              <div class="card-body">
                <canvas id="myBarChart" width="100%" height="50"></canvas>
              </div>
              <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card mb-3">
              <div class="card-header">
                <i class="fas fa-chart-pie"></i>
                Best 판매상품</div>
              <div class="card-body">
                <canvas id="myPieChart" width="100%" height="100"></canvas>
              </div>
              <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>
          </div>
        </div>

      </div>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            공지사항</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr class="text-white bg-primary">
                    <th>No</th>
                    <th>제목</th>
                    <th>지점</th>
                    <th>작성자</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${notice }" var="notice">
                  <tr>
					<td>${notice.nBoardNo }</td>
					<td><a style="color:black" href="/notice/view?nBoardNo=${notice.nBoardNo }">${notice.nBoardTitle }</a></td>
					<td>${notice.shopName }</td>
					<td>${notice.staffName }</td>
					<td>${notice.nBoardDate }</td>
                  </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
<!--           <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
        </div>

      </div>
      <!-- /.container-fluid -->

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<!-- Demo scripts for this page-->
<script src="/resources/js/chart/chart-bar-demo.js"></script>
<script src="/resources/js/chart/chart-pie-demo.js"></script>







