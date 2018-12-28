<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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


<!-- 링크 클릭시 넘어갈 actionForm -->
<form id="actionForm"></form>
<!-- 링크 클릭시 넘어갈 actionForm 끝 -->

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
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty cpNewList}">
									<c:forEach var="comp" items="${cpNewList}">
										<tr>
											<td><a class='movec' href='<c:out value="${comp.cp_Num}"/>'><c:out value="${comp.cp_Name}"></c:out></a> </td>
											<td><c:out value="${comp.cp_Id }"></c:out>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2" class="tac">오늘 가입한 업체가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-footer small text-muted">companies joined today</div>
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
								<th>공간명</th>
								<th>업체명</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty spNewList}">
									<c:forEach var="space" items="${spNewList}">
										<tr>
											<td><a class='moves' href='<c:out value="${space.sp_Num}"/>'><c:out value="${space.sp_Name}"></c:out></a> </td>
											<td><c:out value="${space.cp_Name }"></c:out>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2" class="tac">오늘 등록된 공간이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer small text-muted">Registered space today</div>
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
								<th>문의제목</th>
								<th>아이디</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty qNew}">
									<c:forEach var="qna" items="${qNew}">
										<tr>
											<td><a class='moveq' href='<c:out value="${qna.qna_Num}"/>'><c:out value="${qna.qna_Title}"></c:out></a> </td>
											<td><c:out value="${qna.qna_Name }"></c:out>
											<td><c:out value="${qna.qna_Date }"></c:out>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3" class="tac">오늘 등록된 문의가 없습니다..</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer small text-muted">Inquiries received today</div>
	</div>

	<!-- /.container-fluid -->


	<!-- /.container-fluid -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<script type="text/javascript">
	$(document).ready(function() {
	var actionForm = $("#actionForm");
		$(".movec").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='cp_Num' value='"
			+ $(this).attr("href")+ "'>");
			actionForm.attr("action", "/admin/comp/detail");
			actionForm.submit();
		});
		$(".moves").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='sp_Num' value='"
			+ $(this).attr("href")+ "'>");
			actionForm.attr("action", "/admin/space/detail");
			actionForm.submit();
		});
		$(".moveq").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='qna_Num' value='"
			+ $(this).attr("href")+ "'>");
			actionForm.attr("action","/admin/qna/detail");
			actionForm.submit();
		});
	});
</script>
</div>