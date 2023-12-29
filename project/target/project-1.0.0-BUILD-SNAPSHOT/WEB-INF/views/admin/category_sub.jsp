<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="ad_header.jsp"/>    
<!-- 컨텐츠 -->
<div class="container mt-5 border shadow p-5">	
	<h2>카테고리 등록</h2>
	
	<form action="categorySub.do" method="post" name="cat_inputForm">
	  <div class="mb-3 mt-3">
	                  <select class="form-select form-select-sm" name="c_code"> 
                  	   <c:if test="${cDto == null || cDto.size() == 0}">                       
                        		<option value="">카테고리 없음</option>
                        </c:if>
                        <c:if test="${cDto != null || cDto.size() != 0}">
                         	<c:forEach var="dto" items="${cDto}">
                         		<option value="${dto.c_code}">${dto.c_name}[${dto.c_code}]</option>
                          </c:forEach>   
                        </c:if>
                  </select>
	  </div>
	  <div class="mb-3">
	    <label for="c_subname" class="form-label">카테고리명</label>
	    <input type="text" class="form-control" id="c_subname" 
	    	placeholder="카테고리명을 입력하세요" name="c_subname">
	  </div>
	<div class="text-center">
		<input type="submit" class="btn btn-primary" value="등록"
			onclick="inputChk()"/>
		<input type="reset" class="btn btn-secondary" value="취소"/>
	</div>
	</form>
</div>
<script>
	function inputChk(){
		if(!cat_inputForm.c_code.value){ //code값이 null이면 
			alert("카테고리 코드를 입력하세요!!!!");
			cat_inputForm.code.focus();
			return;
		}
		if(!cat_inputForm.c_subname.value){ //catSubName값이 null이면 
			alert("카테고리명을 입력하세요!!!!");
			cat_inputForm.c_subname.focus();
			return;
		}
		document.cat_inputForm.submit();
	}
</script>
<jsp:include page="ad_footer.jsp"/>    
