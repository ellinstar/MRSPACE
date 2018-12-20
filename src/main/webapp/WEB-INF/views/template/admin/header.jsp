<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<a class="navbar-brand mr-1" href="/admin/main">SPACE ADMIN</a>
<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
	id="sidebarToggle" href="#">
	<i class="fas fa-bars"></i>
</button>

<!-- Navbar Search -->
<!-- <form
	class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
	<div class="input-group">
		<input type="text" class="form-control" placeholder="Search for..."
			aria-label="Search" aria-describedby="basic-addon2">
		<div class="input-group-append">
			<button class="btn btn-primary" type="button">
				<i class="fas fa-search"></i>
			</button>
		</div>
	</div>
</form>
 -->
<!-- Navbar -->
<div class="container">
	
	<ul class="navbar-nav">
		<li><a class="btn btn-primary" id="logout" href="/adminlogout">로그아웃 </a></li>

	</ul>
</div>

<style type="text/css">
#logout {
	margin-left: 1330px;
}

</style>