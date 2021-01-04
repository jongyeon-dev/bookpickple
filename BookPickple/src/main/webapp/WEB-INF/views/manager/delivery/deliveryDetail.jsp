<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<body>

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="page-titles">
		    <div class="col">
		        <ol class="breadcrumb">
		        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">주문 / 배송 목록 조회</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">주문 / 배송 상세 조회</a></li>
		        </ol>
		    </div>
		</div>
    	
    <div class="col-xl-12">
            <div class="form-input-content">
                <div class="card mb-0">
                    <div class="card-body pt-2 pb-5 pt-5 pl-5">
                           <div class="table-responsive custom-list mb-5">
			
							<h4 class="mb-5 font-weight-bold">주문 도서 정보</h4>
						    <table class="table header-border" style="text-align: center;">
						        <thead>
						            <tr>
						                <th scope="col" width="250px;">주문 내역</th>
						                <th scope="col">주문 수량</th>
						                <th scope="col">가격</th>
						                <th scope="col">포인트</th>
						            </tr>
						        </thead>
						        <tbody>
					      			<c:forEach items="${deliveryDetail}" var="detail">
						       			<tr>
										 	<td>
										 		${detail.title}
										 	</td>
										 	<td>
										 		${detail.quantity}
										 	</td>
										 	<td>
										 		<fmt:formatNumber  value="${detail.salesPrice * detail.quantity}" type="number" var="price" />
										 		 ${price}원
										 	</td>
										 	<td>
										 		<fmt:formatNumber  value="${detail.point * detail.quantity}" type="number" var="point" />
										 		 ${point}원
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
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${deliveryDetail[0].orderNo }</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">주문 일자</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${deliveryDetail[0].payDate }</td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">주문하신 분</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${deliveryDetail[0].ordererName }</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">받으시는 분</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${deliveryDetail[0].receiverName }</td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">전화번호</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${deliveryDetail[0].receiverTel }</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">이메일</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${deliveryDetail[0].receiverEmail }</td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">배송지 주소</th>
							      <input type="hidden" id="dbAddr" value="${deliveryDetail[0].deliveryAddr }"/>
							      <td colspan="3" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="full-address"></td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">배송 상태</th>
							      <td colspan="3" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
							      <select name="deliveryStatus" id="deliveryStatus${deliveryDetail[0].orderNo}" style="background: #fff; border: 1px solid #ccc; padding: 10px; align-items: center; vertical-align: middle;">
                                       <option value="PAY" ${ deliveryDetail[0].deliveryStatus eq 'PAY' ? 'selected':'' }>결제완료</option>
                                       <option value="PREPARED" ${ deliveryDetail[0].deliveryStatus eq 'PREPARED' ? 'selected':'' }>배송준비중</option>
                                       <option value="DELIVERING" ${ deliveryDetail[0].deliveryStatus eq 'DELIVERING' ? 'selected':'' }>배송중</option>
                                       <option value="FINISHED" ${ deliveryDetail[0].deliveryStatus eq 'FINISHED' ? 'selected':'' }>배송완료</option>
                                       <option value="CANCEL" ${ deliveryDetail[0].deliveryStatus eq 'CANCEL' ? 'selected':'' }>주문취소</option>
                                       <option value="RETURN" ${ deliveryDetail[0].deliveryStatus eq 'RETURN' ? 'selected':'' }>반품</option>
                                   </select>
							 			<button type="button" class="btn btn-outline-primary btn-xs" onclick="updateStatus(${deliveryDetail[0].orderNo}, deliveryStatus${deliveryDetail[0].orderNo})">수정</button>
							 		
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
							      <fmt:formatNumber value="${deliveryDetail[0].totalPrice}" type="number" var="totalPrice" />
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${totalPrice}원</td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">실 결제 금액</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="text-primary font-weight-bold">${totalPrice}원</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">포인트 적립 액</th>
							      <fmt:formatNumber value="${deliveryDetail[0].totalPoint}" type="number" var="totalPoint" />
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${totalPoint}원</td>
							    </tr>
							   </tbody>
						   </table>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script>
$(function() {
	var dbAddr = $("#dbAddr").val().split(",");
	var fullAddr = "";
	
	for(var i = 0; i < dbAddr.length; i++) {
		fullAddr += dbAddr[i] + " ";
	};
	
	$(".full-address").text(fullAddr);
});

function updateStatus(orderNo, selectBoxValue) {
	$.ajax({
		type: "post",
		async: false,
		url: "${contextPath}/manager/updateDeliveryStatus.do",
		data: {
			orderNo: orderNo,
			deliveryStatus: selectBoxValue.value
		},
		success: function(data){
			if(data.trim() == "success") {
				alert("배송 상태를 변경했습니다.");
				window.location.reload();
			} else {
				alert("배송 상태가 변경되지 않았습니다.");
				window.location.reload();
			}
		},
		error: function(jqxhr, textStatus, errorThrown){
            console.log("배송 상태 변경 처리 실패");
            //에러 로그
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
        }
	});
};

</script>


</body>