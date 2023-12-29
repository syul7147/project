<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<jsp:include page="u_header.jsp"/>
<div class="container mt-5 d-flex">
<jsp:include page="u_left.jsp"/>
<div>
	<div class="me-auto">
	<c:forEach var="pdSpec" items="${pspec}">
		<c:if test="${pdSpec.value == pspecs}">
		<h3>상품정보[${pdSpec.name()}]</h3>
		</c:if>
	</c:forEach>
	<ul class="d-flex" style="list-style:none">
		<!-- 상품이미지 -->
		<li class="me-5">
			<img src="<c:url value="/fileRepo/${pDto.pimage}"/>" width="220px"/>
		</li>
		<!-- 상품 상세내용 -->
		<li>
			<form name="prodForm" method="post">
				상품번호 : ${pDto.pnum} <br> 
				상품이름 : ${pDto.pname} <br>
				상품가격 : <fmt:formatNumber value="${pDto.price}"/> <br>
				상품포인트 : <fmt:formatNumber value="${pDto.point}"/> <br>
				상품수량 : <input type="text" name="pqty" size=3 
							value="1"/>개<br>
				<p class="mt-3"><b>[상품 소개]</b><br>
					${pDto.pcontent}
				</p>
				<!-- 로그인 되었을 경우 -->
				<c:if test="${sessionScope.id != null}">
			    	<a href="javascript:goCart(${pDto.pnum})" 
			    		class="btn btn-sm btn-primary">장바구니 담기</a>
			    </c:if>
			    <!-- 로그인 안되었을 경우 -->
			    <c:if test="${sessionScope.id == null}">
			    	<a href="javascript:alert('로그인이 필요합니다')" 
			    		class="btn btn-sm btn-primary">장바구니 담기</a>
			    </c:if>
				
				<a href="<c:url value="/user/home.do"/>" 
					class="btn btn-sm btn-outline-primary">계속 쇼핑하기</a>
			</form>
		</li>
	</ul>
	</div>
</div>
</div>
<script>
	function goCart(pnum){
		document.prodForm.action="cartAdd.do?pnum="+pnum;
		document.prodForm.submit();
	}
</script>

<jsp:include page="u_footer.jsp"/> 