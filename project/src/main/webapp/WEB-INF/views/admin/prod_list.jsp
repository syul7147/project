
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<c:if test="${requestScope.msg !=null}">
	<script>
		alert("${requestScope.msg}");
	</script>
</c:if>

<jsp:include page="ad_header.jsp"/>

<!-- 컨텐츠 -->
<div class="container w-75 mt-5">
	<h3>상품 리스트</h3>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>					
				<th>카테고리 명</th>
				<th>하위 카테고리 명</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>가격</th>
				<th>제조사</th>
				<th>사이즈</th>				
				<th>수량</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${requestScope.list}">
				<tr>
					<td>${dto.pnum}</td>
					<td>${dto.pcategory_fk}</td>
					<td>${dto.psubcategory_fk}</td>
					<td>
						<img src="<c:url value="/fileRepo/${dto.pimage}"/>" width="60px"/>
					</td>
					<td>${dto.pname}</td>
					<td>${dto.price}</td>
					<td>${dto.pcompany}</td>
					<td>${dto.psize}</td>
					<td>${dto.pqty}</td>
			
					<td>
						<a href="prodUpdate.do?pnum=${dto.pnum}" class="btn btn-sm btn-info">수정</a>
						<a href="prodDel.do?pnum=${dto.pnum}" class="btn btn-sm btn-danger">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<jsp:include page="ad_footer.jsp"/>








