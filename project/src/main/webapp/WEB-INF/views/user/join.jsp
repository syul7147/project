<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${requestScope.msg !=null}" >
	<script>
		alert("${requestScope.msg}");
	</script>
</c:if>    
<jsp:include page="u_header.jsp"/>
<main>
<div class="container mt-5 d-flex">
<jsp:include page="u_left.jsp"/>  
   <div>
   <h3>회원 가입</h3>
   <form action="userJoinOk.do" method="post" name="joinForm">
   <p id ="chkMsg" class="mb-2"></p>
      <input type="text" class="form-control mb-2" id="id" 
         placeholder="아이디" name="id" onkeyup="idcheck()"/>
      <input type="hidden" id="isidcheck" value="no">
      <input type="password" class="form-control mb-2" id="pw" placeholder="비밀번호" name="pw" onkeyup="pwchk()"/>
      <input type="password" class="form-control mb-2" id="pwConfirm" placeholder="비밀번호 확인" name="pwConfirm" onkeyup="pwConfirmChk()"/>
      <input type="text" class="form-control mb-2" id="name" placeholder="이름" name="name"/>
      <input type="text" class="form-control mb-2" id="tel" placeholder="전화번호" name="tel"/>
      <div class="row">
	      <div class="col-md-8 pe-0">
	      	<input type="text" class="form-control mb-2 email" id="email" placeholder="이메일" name="email"/>
	      </div>
	      <div class="col-md-4">
	      	<input id="code-send" class="btn btn-outline-secondary w-100" type="button" onclick="emailCheck()" value="인증번호 발송">
	      </div>
      </div>
      <div class="row" id="confirmEmail">
      	<div class="col-md-8 pe-0">
			<input class="input-code" type="text" id="confirmUUID" placeholder="인증코드 입력"><input class="time" value="" readonly>
		</div>				      	
		<div class="col-md-4">
			<span id="confirm-btn" class="btn btn-outline-secondary w-100" onclick="emailConfirm()">인증코드확인</span>
		</div>
		<p class="code-msg"></p>
      </div>
      <!----------------- 주소 ---------------------->
      <div class="row mb-2">
      	  <div class="col-md-6">	
	      	<input class="form-control mb-2" type="text" id="sample6_postcode" 
	      		name ="zipcode" placeholder="우편번호">
	      </div>
	      <div class="col-md-6 p-0">
		  	<input class="btn btn-secondary mb-2" type="button" onclick="sample6_execDaumPostcode()" 
		  		value="우편번호 찾기">
		  </div>
	  </div>
	  
	  <input class="form-control mb-2" type="text" id="sample6_address"
	  		name ="roadAddr"  placeholder="주소">
	  <input class="form-control mb-2" type="text" id="sample6_detailAddress" 
	  		name ="detailAddr" placeholder="상세주소">
      
      <div class="text-center">
         <input type="submit" class="btn btn-sm btn-primary" value="회원가입" />
         <input type="reset" class="btn btn-sm btn-warning" value="취소"/>
      </div>
   </form>
   </div>
	</div>
 
