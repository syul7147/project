<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Card -->
<div class="card me-2" style="width:200px">
  <a href="prodView.do?pnum=${pDto.pnum}&pspec=${pDto.pspec}" style="height:200px;overflow:hidden"> 	
  	<img class="card-img-top" 
  		src="<c:url value="/fileRepo/${pDto.pimage}"/>" 
  		alt="Card image" style="width:100%">
  </a>	
  <div class="card-body">
    <h5 class="card-title">${pDto.pname}</h5>
    <hr>
    <p class="card-text">KRW <fmt:formatNumber value="${pDto.price}"/></p>
    <!-- 로그인 되었을 경우 -->
    <c:if test="${sessionScope.id != null}">
    	<a href="cartAdd.do?pnum=${pDto.pnum}&pqty=1&pspec=${pDto.pspec}" class="btn btn-primary" style="width:100%">장바구니 담기</a>
    </c:if>
    <!-- 로그인 안되었을 경우 -->
    <c:if test="${sessionScope.id == null}">
    	<a href="javascript:alert('로그인이 필요합니다')" 
    		class="btn btn-primary" style="width:100%">장바구니 담기</a>
    </c:if>
  </div>

</div>
<!-- Card End-->