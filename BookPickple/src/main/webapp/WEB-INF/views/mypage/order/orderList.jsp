<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myOrderList"  value="${myOrderList}"  />
 
<div class="col-lg-8 col-xl-9">

	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">마이 페이지</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">주문 내역 조회</a></li>
	        </ol>
	    </div>
	</div>
	
	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-list mb-5">
				<h3 class="mb-5 font-weight-bold">주문 내역</h3>
			    <table class="table header-border" style="text-align: center;">
			        <thead>
			            <tr>
			            	<th scope="col">주문번호</th>
			            	<th scope="col">주문일자</th>
			                <th scope="col" width="250px;">주문 내역</th>
			                <th scope="col">금액/수량</th>
			                <th scope="col">예정 포인트</th>
			                <th scope="col">주문 상태</th>
			                <th scope="col">수령자</th>
			            </tr>
			        </thead>
			        <tbody>
		      			<c:forEach items="${myOrderList}" var="myOrder">
			       			<tr>
			       				<td>
							 		${myOrder.orderNo}
							 	</td>
							 	<td>
							 		${myOrder.payDate}
							 	</td>	
							 	<td>
							 	<input type="hidden" id="memberNo" value="${member.userNo}"/>
							 		<input type="hidden" id="orderNo" value="${myOrder.orderNo}"/>
							 		<a href="${contextPath}/order/orderDetail.do?userNo=${member.userNo}&orderNo=${myOrder.orderNo}" class="font-weight-bold">${myOrder.orderTitle}</a>
							 	</td>
							 	<td>
							 		<fmt:formatNumber  value="${myOrder.totalPrice}" type="number" var="totalPrice" />
							 		<em class="font-weight-bold text-primary">${totalPrice}</em>/${myOrder.totalQuantity}
							 	</td>
							 	<td>
							 		 <fmt:formatNumber  value="${myOrder.totalPoint}" type="number" var="totalPoint" />
							 		${totalPoint}
							 	</td>
							 	<td>
							 		<c:if test="${myOrder.deliveryStatus eq 'PAY'}"><span class="label label-primary">결제완료</span></c:if>
									<c:if test="${myOrder.deliveryStatus eq 'PREPARED'}"><span class="label label-secondary">배송준비중</span></c:if>
									<c:if test="${myOrder.deliveryStatus eq 'DELIVERING'}"><span class="label label-info">배송중</span></c:if>
									<c:if test="${myOrder.deliveryStatus eq 'FINISHED'}"><span class="label label-success">배송완료</span></c:if>
									<c:if test="${myOrder.deliveryStatus eq 'CANCEL'}"><span class="label label-danger">주문취소</span></c:if>
									<c:if test="${myOrder.deliveryStatus eq 'RETURN'}"><span class="label label-warning">반품</span></c:if>
							 	</td>
							 	<td>
							 		${myOrder.receiverName}
							 	</td>
			       			</tr>
		      			</c:forEach>
			        </tbody>
			    </table>
			</div>
		</div>
		
		<div class="pt-5 pb-1">
			<c:out value="${pageBar}" escapeXml="false"/>
		</div>
	
	</div>
	
</div>
