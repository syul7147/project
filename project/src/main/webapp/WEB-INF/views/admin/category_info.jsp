<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<jsp:include page="ad_header.jsp"/>
<div class="text-center mt-3">
  <h4>카테고리 수정</h4>
  <form action="<c:url value="modify.do"/>" method="post">
	  <div class="form-group">
	    <label for="c_code">번호</label>        
	  	<input class="form-control" type="text" id="c_num" 
	  		name="c_num" value="${cDto.c_num}" readonly>
	  </div> 
	  <div class="form-group">
	     	<label for="subject">카테고리</label>     
	  	<input class="form-control" type="text" id="c_code" 
	  		name="c_code" value="${cDto.c_code}">      
	     </div>
	  <div class="form-group">
	     	<label for="subject">카테고리</label>     
	  	<input class="form-control" type="text" id="c_name" 
	  		name="c_name" value="${cDto.c_name}">      
	     </div>	     
	     <div class="text-center mt-3">
	     	<!-- button 태그의 type이 생략되면 form태그안에서는 submit이 된다. -->
	        <button id="btn-modify" class="btn btn-primary me-2">수정하기</button>   
	        <button type="button" id="btn-remove" class="btn btn-danger me-2" onclick="remove()">삭제하기</button>   
	        <button type="button" id="btn-list" class="btn btn-primary" onclick="list()">리스트</button>   
	     </div>
     </form>
</div>
<script>
	// 아래의 람다식과 같다
/* 	$("#btn-list").click(function(){
		location.href="<c:url value='/board/list.do'/>";
	}); */
	
	// 람다식, =>(화살표 연산자), =>의 왼쪽 파라미터, 오른쪽 리턴값or명령코드
/* 	$("#btn-list").click(()=>{
		location.href="<c:url value='/admin/categoryList.do'/>";
	}); */
	function list(){
		location.href="<c:url value='/admin/categoryList.do'/>";
	}
	
	function remove(){
		location.href="<c:url value='/admin/remove.do?c_num=${cDto.c_num}'/>";
	};
</script>
</body>
</html>

<jsp:include page="ad_footer.jsp"/>








