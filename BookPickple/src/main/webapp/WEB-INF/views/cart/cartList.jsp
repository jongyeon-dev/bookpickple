<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="cartList"  value="${cartMap.cartList}"  />
<c:set var="bookList"  value="${cartMap.bookList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->

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
	        	
	        		<c:if test="${ empty cartList}">
	        			<tr>
	        				<td colspan="9">
	        					<p class="text-center font-weight-bold text-primary pt-5 pb-5">카트에 담긴 도서가 없습니다.</p>
	        				</td>
	        			</tr>
	        		</c:if>
	        			<c:forEach items="${bookList}" var="book" varStatus="loop">
		        			<tr>	
	        						<c:set var="quantity" value="${cartList[loop.count-1].quantity}" />
	       						 	<c:set var="cartNo" value="${cartList[loop.count-1].cartNo}" />
	       						 	<td>
	       						 		<input type="hidden" id="bookNo" value="${book.bookNo}">
	       						 		<input type="checkbox" name="checked_goods" class="check-book" value="${quantity * book.salesPrice}, ${book.point * quantity}" checked>
	       						 	</td>
	       						 	<td class="bookImage">
	       						 		<a href="${contextPath}/book/detailBookView.do?bookNo=${book.bookNo}">
	       						 			<img src="${contextPath}/resources/bookFileRepo/${book.bookNo}/${book.changeFileName}" width="60" alt="${book.title}"/>
	       						 		</a>
	       						 	</td>
	       						 	<td>
	       						 		<a href="${contextPath}/book/detailBookView.do?bookNo=${book.bookNo}" class="font-weight-bold">${book.title}</a>
	       						 	</td>
	       						 	<td>
	       						 		<fmt:formatNumber  value="${book.price}" type="number" var="price" />
	       						 		${price}원
       						 		</td>
	       						 	<td>
	       						 		 <fmt:formatNumber  value="${book.salesPrice}" type="number" var="salesPrice" />
	       						 		${salesPrice}원 <br>(10% 할인)
	       						 	</td> <!-- 판매가 -->
	       						 	<td>
	       						 		<div class="book-quantity">
	       						 			<span><input type="number" class="quantity${book.bookNo}" name="quantity" value="${quantity}" min="1" max="5"></span>
       						 				<button class="btn mb-2 btn-dark btn-sm btn-flat" onclick="updateCart(${member.userNo}, ${cartNo}, ${book.bookNo}, ${quantity})">변경</button>
	       						 		</div>
	       						 	</td>
	       						 	<td>
	       						 		<p class="font-weight-bold text-primary mb-0">
	   						 			 	<fmt:formatNumber  value="${book.salesPrice*quantity}" type="number" var="totalPrice" />
			         						${totalPrice}원
	       						 		</p> <!-- 합계 -->
	       						 	</td>
	       						 	<td>
	       						 		<fmt:formatNumber value="${book.point*quantity}" type="number" var="totalPoint" />
	       						 		${totalPoint}원
	       						 	</td>
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
							    				<button class="btn btn-outline-secondary btn-sm btn-flat" onclick="deleteCart(${member.userNo}, ${cartNo})">삭제</button>
						            		</c:otherwise>
						            	</c:choose>
	       						 	</td>
		        			</tr>
		        			<c:set var="totalBooksPrice" value="${totalBooksPrice + book.salesPrice*quantity}" />
							<c:set var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
							<c:set var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
							<c:set var="totalBooksPoint" value="${totalBooksPoint + book.point*quantity}"/>
	        			</c:forEach>
	        </tbody>
	    </table>
	</div>

	<div class="calc-table">
		<table  width="100%">
			<thead>
		     <tr>
		       <th scope="col">총 상품금액</th>
		       <th scope="col">총 배송비</th>
		       <th scope="col" class="sale">총 할인 금액 </th>
		       <th scope="col" class="total">최종 결제금액</th>
		     </tr>
		     </thead>
		     <tbody>
				<tr>
			       <td>
			          <p id="totalBooksPrice">
			          <fmt:formatNumber  value="${totalBooksPrice}" type="number" var="total_books_price" />
				         ${total_books_price}원
			          </p>
			          <input id="inputTotalBooksPrice" type="hidden" value="${totalBooksPrice}" />
			       </td>
			       <td>
			         <p id="totalDeliveryPrice">${totalDeliveryPrice}원</p>
			         <input id="inputTotalDeliveryPrice" type="hidden" value="${totalDeliveryPrice}" />
			       </td>
			       <td class="sale">  
			         <p id="totalSalesPrice"> 
				         ${totalDiscountedPrice}원
			         </p>
			         <input id="inputTotalSalesPrice" type="hidden" value="${totalDiscountedPrice}" />
			       </td>
			       <td class="total">
			          <p id="finalTotalPrice">
			          <fmt:formatNumber value="${totalBooksPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="final_total_price" />
			            ${final_total_price}원<br>
			          </p>
			          <span>
		           		<fmt:formatNumber value="${totalBooksPoint}" type="number" var="final_total_point" />
		           		총 예상 적립 포인트 : <em id="finalTotalPoint">${final_total_point}원</em>
		          	</span>
			         <input id="inputFinalTotalPrice" type="hidden" value="${totalBooksPrice+totalDeliveryPrice-totalDiscountedPrice}" />
					 <input id="inputFinalTotalPoint" type="hidden" value="${totalBooksPoint}" />
			       </td>
				</tr>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		
	</div>
