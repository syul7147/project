<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ad_header.jsp"/>      
<div class="container w-50 mt-5">
   <h3>상품 등록</h3>
   <form action="prodInput.do" method="post" enctype="multipart/form-data">
      <table class="table table-borderless">
         <tbody>
            <tr>
               <td>카테고리</td>
               <td>
                  <select class="form-select form-select-sm" name="pcategory_fk"> 
                  	   <c:if test="${cDto == null || cDto.size() == 0}">                       
                        		<option value="">카테고리 없음</option>
                        </c:if>
                        <c:if test="${cDto != null || cDto.size() != 0}">
                         	<c:forEach var="cDto" items="${cDto}">
                         		<option value="${cDto.c_code}">${cDto.c_name}[${cDto.c_code}]</option>
                          </c:forEach>   
                        </c:if>
                  </select>
               </td>
               </tr>
               <tr>
               <td>하위 카테고리</td>
               <td>
                  <select class="form-select form-select-sm" name="psubcategory_fk"> 
                  	   <c:if test="${sDto == null || sDto.size() == 0}">                       
                        		<option value="">카테고리 없음</option>
                        </c:if>
                        <c:if test="${sDto != null || sDto.size() != 0}">
                         	<c:forEach var="dto" items="${cDto}">
	                         	<c:forEach var="sdto" items="${sDto}">
	                        	<c:if test="${dto.c_code==sdto.c_code}">
	                         		<option value="${sdto.c_subname}">${sdto.c_subname}[${dto.c_name}]</option>
	                          	</c:if>
	                         </c:forEach>
                          </c:forEach>   
                          
                        </c:if>
                  </select>
               </td>
            </tr>
            <tr>
               <td>상품명</td>
               <td><input type="text" class="form-control form-control-sm" name="pname"/></td>
            </tr>
            <tr>
               <td>제조회사</td>
               <td><input type="text" class="form-control form-control-sm" name="pcompany"/></td>
            </tr>
            <tr>
               <td>상품이미지</td>
               <td><input type="file" class="form-control form-control-sm" name="pimage"/></td>
            </tr>
            <tr>
               <td>상품수량</td>
               <td><input type="text" class="form-control form-control-sm" name="pqty"/></td>
            </tr>
            <tr>
               <td>상품가격</td>
               <td><input type="text" class="form-control form-control-sm" name="price"/></td>
            </tr>
            <tr>
               <td>상품사양</td>
               <td>
                  <select class="form-select form-select-sm" name="pspec">
                     <option value="none" selected>일반</option>
                     <c:forEach var="spec" items="${Pspec}">
                     <option value="${spec.value}">${spec.name()}</option>
                     </c:forEach>                        
                  </select>
               </td>
            </tr>
            <tr>
               <td>상품소개</td>
               <td>
                  <textarea class="form-control" name="pcontent" rows="3"></textarea>
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
               <td><input type="text" class="form-control form-control-sm" name="point"/></td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <input type="submit" class="btn btn-sm btn-primary" value="상품등록"/>   
                  <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
               </td>
            </tr>
         </tbody>         
      </table>   
   </form>
</div> 
<jsp:include page="ad_footer.jsp"/> 