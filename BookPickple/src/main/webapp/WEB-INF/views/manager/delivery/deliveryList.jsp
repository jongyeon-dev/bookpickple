<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<head>
<link href="${contextPath}/resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">


<style>
#managerDeliveryList_wrapper select, #managerDeliveryList_wrapper input {
	vertical-align: middle;
}
</style>
</head>
<body>

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="page-titles">
		    <div class="col">
		        <ol class="breadcrumb">
		        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">주문 / 배송 목록 조회</a></li>
		        </ol>
		    </div>
		</div>
    	
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table zero-configuration" id="managerDeliveryList" style="font-size:12px;">
                            <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>일자</th>
                                    <th>주문 내역</th>
                                    <th>총 가격</th>
                                    <th>배송 상태</th>
                                    <th>수정</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
							     <c:when test="${empty deliveryList}">			
										<tr>
									       <td colspan="9" class="fixed">
											  <p class="font-weight-bold">조회된 주문내역이 없습니다.</p>
										   </td>
									     </tr>
								 </c:when>
								 <c:otherwise>
								     <c:forEach var="item" items="${deliveryList}" varStatus="i">
								     	<c:choose>
								     	<c:when test="${item.orderNo != detailOrderNo}">
											 <tr>       
												<td>${ item.orderNo }</td>
												<td>${ item.payDate }</td>
												<td onclick="location.href='${contextPath}/manager/deliveryDetail.do?orderNo=${item.orderNo}'" style="cursor: pointer;">
													<c:forEach var="item2" items="${deliveryList}" varStatus="j">
												          <c:if  test="${item.orderNo ==item2.orderNo}" >
												            <p class="mb-0">
												            	<a class="text-primary font-weight-bold">${item2.title}</a>
												             <em>/ ${item2.quantity}개</em><p>
												         </c:if>
													 </c:forEach>
													<p>주문자 : ${item.ordererName} (고객 번호 : ${item.userNo}) <br> 수령자 : ${item.receiverName} <br> 연락처 :  ${item.receiverTel }</p>
												</td>
												<td class="text-primary font-weight-bold">
													<fmt:formatNumber value="${item.totalPrice}" type="number" var="totalPrice" />
													${totalPrice}원
												</td>
												<td>
													<select name="deliveryStatus" id="deliveryStatus${item.orderNo}" style="background: #fff; border: 1px solid #ccc; padding: 10px; cursor: pointer">
			                                           <option value="PAY" ${ item.deliveryStatus eq 'PAY' ? 'selected':'' }>결제완료</option>
			                                           <option value="PREPARED" ${ item.deliveryStatus eq 'PREPARED' ? 'selected':'' }>배송준비중</option>
			                                           <option value="DELIVERING" ${ item.deliveryStatus eq 'DELIVERING' ? 'selected':'' }>배송중</option>
			                                           <option value="FINISHED" ${ item.deliveryStatus eq 'FINISHED' ? 'selected':'' }>배송완료</option>
			                                           <!-- 
			                                           <option value="CANCEL" ${ item.deliveryStatus eq 'CANCEL' ? 'selected':'' }>주문취소</option>
			                                           <option value="RETURN" ${ item.deliveryStatus eq 'RETURN' ? 'selected':'' }>반품</option>
			                                           -->
			                                       </select>
												</td>
												<td>
													<button type="button" class="btn mb-1 btn-outline-primary btn-xs" onclick="updateStatus(${item.orderNo}, deliveryStatus${item.orderNo}, ${item.userNo})">수정</button>	
												</td>
											</tr>
											</c:when>
										</c:choose>
										<c:set  var="detailOrderNo" value="${item.orderNo }" />
									</c:forEach>
								</c:otherwise>
							  </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${contextPath}/resources/plugins/tables/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}/resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script>
$(function($) {
	 $('#managerDeliveryList').DataTable({
		 lengthMenu: [ 5, 10, 20, 30, 40, 50 ],
		 order: [
			 [ 0, "desc" ]
		],
		 "language": {
	            "decimal": "",
	            "emptyTable": "데이터가 없습니다.",
	            "info": "총 _TOTAL_개 중 _START_에서 _END_까지 표시",
	            "infoEmpty": "0 개 항목 중 0 ~ 0 개 표시",
	            "infoFiltered": "(_MAX_ 총 항목에서 필터링 됨)",
	            "infoPostFix": "",
	            "thousands": ",",
	            "lengthMenu" : "_MENU_ 개씩 보기",
	            "loadingRecords": "로드 중 ...",
	            "processing": "처리 중 ...",
	            "search": "검색:",
	            "zeroRecords": "일치하는 데이터가 없습니다.",
	            "paginate": {
	                "first": "처음",
	                "last": "마지막",
	                "next": "다음",
	                "previous": "이전"
	            },
	            "aria": {
	                "sortAscending":  ": 오름차순으로 정렬",
	                "sortDescending": ": 내림차순으로 정렬"
	            }
	        }
	 });
});
</script>

<script>
function updateStatus(orderNo, selectBoxValue, userNo) {
	$.ajax({
		type: "post",
		async: false,
		url: "${contextPath}/manager/updateDeliveryStatus.do",
		data: {
			orderNo: orderNo,
			deliveryStatus: selectBoxValue.value,
			userNo: userNo
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