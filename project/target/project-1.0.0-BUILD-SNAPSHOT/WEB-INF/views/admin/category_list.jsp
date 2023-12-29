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
				<th>번호</th>
				<th>코드</th>
				<th>카테고리명</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${cDto}">
			<tr>
				<td>${dto.c_num}</td>
				<td>${dto.c_code}</td>
				<td><div class="dropdown dropend">
  					<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">${dto.c_name}
  					</button>
				  <ul class="dropdown-menu">
				  <c:forEach var="sdto" items="${sDto}">
				  	<c:if test="${dto.c_code==sdto.c_code}">
				  		<c:if test="${sdto.c_subname != null}">
				    	<li><a class="dropdown-item" href="subInfo.do?c_num=${sdto.c_num}">${sdto.c_subname}</a></li>
				    	</c:if>
				    	<c:if test="${sdto.c_subname == null}">
				    	<td>카테고리가 존재하지 않습니다</td>
				    	</c:if>
				  	</c:if>
				  </c:forEach>
				  </ul>
				</div>
				</td>
				<td><a href="catInfo.do?c_num=${dto.c_num}" class="btn btn-sm btn-outline-danger">수정</a></td>
				<td><a href="catDelete.do?code=${dto.c_code}" class="btn btn-sm btn-outline-danger">삭제</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="ad_footer.jsp"/>








