<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin.css" rel="stylesheet">

<style type="text/css">
/* 헤더 css 지우기 */
#wrapper{
	min-height:0px;
	margin : 0px;
}
</style>

    <!-- Sidebar -->
<!--     <ul class="sidebar navbar-nav"> -->
<!--       <li class="nav-item active"> -->
<!--         <a class="nav-link" href="index.html"> -->
<!--           <i class="fas fa-fw fa-tachometer-alt"></i> -->
<!--           <span>Dashboard</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--           <i class="fas fa-fw fa-folder"></i> -->
<!--           <span>Pages</span> -->
<!--         </a> -->
<!--         <div class="dropdown-menu" aria-labelledby="pagesDropdown"> -->
<!--           <h6 class="dropdown-header">Login Screens:</h6> -->
<!--           <a class="dropdown-item" href="login.html">Login</a> -->
<!--           <a class="dropdown-item" href="register.html">Register</a> -->
<!--           <a class="dropdown-item" href="forgot-password.html">Forgot Password</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <h6 class="dropdown-header">Other Pages:</h6> -->
<!--           <a class="dropdown-item" href="404.html">404 Page</a> -->
<!--           <a class="dropdown-item" href="blank.html">Blank Page</a> -->
<!--         </div> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="charts.html"> -->
<!--           <i class="fas fa-fw fa-chart-area"></i> -->
<!--           <span>Charts</span></a> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="tables.html"> -->
<!--           <i class="fas fa-fw fa-table"></i> -->
<!--           <span>Tables</span></a> -->
<!--       </li> -->
<!--     </ul> -->

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
<!--           <div class=" col-sm-6 mb-3"> -->
<!--             <div class="card text-white bg-primary o-hidden h-100"> -->
<!--               <div class="card-body"> -->
<!--                 <div class="card-body-icon"> -->
<!--                   <i class="fas fa-fw fa-life-ring"></i> -->
<!--                 </div> -->
<!--                 <div class="mr-5">13 New Tickets!</div> -->
<!--               </div> -->
<!--               <a class="card-footer text-white clearfix small z-1" href="#"> -->
<!--                 <span class="float-left">View Details</span> -->
<!--                 <span class="float-right"> -->
<!--                   <i class="fas fa-angle-right"></i> -->
<!--                 </span> -->
<!--               </a> -->
<!--             </div> -->
<!--           </div> -->
        </div>

        <!-- Area Chart Example-->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            차트 서비스 준비중</div>
          <div class="card-body">
            <canvas id="myAreaChart" width="100%" height="30"></canvas>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
                  <tr>
                    <th>서비스 준비중</th>
                    <th>서비스 준비중</th>
                    <th>서비스 준비중</th>
                    <th>서비스 준비중</th>
                    <th>서비스 준비중</th>
                    <th>서비스 준비중</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>서비스 준비중</td>
                    <td>서비스 준비중</td>
                    <td>서비스 준비중</td>
                    <td>서비스 준비중</td>
                    <td>서비스 준비중</td>
                    <td>서비스 준비중</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
