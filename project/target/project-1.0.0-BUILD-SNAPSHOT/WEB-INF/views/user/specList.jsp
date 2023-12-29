<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


<jsp:include page="u_header.jsp"/>   
<div class="container mt-5 d-flex">
<jsp:include page="u_left.jsp"/>
	<div class="me-auto">
	<c:forEach var="pdSpec" items="${pspec}">
		<c:if test="${pdSpec.name() == pspecVal}">
		<h3 class="text-center">${pspecVal}</h3>
		<br>
	</c:if>
	</c:forEach>
		<c:forEach var="pdSpec" items="${pspec}">
		<c:if test="${pdSpec.name() != pspecVal}">
		<h3 class="text-center">${pdSpec.value}</h3>
		<br>
	</c:if>
	</c:forEach>
		<div class="d-flex">
		<c:set var="cnt" value="0"/>
		<c:forEach var="pDto" items="${list}">
			<c:set var="cnt" value="${cnt+1}"/>
				<%@ include file="card.jsp" %>
			<c:if test="${cnt%4==0}">
				</div><div class="d-flex mt-3">
			</c:if>
		</c:forEach>
		</div>		
	</div>
</div>
	
	
</div>

<jsp:include page="u_footer.jsp"/> 