</div>

 <script>

 $(function(){
	 
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
		
});

   function itemSum(){
       var priceSum = 0;
       var pointSum = 0;
       
       var count = $(".check-book").length;
       
       for(var i=0; i < count; i++ ){
           if( $(".check-book")[i].checked == true ){

        	   var splitCheckValue = $(".check-book")[i].value.split(",");
        	   var price = splitCheckValue[0];
        	   var point = splitCheckValue[1];
        	   
            priceSum += parseInt(price);
            pointSum += parseInt(point);
           }
       }

       console.log(priceSum);
       console.log(pointSum);
       
       $("#totalBooksPrice").text(priceToString(priceSum) + "원");
       $("#inputTotalBooksPrice").val(priceSum);

       if(priceSum >= 10000 || priceSum == 0) {
           $("#totalDeliveryPrice").text("0원");
           $("#inputTotalDeliveryPrice").val(0);
       } else {
    	   $("#totalDeliveryPrice").text("2,500원");
    	   $("#inputTotalDeliveryPrice").val(2500);
       }

       var totalPrice = priceSum + $("#totalDeliveryPrice").val();

       $("#finalTotalPrice").text(priceToString(totalPrice) + "원");
       $("#inputFinalTotalPrice").val(totalPrice);


       $("#finalTotalPoint").text(priceToString(pointSum) + "원");
       $("#inputFinalTotalPoint").val(pointSum);
    };

    function priceToString(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    };

    function updateCart(userNo, cartNo, bookNo, quantity) {
		$.ajax({
			type: "post",
			async: false,
			url: "${contextPath}/cart/updateCart.do",
			data: {
				userNo: userNo,
				cartNo: cartNo,
				bookNo: bookNo,
				quantity: $(".quantity" + bookNo).val()
			},
			success: function(data){
				if(data.trim() == "updateCart") {
					alert("수량을 변경했습니다.");
					window.location.reload();
				} else {
					alert("수량이 변경되지 않았습니다.");
					window.location.reload();
				}
			},
			error: function(jqxhr, textStatus, errorThrown){
                console.log("장바구니 수량 변경 처리 실패");
                //에러 로그
                console.log(jqxhr);
                console.log(textStatus);
                console.log(errorThrown);
            }
		});
    };

    function deleteCart(userNo, cartNo) {
    	var result = confirm("도서를 삭제하시겠습니까?");
        if(result) {
        	$.ajax({
    			type: "post",
    			async: false,
    			url: "${contextPath}/cart/deleteCart.do",
    			data: {
    				cartNo: cartNo
    			},
    			success: function(data){
    				if(data.trim() == "deleteCart") {
    					alert("도서를 삭제했습니다.");
    					window.location.reload();
    					// window.location.href="${contextPath}/cart/cartList.do?userNo=" + userNo;
    				} else {
    					alert("도서가 삭제되지 않았습니다.");
    					window.location.reload();
    				}
    			},
    			error: function(jqxhr, textStatus, errorThrown){
                    console.log("카트 도서 삭제 처리 실패");
                    //에러 로그
                    console.log(jqxhr);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
    		});
       	}
    }
</script>