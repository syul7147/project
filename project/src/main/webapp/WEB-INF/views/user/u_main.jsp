<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<jsp:include page="u_header.jsp"/>
<!-- 컨텐츠 -->
<div class="container mt-5 d-flex">
	
<jsp:include page="u_left.jsp"/>   
<div class="main">
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
  </div>

  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<c:url value="/imgs/20231215_pc1.jpg"/>" alt=".." class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/imgs/20231215_pc2.jpg"/>" alt=".." class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/imgs/20231215_pc3.jpg"/>" alt=".." class="d-block w-100">
    </div>


  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

	<div class="card">
	<c:forEach var="key" items="${key}">
	<c:if test="${map[key].size() == 0}">
		${key}상품이 없습니다!!	
	</c:if>	
	<c:if test="${map[key].size() != 0}">
		<h1 class="text-center">${key}</h1>
		<h5 class="text-center">weekly ${key}</h5>
		<br>
		
		<div class="d-flex">
			<c:set var="cnt" value="0"/>
		<c:forEach var="pDto" items="${map[key]}">
		<c:set var="cnt" value="${cnt+1}"/>
		<%@ include file="card.jsp" %>
			<c:if test="${cnt%4==0}">
				</div><div class="d-flex mt-3">
			</c:if>
		</c:forEach>
		</div>
	</c:if>
	</c:forEach>
	</div>
	</div>
</div>
</div>
<jsp:include page="u_footer.jsp"/> 