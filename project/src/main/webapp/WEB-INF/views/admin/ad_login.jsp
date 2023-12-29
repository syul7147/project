<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="ad_header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-5 border shadow p-5">	
<h2>관리자 로그인</h2>
  <form action="adminLoginOk.do" method="post">
  <input type="hidden" class="form-control" id="moveUrl" name="moveUrl" value="${moveUrl}">
    <div class="mb-3 mt-3">
      <label for="email">아이디</label>
      <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">
       <input type="hidden" id="isIdCheck" value="no"/>
      <c:if test="${loginErr == 'idErr'}">
      <p class="text-danger">관리자 아이디를 입력하세요</p>
      </c:if>
    </div>
    <div class="mb-3">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
        <c:if test="${loginErr == 'pwdErr'}">
      <p class="text-danger">비밀번호를 확인하세요</p>
      </c:if>
    </div>
    <button type="submit" class="btn btn-primary">로그인</button>
    <div><i class="fa fa-user-plus"></i> <a href="/admin/register.do">관리자 등록</a></div>
  </form>
</div>
</body>
</html>
<script>
</script>
<jsp:include page="ad_footer.jsp"/>    