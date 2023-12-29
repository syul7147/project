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
<div class="container mt-5 border shadow p-5">	
	<h2>카테고리 리스트</h2>
	<table class="table">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${mDto}">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.tel}</td>
				<td><a href="userDelete.do?id=${dto.id}" class="btn btn-sm btn-outline-danger">삭제</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="ad_footer.jsp"/>








