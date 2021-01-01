<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="payList"  value="${payList}"  />

	<div class="table-responsive cart-list mb-5">
		<h3 class="mb-5 font-weight-bold">주문 내역서</h3>
	    <table class="table header-border" style="text-align: center;">
	        <thead>
	            <tr>
	                <th scope="col">도서명</th>
	                <th scope="col">수량</th>
	                <th scope="col">주문 금액</th>
	                <th scope="col">주문 상태</th>
	                <th scope="col">주문자</th>
	                <th scope="col">수령자</th>
	            </tr>
	        </thead>
	        <tbody>
	      			<c:forEach items="${payList}" var="pay">
	       			<tr>	
					 	<td>
					 		<a href="${contextPath}/book/detailBookView.do?bookNo=${bookNo}" class="font-weight-bold">${pay.orderTitle}</a>
					 	</td>
					 	<td>
					 		${pay.quantity}개
					 	</td>
					 	<td>
					 		 <fmt:formatNumber  value="${pay.totalPrice}" type="number" var="totalPrice" />
					 		${totalPrice}원
					 	</td>
					 	<td>
					 		${pay.deliveryStatus}
					 	</td>
					 	<td>
					 		${pay.ordererName }
					 	</td>
					 	<td>
					 		${pay.receiverName}
					 	</td>
	       			</tr>
	      			</c:forEach>
	        </tbody>
	    </table>
	</div>
