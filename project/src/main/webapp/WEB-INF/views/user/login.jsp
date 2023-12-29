<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body>
<c:if test="${msg != null}">
	<script>
		alert("${msg}")
	</script>
</c:if>

<jsp:include page="u_header.jsp"/>
<div class="container mt-5 d-flex">
<jsp:include page="u_left.jsp"/>
<div >
<h2>로그인</h2>
  <form action="userLoginOk.do" method="post">
  <input type="hidden" class="form-control" id="moveUrl" name="moveUrl" value="${moveUrl}">
    <div class="mb-3 mt-3">
      <label for="email">아이디</label>
      <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
       <input type="hidden" id="isIdCheck" value="no"/>
      <c:if test="${loginErr == 'idErr'}">
      <p class="text-danger">아이디를 입력하세요</p>
      </c:if>
    </div>
    <div class="mb-3">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
        <c:if test="${loginErr == 'pwdErr'}">
      <p class="text-danger">비밀번호를 확인하세요</p>
      </c:if>
    </div>
<!-- modal-->

<!-- The Modal -->
<div class="modal fade" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">댓글 달기</h5>
      </div>

      <!-- Modal body -->
      <div class="modal-body p-4">
      	<div class="mb-3">
      		<label>댓글 내용</label>
      		<textarea class="form-control" id="r_contents"></textarea>
      	</div>
      	<div class="mb-3">
      		<label>댓글 작성자</label>
      		<input type="text" class="form-control" id="replyer" name="replyer"/>
      	</div>
      	<div class="mb-3">
      		<label>등록일</label>
      		<input type="text" class="form-control" id="r_date" name="r_date"/>
      	</div>
      	
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" id="btn-modal-modify" class="btn btn-sm btn-success">수정</button>
        <button type="button" id="btn-modal-remove" class="btn btn-sm btn-danger">삭제</button>
        <button type="button" id="btn-modal-register" class="btn btn-sm btn-primary">등록</button>
        <button type="button" id="btn-modal-close" class="btn btn-sm btn-secondary">닫기</button>
      </div>
    </div>
  </div>
</div> 
<!-- 버튼 -->
    <button type="submit" class="btn btn-primary">로그인</button>
    	<div class="mt-3 w-100 findIdPw">
		<div class="d-flex justify-content-between">
			<div><i class="fa fa-lock"></i> <a href="<c:url value="idPwFind.do?find=id"/>">아이디</a><a href="<c:url value="idPwFind.do?find=pw"/>">비밀번호 찾기</a></div>
			<div><i class="fa fa-user-plus"></i> <a href="join.do">회원가입</a></div>
		</div>
	</div>
  </form>
</div>


</div>
</body>
</html>

<jsp:include page="u_footer.jsp"/>  