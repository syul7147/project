<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>           	
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<!--   	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"> -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  	
  	<link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body>
<header>	
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid mt-5 left " style="float:right">
    <ul class="navbar-nav w-100 left" >
            <li class="nav-item ms-auto me-40">
            <div class="dropdown">
      	<button type="button" class="btn dropdown" data-bs-toggle="dropdown">
      	<img src="<c:url value="/fileRepo/top_ico2.png"/>" height="20px" width="16px" />
  		</button>
  		<ul class="dropdown-menu text-center">
      <c:if test="${sessionScope.id == null }">      
	      <li class="nav-item ms-auto">
	        <a class="nav-link" href="userLogin.do">로그인</a>
	      </li>
      </c:if>
      <c:if test="${sessionScope.id == null }">
	      <li class="nav-item">
	        <a class="nav-link" href="join.do">회원가입</a>
	      </li>
      </c:if>
  		<c:if test="${sessionScope.id == null }">
  		<li class="nav-item"><a href="#">마이페이지</a></li>
      </c:if>
      <c:if test="${sessionScope.id != null && sessionScope.mode == 'user'}">      
	      <li class="nav-item">
	        <a class="nav-link" href="userLogout.do">로그아웃</a>
	      </li>
      </c:if>
      <c:if test="${sessionScope.id != null && sessionScope.mode == 'admin'}">      
	      <li class="nav-item">
	        <a class="nav-link" style="display:inline-block;" href="<c:url value='../admin/logout.do'/>">관리자 로그아웃</a>
	        <a class="nav-link" style="display:inline-block;" href="<c:url value='../admin/home.do'/>">관리자 홈</a>
	      </li>
      </c:if>
  		
  		</ul>
      </div>	
      </li>      
	      <li class="nav-item">
	        <a class="nav-link" href="cartList.do"><img src="<c:url value="/fileRepo/top_ico4.png"/>" height="20px" width="16px" class="float-end"/></a>
	      </li>

      
      
      
    </ul>
  </div>
</nav>
</header>