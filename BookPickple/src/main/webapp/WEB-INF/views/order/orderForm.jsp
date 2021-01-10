<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<c:set var="orderList" value="${orderList}"  />


<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


	<div class="table-responsive custom-list mb-5">
		<h3 class="mb-5 font-weight-bold">도서 확인</h3>
	    <table class="table header-border" style="text-align: center;">
	        <thead>
	            <tr>
	                <th colspan="2" scope="col">도서명</th>
	                <th scope="col">판매가</th>
	                <th scope="col">수량</th>
	                <th scope="col">합계</th>
	                <th scope="col">적립 포인트
	                <i class="fa fa-info-circle" style="cursor: pointer;" data-toggle="tooltip" data-placement="bottom" data-original-title="고객님의 등급은 ${member.gradeName}입니다.">
	                </th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:if test="${empty orderList }">
	        		<tr>
	        			<td colspan="6">없음</td>
	        		</tr>
	        	</c:if>
	      			<c:forEach items="${orderList}" var="order">
	      				<c:set var="bookNo" value="${order.bookNo}" />
				 		<c:set var="bookTitle" value="${order.title}" />
	       			<tr>	
					 	<td class="bookImage">
					 		<a href="${contextPath}/book/detailBookView.do?bookNo=${bookNo}">
					 			<img src="${contextPath}/resources/bookFileRepo/${bookNo}/${order.bookImage}" width="60" alt="${bookTitle}"/>
					 		</a>
					 	</td>
					 	<td>
					 		<a href="${contextPath}/book/detailBookView.do?bookNo=${bookNo}" class="font-weight-bold">${bookTitle}</a>
					 	</td>
					 	<td>
					 		 <fmt:formatNumber  value="${order.salesPrice}" type="number" var="salesPrice" />
					 		${salesPrice}원 <br>(10% 할인)
					 	</td> <!-- 판매가 -->
					 	<td>${order.quantity}</td> <!-- 수량 -->
					 	<td>
					 		<p class="font-weight-bold text-primary mb-0">
	 			 				<fmt:formatNumber  value="${order.salesPrice * order.quantity}" type="number" var="totalPrice" />
	   							${totalPrice}원
					 		</p> <!-- 합계 -->
					 	</td>
					 	<td>
					 		<fmt:formatNumber value="${order.point * order.quantity}" type="number" var="defaultPoint" />
					 		${defaultPoint}원
				 			<c:if test="${member.gradeType != 1 }">
					 			<fmt:formatNumber value="${order.gradePoint * order.quantity}" type="number" var="gradePoint" />
					 			<p>추가 포인트 : ${gradePoint}원</p>
					 		</c:if>
					 	</td>
	       			</tr>
	       			<!-- 모든 도서들의 정보 -->
	       			<c:set var="totalQuantity" value="${totalQuantity + order.quantity}" /> <!-- 총 도서 수 -->
	       			<c:set var="totalBooksPrice" value="${totalBooksPrice + order.salesPrice*order.quantity}" /> <!-- 총 가격 -->
					<c:set var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
					<c:set var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
					<c:set var="totalBooksPoint" value="${totalBooksPoint + order.point*order.quantity + (order.gradePoint * order.quantity)}"/> <!-- 총 포인트 -->
	      			</c:forEach>
	        </tbody>
	    </table>
	</div>
	
	<div class="col-12 calc-table mt-5">
		<table width="100%">
			<thead>
		     <tr>
		     	<th scope="col">총 도서 수</th>
		       <th scope="col">총 상품금액</th>
		       <th scope="col">총 배송비</th>
		       <th scope="col" class="sale">총 할인 금액</th>
		       <th scope="col" class="total">최종 결제금액</th>
		     </tr>
		     </thead>
		     <tbody>
				<tr>
					<td>
			          <p>
			          <fmt:formatNumber  value="${totalQuantity}" type="number" var="total_quantity" />
				         ${total_quantity}개
			          </p>
			       </td>
			       <td>
			          <p>
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
			         <p>${totalDiscountedPrice}원</p>
			       </td>
			       <td class="total">
			          <p class="totalPrice">
			          <fmt:formatNumber value="${totalBooksPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
			            ${total_price}원<br>
			          </p>
			          <span>
		           		<fmt:formatNumber value="${totalBooksPoint}" type="number" var="total_point" />
		           		총 예상 적립 포인트 : <em id="finalTotalPoint">${total_point}원</em>
		          	</span>
			       </td>
				</tr>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		
	</div>
		
	<div class="col-12 table-responsive custom-list mt-5 mb-5">
		<h3 class="mb-5 font-weight-bold">배송 정보</h3>
		<table class="table header-border" style="padding: 30px;">
		  <tbody>
		    <tr>
		      <th class="" scope="row">배송지 선택</th>
		      <td class="">
		      	<label class="radio-inline mr-3 col-form-label">
	               	<input type="radio" name="destination" checked onclick="defaultDest()"> 기본 배송지
	              </label>
	              <label class="radio-inline mr-3 col-form-label">
	               	<input type="radio" name="destination" onclick="resetDest()"> 새로 입력
	              </label>
		      </td>
		    </tr>
		    <tr>
		      <th class="" scope="row">수령자 이름</th>
		      <td class="">
		      	 <input type="text" class="form-control" name="receiverName" id="receiverName" value="${member.userName}" >
		      </td>
		    </tr>
		    <tr>
		      <th class="" scope="row">수령자 이메일</th>
		      <td class="">
		      	 <input type="email" class="form-control" name="receiverEmail" id="receiverEmail" value="${ member.email }">
		      </td>
		    </tr>
		    <tr>
		      <th class="" scope="row">수령자 연락처</th>
		      <td class="">
		      	 <input type="tel" class="form-control" name="receiverTel" id="receiverTel" placeholder="ex)010-1234-5678" value="${ member.tel }">
		      </td>
		    </tr>
		    <tr>
		      <th class="" scope="row">배송 주소</th>
		      <td class="">
		      	<div style="width: 700px; float: left;">
	                 <input type="text" name="deriveryAddr" id="zipCode" class="form-control" readonly/>
					<input type="text" name="deriveryAddr" id="address1" class="form-control" readonly/>
					<input type="text" name="deriveryAddr" id="address2" class="form-control" placeholder="상세 주소 입력"/>
					<input type="hidden" name="dbAddress" id="dbAddress" value="${member.address}" />
				</div>
				<div>
	      				<button type="button" class="btn btn-flat btn-outline-secondary ml-2" onclick="searchAddr()">검색</button>
	  				</div>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">포인트 사용</th>
		      <td class="">
		      	<div style="width: 200px; float: left;">
		      	 	<input type="text" class="form-control" name="usePoint" id="memberPoint" value="0" readonly>
		      	</div>
		      	<div style="float: left; padding: 10px 0 10px 10px;">
	      				<button type="button" class="btn mb-1 btn-primary btn-xs" onclick="usePoint(${member.point})">사용</button>
	      				<button type="button" class="btn mb-1 btn-outline-primary btn-xs" onclick="canclePoint()">취소</button>
	      				<fmt:formatNumber value="${member.point}" type="number" var="memberPoint" />
	  					(사용 가능 포인트 : <em>${memberPoint}원</em>)
	  				</div>
		      </td>
		    </tr>
		  </tbody>
		</table>
		<div class="text-center mt-5">
				<input type="hidden" id="userNo" value="${member.userNo}" />
				<input type="hidden" id="bookNo" value="${bookNo}" />
				<input type="hidden" id="title" value="${bookTitle}" />
				<input type="hidden" id="userName" value="${member.userName}" />
				<input type="hidden" id="totalQuantity" value="${totalQuantity}" />
				<input type="hidden" id="totalPrice" value="${totalBooksPrice}" />
				<input type="hidden" id="totalPoint" value="${totalBooksPoint}" />
				<!-- 나머지 정보는 배송 정보에 -->
				<button type="button" class="btn mb-1 btn-primary btn-lg" onclick="requestPay()">결제하기</button>
		</div>
	</div>


