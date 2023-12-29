<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<jsp:include page="ad_header.jsp"/> 
<div class="container w-50 mt-5 p-5 shadow">
   <form action="registerOk.do" method="post" ><!-- onSubmit="return submitChk()" -->
      <h4>회원가입</h4>            
<!--       <div class="row">
      	<div class="col-md-8 pe-0">
      		<input class="form-control mb-2" type="text" id="id" name="id" placeholder="아이디">
      	</div>
     	<div class="col-md-4">
     		<a class="btn btn-outline-info w-100" onclick="idCheck()">중복체크</a>
     	</div>
      </div> -->
      
      <input class="form-control mb-2" type="text" id="id" name="id" 
      	placeholder="아이디" onkeyup="idCheck()">
      <p id="chkMsg" class="mb-2"></p>
      <input type="hidden" id="isIdCheck" value="no"/>
      
      <input class="form-control mb-2" type="text" name="pw" placeholder="비밀번호">
      <input class="form-control mb-2" type="text" name="name" placeholder="이름">
	  <input class="form-control mb-2" type="text" id="email" name="email" placeholder="이메일">
	  	<div class="text-center">
           <input type="submit" class="btn btn-sm btn-primary" value="관리자등록"/>   
           <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
      </div>
   </form>
</div>

<!-- The Modal -->
<!-- <div class="modal fade" id="chkModal">
  <div class="modal-dialog">
    <div class="modal-content">

      Modal Header
      <div class="modal-header">
        <h4 class="modal-title">중복체크 확인</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      Modal body
      <div class="modal-body" id="chkMsg"></div>

      Modal footer
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div> -->

<script>
	// 모든 함수에서 사용하도록 responseUUID를 전역변수로 설정
	let responseUUID = "";
	function idCheck(){
		let uid = $("#id").val(); // 사용자 입력 아이디 가져오기	
		
		if(uid.length<4){
			$("#chkMsg").text("아이디 길이는 4자리 이상이어야 합니다!!");
			$("#chkMsg").css({"color":"red", "font-size":"13px"});			
			return;
		}
		
		$.ajax({
			url:"<c:url value='adminIdCheck.do'/>",
			type: "get",
			data: {"id":uid}, // 서버에 전송할 데이터
			success: function(responseData){
				console.log(responseData);
				if(responseData == "yes"){
					//alert("사용가능한 아이디 입니다!!");
					$("#chkMsg").text("사용가능한 아이디 입니다!!");
					$("#chkMsg").css({"color":"blue", "font-size":"13px"})
					$("#isIdCheck").val("yes");
				}else{
					//alert("이미 존재하는 아이디 입니다!!");
					$("#chkMsg").text("사용할 수 없는 아이디 입니다!!");
					$("#chkMsg").css({"color":"red", "font-size":"13px"})
				}
				//$("#chkModal").modal("show");
			},
			error: function(){
				alert("서버 에러 입니다!!");
			}
		});
	}
</script>
<jsp:include page="ad_footer.jsp"/> 