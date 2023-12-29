<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	 ul {
	 	list-style:none;
	 }
	 
	 li>a{
	 	text-decoration:none;
	 }
	 .nav-link{
	 	color:black;
	 }
	 .nav-link:hover{
	 	color:black;
	 }
</style>
<aside class="border-end fixed" style="width:200px;">	
	<div class="nav-item " style="text-align:Left">
		<ul>
		<li><h4><a class="nav-link active" href="<c:url value='/user/home.do'/>">모던이프©</a></h4></li>
		</ul>
		<ul class="d-flex mList">
			<c:if test="${sessionScope.id==null}"><li><a class="nav-link" href ="<c:url value='/user/login.do'/>">LOGIN &nbsp</a></li></c:if><c:if test="${sessionScope.id!=null}"><li><a class="nav-link" href ="<c:url value='/user/userLogout.do'/>">LOGOUT &nbsp</a></li></c:if><li><a class="nav-link" href ="<c:url value='/user/join.do'/>">JOIN &nbsp</a></li><li><a class="nav-link" href ="<c:url value='/user/myPage.do'/>">MY PAGE</a></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<ul>
	<c:if test="${cDtos.size()!=0}">
		<c:forEach var="ps" items="${pspec}">
			<li>
				<a href="specList.do?pspec=${ps.value}">${ps.value}</a>
			</li>
		</c:forEach>
		
		<br>
		
		
		<c:forEach var="cDto" items="${cDtos}">
			<li><a href="catList.do?c_code=${cDto.c_code}&c_name=${cDto.c_name}">${cDto.c_name}</a></li>	
		</c:forEach>
	</c:if>
	<c:if test="${cDtos.size() ==0}">
		<li>카테고리 없음</li>
	</c:if>
	</ul><ul class='mt-3'>
	</ul>
		
</aside>