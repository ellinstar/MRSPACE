<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
   <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="/">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>MRSPACE HOME</span>
          </a>
        </li>
        <!-- 예약관리 -->
         <li class="nav-item">
          <a class="nav-link" href="/admin/reserv">
            <i class="fas fa-fw fa-table"></i>
            <span>예약관리</span></a>
        </li>
         <!-- 게시판관리 -->
           <li class="nav-item">
          <a class="nav-link" href="/admin/board">
            <i class="fas fa-fw fa-table"></i>
            <span>게시판관리</span></a>
        </li>
         <!-- 업체관리 -->
           <li class="nav-item">
          <a class="nav-link" href="/admin/comp">
            <i class="fas fa-fw fa-table"></i>
            <span>업체관리</span></a>
        </li>
         <!-- 회원관리 -->
           <li class="nav-item">
          <a class="nav-link" href="/admin/mem">
            <i class="fas fa-fw fa-table"></i>
            <span>회원관리</span></a>
        </li>
         <!-- 통계 -->
        <li class="nav-item">
          <a class="nav-link" href="/admin/graph">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>통계</span></a>
        </li>
     
      </ul>
