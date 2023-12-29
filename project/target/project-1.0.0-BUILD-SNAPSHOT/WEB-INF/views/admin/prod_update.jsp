<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ad_header.jsp"/>      
<div class="container w-50 mt-5">
   <h3>상품 수정</h3>
   <form action="prodUpdateOk.do" method="post" enctype="multipart/form-data">
      <table class="table table-borderless">
         <tbody>
          	<tr>
         		<td>상품번호</td>
         		<td><input type="text" class="form-control form-control-sm" id="pnum"
         			name="pnum" value="${dto.pnum}" readonly/></td>
         	</tr>
            <tr>
               <td>카테고리</td>
               <td>
                  <select class="form-select form-select-sm" name="pcategory_fk"> 
                        <c:if test="${cDto != null || cDto.size() != 0}">
                         	<c:forEach var="cDto" items="${cDto}">
                         		<option value="${cDto.c_code}"
                         		 ${(cDto.c_code == dto.pcategory_fk) ? 'selected':''}>
                         		 ${cDto.c_name}[${cDto.c_code}]</option>
                          	</c:forEach>   
<!--                          	<option value="a100" selected>도서[a100]</option>
                         		<option value="a200" >생활가전[a200]</option> -->
                        </c:if>
                  </select>
               </td>
            </tr>
            <tr>
               <td>하위 카테고리</td>
               <td>
                  <select class="form-select form-select-sm" name="psubcategory_fk"> 
                        <c:if test="${csDto != null || csDto.size() != 0}">
                         	<c:forEach var="csDto" items="${csDto}">
                         		<option value="${csDto.c_subname}"
                         		 ${(csDto.c_subname == dto.psubcategory_fk) ? 'selected':''}>
                         		 ${csDto.c_subname}[${csDto.c_code}]</option>
                          	</c:forEach>   
<!--                          	<option value="a100" selected>도서[a100]</option>
                         		<option value="a200" >생활가전[a200]</option> -->
                        </c:if>
                  </select>
               </td>
            </tr>
            <tr>
               <td>상품명</td>
               <td><input type="text" class="form-control form-control-sm" name="pname"
               		value="${dto.pname}"/></td>
            </tr>
            <tr>
               <td>제조회사</td>
               <td><input type="text" class="form-control form-control-sm" name="pcompany"
               	value="${dto.pcompany}"/></td>
            </tr>
            <tr>
               <td >상품이미지</td>
               <td id ="pimage-text">
               		<img src="<c:url value="/fileRepo/${dto.pimage}"/>" width="100px"/>
               		<br><br>
               		<input type="file" class="form-control form-control-sm pimage" id="pimage" 
               			name="pimage" value=""/>
               		
               		<!-- 이미지를 수정하지 않을 경우에는 현재 이미지를 전송해줌 -->
                		<input type="hidden" class="form-control form-control-sm" 
               			name="pimage" value="${dto.pimage}" style="visibility:hidden"/>             		
               </td>
            </tr>
            <tr>
               <td>상품수량</td>
               <td><input type="text" class="form-control form-control-sm" name="pqty"
               	value="${dto.pqty}"/></td>
            </tr>
            <tr>
               <td>상품가격</td>
               <td><input type="text" class="form-control form-control-sm" name="price"
               	value="${dto.price}"/></td>
            </tr>
             
            <tr>
               <td>상품사양</td>
               <td>
                  <select class="form-select form-select-sm" name="pspec">
                     <option value="none" selected>일반</option>
                     <c:forEach var="spec" items="${requestScope.pdSpecs}">
                     <option value="${spec.name()}"
                     ${dto.pSpec == spec.name() ? 'selected':''}>
                     ${spec.value}</option>
                     </c:forEach>                        
                  </select>
               </td>
            </tr>
            <tr>
               <td>상품소개</td>
               <td>
                  <textarea class="form-control" name="pcontent" rows="3">${dto.pcontent}</textarea>
               </td>
            </tr>
            <tr>
               <td>상품사이즈</td>
               <td>
                   <select class="form-select form-select-sm" name="psize">
                     <option value="l" selected>L</option>
                     <option value="S">S</option>                        
                     <option value="M">M</option>                        
                     <option value="FREE">FREE</option>                       
                  </select>
               </td>
            </tr>
            <tr>
               <td>상품포인트</td>
               <td><input type="text" class="form-control form-control-sm" name="point"
               	value="${dto.point}"/></td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <input type="button" class="btn btn-sm btn-primary" value="상품수정" onclick="submit()"/>   
                  <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
               </td>
            </tr>
         </tbody>         
      </table>   
   </form>
</div> 
<script>
	function submit(){
		if($("#pimage").val()==""||$("#pimage").val()==null){
			$("#pimage").css("display":"none");
			$("#pimage-text").html('<input type="hidden" class="form-control form-control-sm">' 
       			+'name="pimageOld" value="'${dto.pimage}'"/>');
		}
			$.ajax({
				url:"<c:url value='prodUpdateOk.do'/>",
				type:"post",
				data: JSON.stringify(product),
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