<script>
$(function() {
	var dbAddr = $("#dbAddress").val();
	var zipCode = dbAddr.substring(dbAddr.indexOf(","), dbAddr.indexOf(",") - 5); 
	var address1 = dbAddr.substring(dbAddr.lastIndexOf(","), dbAddr.indexOf(",") + 1);
	var address2 = dbAddr.substring(dbAddr.lastIndexOf(",") + 1);

	$("#zipCode").val(zipCode);
	$("#address1").val(address1);
	$("#address2").val(address2);

	if($("#inputTotalBooksPrice").val() >= 10000 || $("#inputTotalBooksPrice").val() == 0) {
        $("#totalDeliveryPrice").text("0원");
        $("#inputTotalDeliveryPrice").val(0);
    } else {
 	   $("#totalDeliveryPrice").text("2,500원");
 	   $("#inputTotalDeliveryPrice").val(2500);
    }

	// 아임포트
	var IMP = window.IMP; // 생략가능
	IMP.init("imp31227075"); // 가맹점 식별 코드	

});
</script>

<script>

function defaultDest() {
	var dbAddr = $("#dbAddress").val();
	var zipCode = dbAddr.substring(dbAddr.indexOf(","), dbAddr.indexOf(",") - 5); 
	var address1 = dbAddr.substring(dbAddr.lastIndexOf(","), dbAddr.indexOf(",") + 1);
	var address2 = dbAddr.substring(dbAddr.lastIndexOf(",") + 1);

	$("#zipCode").val(zipCode);
	$("#address1").val(address1);
	$("#address2").val(address2);
	$("#receiverName").val("${member.userName}");
	$("#receiverEmail").val("${member.email}");
	$("#receiverTel").val("${member.tel}");

};