</main>
<jsp:include page="u_footer.jsp"/> 

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    };
    
    let time_display;
    
    let timer;
    
    function timer_start(){
    	let count = 300; 
		
		time_display = $(".time");
		//time_display.val("03:00");
		
		// Timer 설정시 사용하는 함수 
		// timer = setInterval(function, 1000) : function을 1초마다 주기적으로 호출
		// clearInterval(timer) : timer함수를 종료시킴
		
		timer= setInterval(()=>{
			let minutes = parseInt(count/60); // 십진수로 변환 
			let seconds = parseInt(count % 60);
			
			minutes = minutes < 10 ? "0" + minutes: minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;
			
			time_display.val(minutes + ":"+seconds);
			
			//  
			if(--count < 0){
				timer_stop();
				time_display.val("시간초과");
				$(".code-msg").css({"display":"block","color":"red"});
				$(".code-msg").text("인증코드 만료되었습니다!!");
				$("#confirm-btn").addClass("disabled");
				$("#code-send").removeClass("disabled");
				$("#code-send").val("코드 재발송");
				$(".input-code").attr("readonly", true); // 읽기전용
			}
		}, 1000)
	};

    function timer_stop(){
    	clearInterval(timer);
    };
    	
    function pwchk(){
    	let pw = $("#pw").val();
    	if(pw.length<4){
    		$("#chkMsg").text("비밀번호 길이는 4자리 이상이어야 합니다.");
    		$("#chkMsg").css({"color":"red", "font-size":"13px"});
			//
			return;
    	}else{
    		$("#chkMsg").text("");
    	}
    };
   	function pwConfirmChk(){
   		
   		let pw = $("#pw").val();
   		let conpw = $("#pwConfirm").val();
   		if(pw !=""||conpw!=""||pw!==null||conpw!==null){
	   		if(pw == conpw){
				$("#chkMsg").text("비밀번호가 서로 일치합니다.");
	    		$("#chkMsg").css({"color":"green", "font-size":"13px"});
	    		$("#isidcheck").val("yes");
			}else{
				$("#chkMsg").text("비밀번호가 서로 일치하지 않습니다.");
	    		$("#chkMsg").css({"color":"red", "font-size":"13px"});
			}
   		}
   	
    
    };
    function idcheck(){
    	let id = $("#id").val();
    	if(id.length < 4){
    		$("#chkMsg").text("아이디 길이는 4자리 이상이어야 합니다.");
    		$("#chkMsg").css({"color":"red", "font-size":"13px"});
    		$("#isIdCheck").val("no");
    		return;
    	}
    	$.ajax({
    		url: "<c:url value='/user/idCheck.do'/>",
    		type: "get",
    		data:{"id" : id},
    		success:function(result){
    			if(result == "yes"){
    				$("#chkMsg").text("사용가능한 비밀번호입니다.");
    	    		$("#chkMsg").css({"color":"green", "font-size":"13px"});
    	    		$("#isidcheck").val("yes");
    			}else{
    				$("#chkMsg").text("이미 등록된 아이디입니다.");
    	    		$("#chkMsg").css({"color":"red", "font-size":"13px"});
    			}
    			
    		},
    		error:()=>{
    			alert("")	
    		}
    	});	
    }
    function emailCheck(){
    	let uEmail = $("#email").val();
    	$("#code-send").addClass("disabled");
    	$("input-code").val("");
		$(".input-code").attr("readonly", false);
		$("#confirm-btn").removeClass("disabled");
		
		$.ajax({
			url:"<c:url value='EmailCheck.do'/>",
			type:"get",
			data:{"uEmail" : uEmail},
			success:(uuid)=>{
				if(uuid != "fail")
				console.log("이메일 인증코드 :" + uuid)
				responseUUID = uuid;
				$("#confirmEmail").css({"visibility":"visible", "height":"auto"});
			    $(".code-msg").css({"display":"block","color":"green"});
			    $(".code-msg").text("인증코드가 발송되었습니다!!");
				timer_start();
			},
			error:function(){}
			
				
			});
    }
	function emailConfirm(){		
		let confirmUUID = $("#confirmUUID").val();
		console.log("confirmUUID : " + confirmUUID)
		
		if(confirmUUID == null || confirmUUID ==""){
			//alert("이메일 확인코드를 입력하세요");
			$(".code-msg").css({"display":"block","color":"red"});
			$(".code-msg").text("인증코드를 다시 확인하세요!!");
			$("#confirmUUID").select();
			return;
		// 서버에서 전송된 uuid와 입력한 confirmUUID가 같은 경우
		}else if(responseUUID == confirmUUID){ 
			//alert("이메일 인증 성공!!")
			$(".code-msg").css({"display":"block","color":"green"});
			$(".code-msg").text("이메일 인증 성공!!");
			timer_stop();
			time_display.val("");
			// javaScript의 readonly속성 제어하기
			// document.querySelector(".input-code").readOnly=true;
			$(".input-code").attr("readonly", true);
			$("#confirm-btn").addClass("disabled");
			$("#code-send").removeClass("disabled");
			$("#code-send").val("코드 재발송");
			isEmailCheck = true;
		}else{ // 인증코드 잘못 입력한 경우
			//alert("인증코드를 다시 확인하세요!!");
			$(".code-msg").css({"display":"block","color":"red"});
			$(".code-msg").text("인증코드를 다시 확인하세요!!");
			$("#confirmUUID").select();
			return;
		}
	};
	
</script>


 