<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<jsp:include page="u_header.jsp"/>
<div class="container mt-5 d-flex">
<jsp:include page="u_left.jsp"/>

	<div class="me-auto">
	<h3 class="text-center">${catName}</h3>
	<c:forEach var="csDto" items="${slist}">
	<h5 class="text-center"><a href="subList.do?c_subname=${csDto.c_subname}&c_code=${csDto.c_code}&c_name=${catName}">${csDto.c_subname}</a></h5>
	</c:forEach>
	<c:if test="${lists.size() == 0}">
		<p>상품이 존재하지 않습니다!!</p>
	</c:if>
	<c:if test="${lists.size() != 0}">
		<div class="d-flex">
			<c:set var="cnt" value="0"/>
			<c:forEach var="pDto" items="${lists}">
				<c:set var="cnt" value="${cnt+1}"/>
					<%@ include file="card.jsp" %>
				<c:if test="${cnt%4==0}">
					</div><div class="d-flex mt-3">
				</c:if>
			</c:forEach>
		</div>		
	</c:if>
	</div>
</div>
</div>

<jsp:include page="u_footer.jsp"/> 
