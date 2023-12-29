<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="ad_header.jsp"/>    
<!-- 컨텐츠 -->
<div class="container mt-5 border shadow p-5">	
	<h2>카테고리 등록</h2>
	
	<form action="categoryOk.do" method="post" name="cat_inputForm">
	  <div class="mb-3 mt-3">
	    <label for="c_code" class="form-label">카테고리 코드</label>
	    <input type="text" class="form-control" id="c_code" 
	    	placeholder="카테고리 코드 입력하세요" name="c_code">
	  </div>
	  <div class="mb-3">
	    <label for="c_name" class="form-label">카테고리명</label>
	    <input type="text" class="form-control" id="c_name" 
	    	placeholder="카테고리명을 입력하세요" name="c_name">
	  </div>
	<div class="text-center">
		<input type="button" class="btn btn-primary submit" value="등록" onclick="submit()"/>
		<input type="button" class="btn btn-secondary reset" value="취소"/>
	</div>
	</form>
</div>
<script>
	function submit(){
		$.ajax({
			url = "<c:url value='categoryOk.do'/>",
			type = "post",
			data = JSON.stringify(category),
			contentType:"application/json; charset=utf8",
			success:function(){
				
			}
			error:function(){
				alert("에러")
			}
		})
	}
	
</script>
<jsp:include page="ad_footer.jsp"/>    
