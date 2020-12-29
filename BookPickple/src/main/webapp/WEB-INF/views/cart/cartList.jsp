<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="cartList"  value="${cartMap.cartList}"  />
<c:set var="bookList"  value="${cartMap.bookList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<div class="container">
<div class="table-responsive cart-list">
    <table class="table header-border" style="text-align: center;">
        <thead>
            <tr>
                <th scope="col"><input type="checkbox" name="allCheck" id="allCheck" checked value="${book.bookNo}"></th>
                <th colspan="2" scope="col">도서명</th>
                <th scope="col">정가</th>
                <th scope="col">판매가</th>
                <th scope="col">수량</th>
                <th scope="col">합계</th>
                <th scope="col">적립 포인트</th>
                <th scope="col">주문</th>
            </tr>
        </thead>
        <tbody>
        	<c:choose>
        		<c:when test="${ empty cartList }">
        			<tr>
        				<td colspan="7">
        					<p>카트에 담긴 도서가 없습니다.</p>
        				</td>
        			</tr>
        		</c:when>
        		<c:otherwise>
        			<c:forEach items="${bookList}" var="book" varStatus="loop">
	        			<tr>
	        					
        						<c:set var="quantity" value="${cartList[loop.count-1].quantity}" />
       						 	<c:set var="cartNo" value="${cartList[loop.count-1].cartNo}" />
       						 	<td>
       						 		<input type="checkbox" name="checked_goods" class="check-book" value="${quantity * book.salesPrice}" checked>
       						 	</td>
       						 	<td class="bookImage">
       						 		<a href="${contextPath}/book/detailBookView.do?bookNo=${book.bookNo}">
       						 			<img src="${contextPath}/resources/bookFileRepo/${book.bookNo}/${book.changeFileName}" width="60" alt="${book.title}"/>
       						 		</a>
       						 	</td>
       						 	<td>
       						 		<a href="${contextPath}/book/detailBookView.do?bookNo=${book.bookNo}" class="font-weight-bold">${book.title}</a>
       						 	</td>
       						 	<td>${book.price}원</td>
       						 	<td>
       						 		 <fmt:formatNumber  value="${book.salesPrice}" type="number" var="discounted_price" />
       						 		${discounted_price}원 <br>(10% 할인)
       						 	</td>
       						 	<td>
       						 		<div class="book-quantity">
       						 			<span><input type="text" id="quantity" name="quantity" value="${quantity}" maxlength="5"></span>
       						 			<button class="btn mb-2 btn-dark btn-sm btn-flat" onclick="">변경</button>
       						 		</div>
       						 	</td>
       						 	<td>
       						 		<p class="font-weight-bold text-primary mb-0">
   						 			 	<fmt:formatNumber  value="${book.salesPrice*quantity}" type="number" var="total_sales_price" />
		         						${total_sales_price}원
       						 		</p>
       						 	</td>
       						 	<td>${book.point}원</td>
       						 	<td class="cart-btn">
       						 		<c:if test="${book.status == 'ONSALE'}"><p class="font-weight-bold">판매중</p></c:if>
								   	<c:if test="${book.status == 'SOLDOUT'}"><p class="text-danger font-weight-bold">품절</p></c:if>
								   	<c:if test="${book.status == 'OUTOFPRINT'}"><p class="text-danger font-weight-bold">절판</p></c:if>
						    		<c:choose>
					            		<c:when test="${book.status != 'ONSALE'}">
					            			<button class="btn mb-2 btn-primary btn-sm btn-flat" disabled="disabled">주문하기</button> <br>
						    				<button class="btn btn-outline-secondary btn-sm btn-flat" disabled="disabled">삭제</button>
					            		</c:when>
					            		<c:otherwise>
					            			<button class="btn mb-2 btn-primary btn-sm btn-flat" onclick="">주문하기</button>
						    				<button class="btn btn-outline-secondary btn-sm btn-flat">삭제</button>
					            		</c:otherwise>
					            	</c:choose>
       						 	</td>
	        			</tr>
	        			<c:set  var="totalGoodsPrice" value="${totalGoodsPrice + book.salesPrice*quantity}" />
						<c:set  var="totalGoodsNum" value="${totalGoodsNum + quantity}" />
        			</c:forEach>
        	   </c:otherwise>
        	</c:choose>
        </tbody>
    </table>
</div>

<div class="calc-table">
	<table  width="100%">
		<thead>
	     <tr>
	       <th scope="col">총 상품금액</th>
	       <th scope="col"></th>
	       <th scope="col">총 배송비</th>
	       <th scope="col"></th>
	       <th scope="col" class="sale">총 할인 금액 </th>
	       <th scope="col"></th>
	       <th scope="col" class="total">최종 결제금액</th>
	     </tr>
	     </thead>
	     <tbody>
			<tr>
		       <td>
		          <p id="p_totalGoodsPrice">
		          <fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
			         ${total_goods_price}
		          </p>
		          <input id="h_totalGoodsPrice" type="hidden" value="${totalGoodsPrice}" />
		       </td>
		       <td> 
		         	<i class="fa fa-plus"></i>  
		       </td>
		       <td>
		         <p id="p_totalDeliveryPrice">${totalDeliveryPrice }  </p>
		         <input id="h_totalDeliveryPrice" type="hidden" value="${totalDeliveryPrice}" />
		       </td>
		       <td> 
		         <i class="fa fa-minus"></i>
		       </td>
		       <td class="sale">  
		         <p id="p_totalSalesPrice"> 
			         ${totalDiscountedPrice}
		         </p>
		         <input id="h_totalSalesPrice" type="hidden" value="${totalSalesPrice}" />
		       </td>
		       <td>  
		         <i class="fa fa-equals"></i> 
		       </td>
		       <td class="total">
		          <p id="p_final_totalPrice">
		          <fmt:formatNumber  value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
		            ${total_price}
		          </p>
		          <input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
		       </td>
			</tr>
		</tbody>
	</table>
	
</div>
</div>

 <script>

   $("#allCheck").click(function(){ // 전체 체크
       var chk = $("#allCheck").prop("checked");
       if(chk) {
           $(".check-book").prop("checked", true);
           itemSum();
       } else {
            $(".check-book").prop("checked", false);
            itemSum();
       }
   });

   $(".check-book").click(function(){
      $("#allCheck").prop("checked", false);
      itemSum();
    });

   function itemSum(){
       var str = "";
       var sum = 0;
       var count = $(".check-book").length;
       for(var i=0; i < count; i++ ){
           if( $(".check-book")[i].checked == true ){
            sum += parseInt($(".check-book")[i].value);
           }
       }
       
       $("#p_totalGoodsPrice").text(priceToString(sum) + "원");
       $("#h_totalGoodsPrice").val(sum);
       
       if(sum >= 10000) {
           $("#p_totalDeliveryPrice").text("0원");
       } else {
    	   $("#p_totalDeliveryPrice").text("2,500원");
       }

       var totalPrice = sum + $("#p_totalDeliveryPrice").val();

       $("#p_final_totalPrice").text(priceToString(totalPrice));
    };

    function priceToString(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    };
	   
</script>