<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>  
<!DOCTYPE html>

<html lang="ko">
  <head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><tiles:getAsString name="title" /></title>

    <!-- Bootstrap core CSS-->
    
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin.css" rel="stylesheet">
    <style type="text/css">
    #content-wrapper {
   padding-left: 10px;
   overflow-x: hidden;
   width: 100%;
   padding-top: 1rem;
   padding-bottom: 80px;
}
    
    </style>
  </head>
<body id="page-top">

   <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
      <tiles:insertAttribute name="header" />
   </nav>
   <div id="wrapper">

      <tiles:insertAttribute name="left" />


      <div id="content-wrapper">
            <tiles:insertAttribute name="main" />
      </div>
   </div>

   <!-- Bootstrap core JavaScript-->
   <script src="/resources/vendor/jquery/jquery.min.js"></script>
   <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
   <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Page level plugin JavaScript-->
   <script src="/resources/vendor/chart.js/Chart.min.js"></script>
   <script src="/resources/vendor/datatables/jquery.dataTables.js"></script>
   <script src="/resources/vendor/datatables/dataTables.bootstrap4.js"></script>

   <!-- Custom scripts for all pages-->
   <script src="/resources/js/sb-admin.min.js"></script>


  </body>
</html>