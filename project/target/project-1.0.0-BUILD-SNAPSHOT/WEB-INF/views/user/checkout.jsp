<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<style>
	td {vertical-align:middle;}
</style>
<jsp:include page="u_header.jsp"/>
<div class="container w-75 mt-5">
<jsp:include page="u_left.jsp"/>
	<h3>주문 / 결제</h3>
	<table class="table">
		<thead>
			<tr>
				<th><input type="checkbox" id="checkAll" onclick="checkAll()"/> 삭제</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>수량</th>
				<th>판매가</th>
				<th>합계</th>
			</tr>
		</thead>
		<tbody>

		<c:set var="cartTotPrice" value="0"/>
		<c:set var="cartTotPoint" value="0"/>
		
		<!-- 장바구니 상품 출력하기 -->
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>
					<input type="checkbox" name="chk"
						value="${dto.pnum}"/>
				</td>
				<td>
					<a href="prodView.do?pnum=${dto.pnum}&pspec=${dto.pspec}">
					<img src="<c:url value="/fileRepo/${dto.pimage}"/>"
						width="60px" />
					</a>	
				</td>
				<td>${dto.pname}</td>
				<td>${dto.pqty}개</td>
				<td><fmt:formatNumber value="${dto.price}"/>원</td>
				<td>
					<fmt:formatNumber value="${dto.totPrice}"/>원<br/>
					<fmt:formatNumber value="${dto.totPoint}"/>포인트
				</td>			
				
				<c:set var="cartTotPrice" value="${cartTotPrice + dto.totPrice}"/>
				<c:set var="cartTotPoint" value="${cartTotPoint + dto.totPoint}"/>						
			</tr>
		</c:forEach>
		<tr>
			<form action="cartDelete.do" name="checkForm" method="post">
				<input type="hidden" name="delPnums" id="delPnums"/>
				<td colspan="6">
					<a href="javascript:prodDel()" 
						class="btn btn-sm btn-outline-secondary">선택삭제</a>
				</td>
			</form>
		</tr>
		</tbody>
	</table>
	<!-- 장바구니 총액 표시 -->
	<div class="text-end">
		장바구니 총액 : <fmt:formatNumber value="${cartTotPrice}"/> 원 <br>
		총 포인트 : <fmt:formatNumber value="${cartTotPoint}"/> 포인트 <br>
	</div>
	<!-------------------------- 구매자 정보 -------------------------->
    <table class="table">
       <thead>
          <tr>
             <th>구매자 정보</th>
          </tr>
       </thead>
       <tbody>
          <tr>
             <td>이름</td>
             <td>${mDto.name}</td>
          </tr>
          <tr>
             <td>이메일</td>
             <td>${mDto.email}</td>
          </tr>
          <tr>
             <td>전화번호</td>
             <td>${mDto.tel}</td>
          </tr>
          <tr>
             <td><b>받는사람 정보</b></td>
          </tr>
          <tr>
             <td>이름</td>
             <td>${mDto.name}</td>
          </tr>
          <tr>
             <td>주소</td>
             <td>${mDto.zipcode}<br>
             	 ${mDto.roadAddr}
             </td>
          </tr>
           <tr>
             <td>상세 주소</td>
             <td>${mDto.detailAddr}</td>
          </tr>
          <tr>
             <td>전화번호</td>
             <td>${mDto.tel}</td>
          </tr>
          <tr>
             <td><b>결제정보</b></td>
          </tr>
          <tr>
             <td>총 주문금액</td>
             <td><fmt:formatNumber value="${cartTotPrice}"/>원</td>
          </tr>
          <tr>
             <td>포인트</td>
             <td>                  
                <input type="text" id="point" size="10"
                	oninput="removeChar(event)"/>
                <input type="checkbox" id="use" 
                	onclick="usePoint(this, ${cartTotPoint}, ${cartTotPrice})"/>
                <label for="use">
                   전액사용 [<fmt:formatNumber value="${cartTotPoint}"/>원]
                </label>
             </td>
          </tr>

          <tr>
             <td>결제금액</td>
             <td id="cartTotPrice">
                 <fmt:formatNumber value="${cartTotPrice}"/>원
             </td>
          </tr>
          
          <tr>
             <td>결제방법</td>
             <td>
                <label><input type="radio" name="payment" id="payment"
                	value="card" onclick = "selPayment()" checked/>신용카드</label>
                <label><input type="radio" name="payment" id="payment"
                	value="rTransfer"  onclick = "selPayment()"/>실시간 계좌이체</label>
                <label><input type="radio" name="payment" id="payment"
                	value="deposit"  onclick = "selPayment()"/>무통장 입금</label>
                <label><input type="radio" name="payment" id="payment"
                	value="hp"  onclick = "selPayment()"/>휴대폰 결제</label>
             </td>
          </tr>
       </tbody>
    </table>	
	<!--------------------------------------------------------------->
   <div id="card">
       카드선택 : <select>
          <option value="" selected>카드사 선택</option>
          <option value="samsung">삼성카드</option>
          <option value="shinhancard">신한카드</option>
          <option value="lotte">롯데카드</option>
          <option value="bc">비씨카드</option>
          <option value="hyundai">현대카드</option>
       </select><br/><br/>
       할부기간 : <select <c:if test="${cartTotPrice < 50000 }">disabled</c:if>>  
          <option value="1" selected>일시불</option>
          <option value="2">2개월 무이자할부</option>
          <option value="3">3개월 무이자할부</option>
          <option value="4">4개월 무이자할부</option>
          <option value="5">5개월 무이자할부</option>
          <option value="6">6개월 무이자할부</option>
       </select><br/><br/>
    </div>
    <div id="rTransfer" style="display:none">
       은행선택 : <select>
          <option value="" selected>은행선택</option>
          <option value="kakao">카카오뱅크</option>
          <option value="woori">우리은행</option>
          <option value="kookmin">국민은행</option>
          <option value="shinhan">신한은행</option>
       </select>
    </div>
    <div id="deposit" style="display:none" >
       입금은행 : <select>
          <option value="" selected>은행선택</option>
          <option value="kakao">카카오뱅크</option>
          <option value="woori">우리은행</option>
          <option value="kookmin">국민은행</option>
          <option value="shinhan">신한은행</option>
       </select>
       <ul style="font-size:11px">
          무통장 입금시 유의사항
          <li>입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</li>
          <li>무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</li>
          <li>은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</li>
       </ul>
    </div>
    <div id="hp" style="display:none" >
       통신사 : <select>
             <option value="" selected>선택</option>
             <option value="skt">SK</option>
             <option value="lg">LG U+</option>
             <option value="kt">KT</option>
       </select>
    </div>
	<!-- --------------------------------------------------------- -->	
	<div class="text-center">
		<a href="" class="btn btn-primary me-2">결제하기</a>
		<a href="<c:url value="user/home.do"/>" 
			class="btn btn-outline-primary me-2">계속 쇼핑하기</a>
	</div>
</div>
<script src="<c:url value="/js/checkout.js"/>"></script>
<jsp:include page="u_footer.jsp"/> 

