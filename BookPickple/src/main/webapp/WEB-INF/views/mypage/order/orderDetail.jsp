<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 <c:set var="orderDetail"  value="${myOrderDetailList}"  />
<div class="col-lg-8 col-xl-9">

	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">마이 페이지</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">주문 내역 조회</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">주문 내역 상세</a></li>
	        </ol>
	    </div>
	</div>
	
	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-list mb-5">
			
				<h4 class="mb-5 font-weight-bold">주문 도서 정보</h4>
			    <table class="table header-border" style="text-align: center;">
			        <thead>
			            <tr>
			            	<th scope="col">상태</th>
			                <th scope="col" width="250px;">주문 내역</th>
			                <th scope="col">주문 수량</th>
			                <th scope="col">가격</th>
			                <th scope="col">포인트</th>
			                <c:if test="${orderDetail[0].deliveryStatus eq 'FINISHED'}">
			                	<th scope="col">후기</th>
			                </c:if>
			            </tr>
			        </thead>
			        <tbody>
		      			<c:forEach items="${myOrderDetailList}" var="detail" varStatus="i">
			       			<tr>
			       				<td>
							 		<c:choose>
										<c:when test="${orderDetail[0].deliveryStatus eq 'PAY'}"><span class="badge badge-secondary">결제완료</span></c:when>
										<c:when test="${orderDetail[0].deliveryStatus eq 'PREPARED'}"><span class="badge badge-primary">배송준비중</span></c:when>
										<c:when test="${orderDetail[0].deliveryStatus eq 'DELIVERING'}"><span class="badge badge-info">배송중</span></c:when>
										<c:when test="${orderDetail[0].deliveryStatus eq 'FINISHED'}"><span class="badge badge-success">배송완료</span></c:when>
									</c:choose>
							 	</td>
							 	<td>
							 		<a href="${contextPath}/book/detailBookView.do?bookNo=${detail.bookNo}">
							 			${detail.title}
							 		</a>
							 	</td>
							 	<td>
							 		${detail.quantity}개
							 	</td>
							 	<td>
							 		<fmt:formatNumber  value="${detail.salesPrice * detail.quantity}" type="number" var="price" />
							 		 ${price}원
							 	</td>
							 	<td>
							 		<fmt:formatNumber  value="${detail.point * detail.quantity + detail.gradePoint}" type="number" var="point" />
							 		 ${point}원
							 	</td>
							 	<c:if test="${orderDetail[0].deliveryStatus eq 'FINISHED'}">
				                	<td>
			                			<c:choose>
			                				<c:when test="${isExistReview[i.index] eq 'FALSE' }">
			                					<button type="button" class="btn btn-flat btn-dark btn-xs" 
		                					onclick="location.href='${contextPath}/review/insertReviewView.do?userNo=${member.userNo}&orderNum=${detail.orderNum}'">등록</button>
			                				</c:when>
			                				<c:when test="${isExistReview[i.index] eq 'TRUE' }">
			                					<button type="button" class="btn btn-flat btn-outline-dark btn-xs" disabled="disabled">등록 완료</button>
			                				</c:when>
                						</c:choose>
				                	</td>
				                </c:if>
			       			</tr>
		      			</c:forEach>
			        </tbody>
			    </table>
			    
			</div>
			
			<div class="table-responsive custom-list mt-5 mb-5">
				<h4 class="mb-5 font-weight-bold">배송 정보</h4>
				<table class="table header-border" style="padding: 30px;">
				  <tbody>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">주문 번호</th>
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${orderDetail[0].orderNo }</td>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">주문 일자</th>
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${orderDetail[0].payDate }</td>
				    </tr>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">주문하신 분</th>
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${orderDetail[0].ordererName }</td>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">받으시는 분</th>
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${orderDetail[0].receiverName }</td>
				    </tr>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">전화번호</th>
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${orderDetail[0].receiverTel }</td>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">이메일</th>
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${orderDetail[0].receiverEmail }</td>
				    </tr>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">배송지 주소</th>
				      <input type="hidden" id="dbAddr" value="${orderDetail[0].deliveryAddr }"/>
				      <td colspan="3" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="full-address"></td>
				    </tr>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">배송 조회</th>
				      <td colspan="3" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
						
				      	<c:if test="${orderDetail[0].deliveryStatus ne 'PAY' and orderDetail[0].deliveryStatus ne 'PREPARED'}">
				      		<em>운송장 번호 : <input type="text" id="invoiceNumberText" value="${orderDetail[0].invoiceNo}" readonly/> </em>
				      		<form id="invoiceForm" target="popup">
					            <button type="button" class="btn mb-1 btn-outline-primary btn-xs btn-float btn-delivery">조회</button>
					        </form>
					          
				 		</c:if>
				 		<small class="text-muted">배송 조회는 배송중 이후에만 가능합니다.</small>
				      </td>
				    </tr>
				   </tbody>
			   </table>
			</div>
			
			<div class="table-responsive custom-list mt-5 mb-5">
				<h4 class="mb-5 font-weight-bold">결제 정보</h4>
				<table class="table header-border" style="padding: 30px;">
				  <tbody>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">결제 금액</th>
				      <fmt:formatNumber value="${orderDetail[0].totalPrice}" type="number" var="totalPrice" />
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${totalPrice}원</td>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">포인트 사용액</th>
				      <fmt:formatNumber value="${orderDetail[0].usePoint}" type="number" var="usePoint" />
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${usePoint}원</td>
				    </tr>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">총 결제 금액</th>
				      <fmt:formatNumber value="${orderDetail[0].totalPrice + orderDetail[0].usePoint}" type="number" var="finalPrice" />
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="text-danger font-weight-bold">${finalPrice}원</td>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">포인트 적립액</th>
				      <fmt:formatNumber value="${orderDetail[0].totalPoint}" type="number" var="totalPoint" />
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="text-primary font-weight-bold">
				      	${totalPoint}원
				      	<i class="fa fa-info-circle" style="cursor: pointer;" data-toggle="tooltip" data-placement="bottom" data-original-title="등급 합산 된 최종 포인트 적립액"></i>
				      </td>
				    </tr>
				   </tbody>
			   </table>
			</div>
			
			<div class="text-center">
				<button type="button" class="btn mb-1 btn-outline-primary btn-flat" onclick="location.href='${contextPath}/order/orderListView.do?userNo=${member.userNo}'">목록으로 돌아가기</button>
			</div>
			
		</div>
	</div>
	
</div>

<script>
$(function() {
	var dbAddr = $("#dbAddr").val().split(",");
	var fullAddr = "";
	
	for(var i = 0; i < dbAddr.length; i++) {
		fullAddr += dbAddr[i] + " ";
	};
	
	$(".full-address").text(fullAddr);


	// 스윗트래커
	var myKey = "fdSTy8APWCaCWfZeG6r1ow";

    // 배송정보와 배송추적 tracking-api
    $(".btn-delivery").click(function() {
        // var t_code = $('#tekbeCompnayList option:selected').attr('value');
        var t_invoice = $('#invoiceNumberText').val();
        window.open("", "popup", "width=500, height=500, scrollbars=yes");
        $("#invoiceForm").attr("action", " http://info.sweettracker.co.kr/tracking/5?t_key="+myKey+'&t_code=04&t_invoice='+t_invoice);
   		$("#invoiceForm").attr("method", "post");
        $("#invoiceForm").submit();
    });
});
</script>
