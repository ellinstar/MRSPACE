<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<div id="content-wrapper" class="content-wrapper">
<!--    <h1 class="page-header">&nbsp;Confirm!</h1> -->

   <div class="container-fluid">

      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
      </ol>

      <!-- Icon Cards-->
      <div class="row">
         <div class="col-xl-3 col-sm-6 mb-3">

            <div class="card text-white bg-primary o-hidden h-100">

               <div class="card-body">

                  <div class="card-body-icon">
                     <!-- <i class="fas fa-fw fa-comments"></i> -->
                     <img class="d-block img-fluid" src="/resources/img/newmember.png">

                  </div>
                  <div class="mr-5">New Member!</div>

               </div>
               <!-- +창 -->
               <span class="badge badge-danger">42+</span> <a
                  class="card-footer text-white clearfix small z-1" href="#"> <span
                  class="float-left">신규회원</span> <span class="float-right"> <i
                     class="fas fa-angle-right"></i>
               </span>

               </a>
            </div>


         </div>
         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
               <div class="card-body">
                  <div class="card-body-icon">
                     <i class="fas fa-fw fa-list"></i>
                  </div>
                  <div class="mr-5">New Reservation!</div>
               </div>
               <!-- +창 -->
               <span class="badge badge-danger">9+</span> <a
                  class="card-footer text-white clearfix small z-1" href="#"> <span
                  class="float-left">예약결제</span> <span class="float-right"> <i
                     class="fas fa-angle-right"></i>
               </span>
               </a>
            </div>
         </div>
         <div class="col-xl-3 col-sm-6 mb-3"></div>
         <div class="col-xl-3 col-sm-6 mb-3"></div>
         
         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
               <div class="card-body">
                  <div class="card-body-icon">
                     <img class="d-block img-fluid" src="/resources/img/member.png">
                  </div>
                  <div class="mr-5">Member!</div>
               </div>

               <!-- +창 -->
               <span class="badge badge-danger">19+</span> <a
                  class="card-footer text-white clearfix small z-1" href="#"> <span
                  class="float-left">회원</span> <span class="float-right"> <i
                     class="fas fa-angle-right"></i>
               </span>
               </a>
            </div>
         </div>
         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
               <div class="card-body">
                  <div class="card-body-icon">
                     <img class="d-block img-fluid" src="/resources/img/company.png">
                  </div>
                  <div class="mr-5">New Company!</div>
               </div>

               <!-- +창 -->
               <span class="badge badge-danger">14+</span> <a
                  class="card-footer text-white clearfix small z-1" href="#"> <span
                  class="float-left">업체</span> <span class="float-right"> <i
                     class="fas fa-angle-right"></i>
               </span>
               </a>
            </div>
         </div>

         <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
               <div class="card-body">
                  <div class="card-body-icon">
                     <i class="fas fa-fw fa-list"></i>

                  </div>
                  <div class="mr-5">Space!</div>
               </div>

               <!-- +창 -->
               <span class="badge badge-danger">16+</span> <a
                  class="card-footer text-white clearfix small z-1" href="#"> <span
                  class="float-left">공간</span> <span class="float-right"> <i
                     class="fas fa-angle-right"></i>
               </span>
               </a>
            </div>
         </div>
      </div>




      <!-- DataTables 신규업체 -->
      <div class="card mb-3">
         <div class="card-header">
            <i class="fas fa-table"></i> 신규업체
         </div>
         <div class="card-body">
            <div class="table-responsive">
               <table class="table table-bordered" id="dataTable" width="100%"
                  cellspacing="0">
                  <thead>
                     <tr>
                        <th>업체명</th>
                        <th>아이디</th>
                        <th>가입신청일</th>

                     </tr>
                  </thead>
                  <tfoot>
                     <tr>
                        <th>wework</th>
                        <th>wework</th>
                        <th>2018-12-10</th>
                  </tfoot>
                  <tbody>
                     <tr>
                        <th>wework</th>
                        <th>wework</th>
                        <th>2018-12-10</th>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="card-footer small text-muted">Updated yesterday at
            11:59 PM</div>
      </div>

   </div>
   <!-- /.container-fluid -->

   <!-- DataTables 신규공간 -->
   <div class="card mb-3">
      <div class="card-header">
         <i class="fas fa-table"></i> 신규공간
      </div>
      <div class="card-body">
         <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
               cellspacing="0">
               <thead>
                  <tr>
                     <th>업체명</th>
                     <th>공간명</th>
                     <th>등록신청일</th>
                  </tr>
               </thead>
               <tfoot>
                  <tr>
                     <th>1stHQ</th>
                     <th>종로1stHQ</th>
                     <th>2018-12-10</th>
                  </tr>
               </tfoot>
               <tbody>
                  <tr>
                     <th>1stHQ</th>
                     <th>종로1stHQ</th>
                     <th>2018-12-10</th>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
      <div class="card-footer small text-muted">Updated yesterday at
         11:59 PM</div>
   </div>

   <!-- /.container-fluid -->

   <!-- DataTables 신규문의 -->
   <div class="card mb-3">
      <div class="card-header">
         <i class="fas fa-table"></i> 신규문의
      </div>
      <div class="card-body">
         <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
               cellspacing="0">
               <thead>
                  <tr>
                     <th>문의내용</th>
                     <th>아이디</th>
                     <th>등록일</th>
                  </tr>
               </thead>
               <tfoot>
                  <tr>
                     <th>결제가 안됩니다!!</th>
                     <th>destiny1116</th>
                     <th>2018-12-10</th>
                  </tr>
               </tfoot>
               <tbody>
                  <tr>
                     <th>공간 문의드립니다.</th>
                     <th>destiny1116</th>
                     <th>2018-12-10</th>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
      <div class="card-footer small text-muted">Updated yesterday at
         11:59 PM</div>
   </div>

   <!-- /.container-fluid -->


   <!-- /.container-fluid -->
   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
   </a>
</div>