function resetDest() {
	$("#receiverName").val("");
	$("#receiverEmail").val("");
	$("#zipCode").val("");
	$("#address1").val("");
	$("#address2").val("");
	$("#receiverTel").val("");
};

function usePoint() {
	$("#memberPoint").val(${member.point});
	$(".totalPrice").text(priceToString(${totalBooksPrice} - ${member.point}) + "원"); //최종 결제 금액 P 태그 변경
	$("#totalPrice").val(${totalBooksPrice} - ${member.point}); // 실제 결제할때 금액 변경
}

function canclePoint() {
	$("#memberPoint").val(0);
	$(".totalPrice").text(priceToString(${totalBooksPrice}) + "원"); //최종 결제 금액 P 태그 변경
	$("#totalPrice").val(${totalBooksPrice}); // 실제 결제할때 금액 변경
}

function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
};


function requestPay() {

    // IMP.request_pay(param, callback) 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: $("#title").val(),
        amount: $("#totalPrice").val(),
        buyer_email: $("#email").val(),
        buyer_name: $("#userName").val(),
        buyer_tel: $("#tel").val(),
        buyer_addr: $("#zipCode").val() + "," + $("#address1").val()+ "," + $("#address2").val()
    }, function (rsp) { // callback
        if (rsp.success) {
        	$.ajax({
				url : "${contextPath}/order/orderPayment.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
				type : "post",
				async: false,
				data : {
					imp_uid: rsp.imp_uid,
					merchant_uid: rsp.merchant_uid,
					userNo: $("#userNo").val(),
					bookNo: $("#bookNo").val(),
					orderTitle: $("#title").val(),
					ordererName: $("#userName").val(),
					totalQuantity: $("#totalQuantity").val(), // 최종 모든 도서 수
					totalPrice: $("#totalPrice").val(), // 최종 결제 가격
					totalPoint: $("#totalPoint").val(), // 최종 적립 포인트
					receiverName: $("#receiverName").val(),
					receiverEmail: $("#receiverEmail").val(),
					receiverTel: $("#receiverTel").val(),
					deliveryAddr: $("#zipCode").val() + "," + $("#address1").val()+ "," + $("#address2").val(),
					usePoint: $("#memberPoint").val()
				//기타 필요한 데이터가 있으면 추가 전달
				},
				success: function(data){
					if(data == "success") {
						alert("결제가 완료되었습니다. 주문 내역 페이지로 이동합니다.");
						location.href="${contextPath}/order/orderListView.do?userNo=" + ${member.userNo};
					} else {
						alert("결제가 완료되지 않았습니다. 관리자에게 문의해주세요.");
						location.href="${contextPath}/"; 
					}
				},
				error: function(jqxhr, textStatus, errorThrown){
	                console.log("주문 처리 실패");
	                //에러 로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
			});
        	// var msg = '결제가 완료되었습니다.';
        	// msg += '고유ID : ' + rsp.imp_uid;
        	// msg += '상점 거래ID : ' + rsp.merchant_uid;
        	// msg += '결제 금액 : ' + rsp.paid_amount;
        	// msg += '카드 승인번호 : ' + rsp.apply_num;

        } else {
        	var msg = '결제에 실패하였습니다.';
			msg += '\n에러내용 : ' + rsp.error_msg;
			alert(msg);
        }
       // alert(msg);
    });
  }
</script>

<script>
// 참조 API : http://postcode.map.daum.net/guide
function searchAddr() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = ''; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수

               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   fullAddr = data.roadAddress;

               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   fullAddr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
               if(data.userSelectedType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               $("#zipCode").val(data.zonecode); //5자리 새우편번호 사용
               
               $("#address1").val(fullAddr);

               // 커서를 상세주소 필드로 이동한다.
               $("#address2").focus();
           }
       }).open();
   };
	    
</script>