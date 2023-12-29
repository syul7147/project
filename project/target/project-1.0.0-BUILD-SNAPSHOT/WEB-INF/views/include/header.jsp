<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
  	
  	<!-- css customize -->
  	<link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body>
	<div class="container pt-5">		
		<h3>ACADEMY</h3>
	</div>
	<nav class="navbar navbar-expand-sm sticky-top">
	  <div class="container">
	    <ul class="navbar-nav w-100">
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value="/"/>">Home</a>
	      </li>
	     <li class="nav-item">
	        <a class="nav-link" href="<c:url value="/board/list.do"/>">게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value="/member/memberList.do"/>">회원리스트</a>
	      </li>
	      <li class="nav-item ms-auto d-flex">
	        <c:if test="${sessionScope.loginDto.id == null}">
	        	<a class="nav-link btn btn-outline-light login" 
	        		href="<c:url value="/member/login.do"/>">로그인</a>
	        	<a class="nav-link btn btn-outline-light register" 
	        		href="<c:url value="/member/memberRegister.do"/>">회원가입</a>
	        </c:if>
	        
	        <c:if test="${sessionScope.loginDto.id != null}">
	        	<a class="me-3 myProfile" type="button" href="<c:url value="/member/myProfile.do"/>"><i class="fa fa-user-circle"></i> ${sessionScope.loginDto.name}</a>
	        	<a class="nav-link btn btn-outline-light login" 
	        		href="javascript:logout()">로그아웃</a>
	        </c:if>	
	      </li>
	    </ul>
	  </div>
	</nav>
	<script>
		function logout(){
			location.href="<c:url value="/member/logout.do"/>";
		}
	</script>
	
	
	