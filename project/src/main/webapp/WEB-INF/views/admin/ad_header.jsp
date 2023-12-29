<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
	<title>Insert title here</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>           	
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<!--   	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"> -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
<header>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav w-100">
      <li class="nav-item">
        <a class="nav-link active" href="<c:url value='/user/home.do'/>">Shop</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="register.do">관리자 등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userList.do">유저 리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="category.do">카테고리 등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="categorySub.do">서브 카테고리 등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="categoryList.do">카테고리 리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="prod.do">상품등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="prodList.do">상품리스트</a>
      </li>
      <li class="nav-item ms-auto">
      <c:if test="${sessionScope.adminDTO.id != null}">
      	<span class="text-white">${sessionScope.adminDTO.name}님 환영합니다!! &nbsp; &nbsp; &nbsp;</span>
      </c:if>
      <c:if test="${sessionScope.adminDTO.id == null}">
        <a class="text-white" href="login.do">로그인</a>
        </c:if>
         <c:if test="${sessionScope.adminDTO.id != null}">
        <a class="text-white" href="logout.do">로그아웃</a>
        </c:if>
       
      </li>
    </ul>
  </div>
</nav>
</header>
</body>
</html>