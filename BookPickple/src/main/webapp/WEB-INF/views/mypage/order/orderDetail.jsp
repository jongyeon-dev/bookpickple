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
			            </tr>
			        </thead>
			        <tbody>
		      			<c:forEach items="${myOrderDetailList}" var="detail">
			       			<tr>
			       				<td class="text-danger">
							 		<c:if test="${detail.deliveryStatus eq 'PAY'}">결제완료</c:if>
							 	</td>
							 	<td>
							 		${detail.title}
							 	</td>
							 	<td>
							 		${detail.quantity}
							 	</td>
							 	<td>
							 		<fmt:formatNumber  value="${detail.salesPrice * detail.quantity}" type="number" var="price" />
							 		 ${price}
							 	</td>
							 	<td>
							 		<fmt:formatNumber  value="${detail.point * detail.quantity}" type="number" var="point" />
							 		 ${point}
							 	</td>
			       			</tr>
		      			</c:forEach>
			        </tbody>
			    </table>
			    
			</div>
			
			<div class="col-12 table-responsive custom-list mt-5 mb-5">
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
				 			<button type="button" class="btn mb-1 btn-outline-primary btn-xs btn-float">조회</button>
				 			<span>배송 조회는 배송중 이후에만 가능합니다.</span>
				 		</c:if>
				 		<small class="text-muted">배송 조회는 배송중 이후에만 가능합니다.</small>
				      </td>
				    </tr>
				   </tbody>
			   </table>
			</div>
			
			<div class="col-12 table-responsive custom-list mt-5 mb-5">
				<h4 class="mb-5 font-weight-bold">결제 정보</h4>
				<table class="table header-border" style="padding: 30px;">
				  <tbody>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">총 주문 금액</th>
				      <fmt:formatNumber value="${orderDetail[0].totalPrice}" type="number" var="totalPrice" />
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${totalPrice}원</td>
				    </tr>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">실 결제 금액</th>
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="text-primary font-weight-bold">${totalPrice}원</td>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">포인트 적립 액</th>
				      <fmt:formatNumber value="${orderDetail[0].totalPoint}" type="number" var="totalPoint" />
				      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${totalPoint}원</td>
				    </tr>
				   </tbody>
			   </table>
			</div>
			
			<div class="text-center">
				<button type="button" class="btn mb-1 btn-outline-primary btn-flat" onclick="javascirpt:history.back()">목록으로 돌아가기</button>
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
});
</script>
