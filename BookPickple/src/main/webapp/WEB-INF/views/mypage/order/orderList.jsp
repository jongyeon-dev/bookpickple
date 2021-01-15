<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myOrderList"  value="${myOrderList}"  />
 
<link rel="stylesheet" href="${contextPath}/resources/plugins/datepicker/datepicker.min.css" type="text/css" />
<script src="${contextPath}/resources/plugins/datepicker/datepicker.min.js"></script>
<script src="${contextPath}/resources/plugins/datepicker/datepicker.en.js"></script>
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
		<div class="card-body" style="margin: 0 auto;">
			<div class="period-search mb-3">
				<ul>
					<li id="1w"><a href="${contextPath}/order/orderListView.do?userNo=${member.userNo}&searchType=1w" class="btn mb-1 btn-outline-primary btn-sm">최근 1주일</a></li>
					<li id="1m"><a href="${contextPath}/order/orderListView.do?userNo=${member.userNo}&searchType=1m" class="btn mb-1 btn-outline-primary btn-sm">최근 1개월</a></li>
					<li id="3m"><a href="${contextPath}/order/orderListView.do?userNo=${member.userNo}&searchType=3m" class="btn mb-1 btn-outline-primary btn-sm">최근 3개월</a></li>
					<li id="6m"><a href="${contextPath}/order/orderListView.do?userNo=${member.userNo}&searchType=6m" class="btn mb-1 btn-outline-primary btn-sm">최근 6개월</a></li>
				</ul>
				<div class="period">
					<span>
						<input type="text" name="periodFrom" id="periodFrom"
	    				data-language="en" class="form-control input-flat" autocomplete="off"/>
    				</span> ~ 
    				<span>
	    				<input type="text" name="periodTo" id="periodTo"
	    				data-language="en" class="form-control input-flat" autocomplete="off"/>
    				</span>
    				<button type="button" class="btn btn-flat btn-secondary" onclick="periodSearch()">기간 검색</button>
				</div>
			</div>
			<div class="keyword-search ml-4">
				<span>
					<select class="search-type" name="searchType" id="searchType">
						<option value="title">주문내역</option>
						<option value="receiver">수령자</option>
						<option value="orderNo">주문번호</option>
					</select>
				</span>
				<span class="form-group">
                    <input type="text" class="form-control input-flat" name="searchKeyword" id="searchKeyword">
                </span>
				<button type="button" class="btn btn-flat btn-secondary" onclick="keywordSearch()">검색</button>
			</div>
		</div>
		
	</div>
	
	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-list mb-5">
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
			        	<c:choose>
			        		<c:when test="${empty myOrderList}">			
									<tr>
								       <td colspan="7">
										  <p class="font-weight-bold">주문 내역이 없습니다.</p>
									   </td>
								     </tr>
							 </c:when>
							 <c:otherwise>
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
			      			</c:otherwise>
		      			</c:choose>
			        </tbody>
			    </table>
			</div>
		</div>
		
		<div class="pt-5 pb-1">
			<c:out value="${pageBar}" escapeXml="false"/>
		</div>
	
	</div>
	
</div>

<script>
$(function($) {
    $("#periodFrom").datepicker({
        language: "en",
        maxDate: new Date(),
        todayButton: new Date(),
        dateFormat: "yyyy/mm/dd",
        onSelect: function onSelect(fd) {
            $("#periodFrom").val(fd);
        }
    })
    
    $("#periodFrom").datepicker().data('datepicker').selectDate(new Date());
    
    $("#periodTo").datepicker({
        language: "en",
        maxDate: new Date(),
        todayButton: new Date(),
        dateFormat: "yyyy/mm/dd",
        onSelect: function onSelect(fd) {
            $("#periodTo").val(fd);
        }
    })

    $("#periodTo").datepicker().data('datepicker').selectDate(new Date());
});
function keywordSearch() {
	location.href = "${contextPath}/order/orderListView.do?userNo=${member.userNo}&searchType=" + $('#searchType').val() + "&searchKeyword=" + $('#searchKeyword').val();
}

function periodSearch() {
	location.href = "${contextPath}/order/orderListView.do?userNo=${member.userNo}&periodFrom=" +  $("#periodFrom").val() + "&periodTo=" +  $("#periodTo").val();
}
</script>
