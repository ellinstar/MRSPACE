<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<style>
ul.navbar-nav {
	margin-bottom: 35px;
}
</style>

<a class="navbar-brand mr-1" href="/admin/main">MRSPACE ADMIN</a>
<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
	id="sidebarToggle" href="#">
	<i class="fas fa-bars"></i>
</button>
<!-- Navbar -->
<div class="container">

	<ul class="navbar-nav">
		<li><a class="btn btn-primary" id="logout" href="/adminlogout"
			style="right: 0; position: absolute; margin-right: 10px;">로그아웃 </a></li>

	</ul>
</div>

<style type="text/css">
#logout {
	margin-left: 1330px;
}
</style>