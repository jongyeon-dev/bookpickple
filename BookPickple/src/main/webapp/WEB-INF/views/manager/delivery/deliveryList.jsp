<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<head>
<link href="${contextPath}/resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/plugins/datepicker/datepicker.min.css" type="text/css" />
<script src="${contextPath}/resources/plugins/datepicker/datepicker.min.js"></script>
<script src="${contextPath}/resources/plugins/datepicker/datepicker.en.js"></script>

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
		
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body" style="margin: 0 auto;">
					<div class="period-search mb-3">
						<ul>
							<li id="1w"><a href="${contextPath}/manager/deliveryListView.do?searchType=1w" class="btn mb-1 btn-outline-primary btn-sm">최근 1주일</a></li>
							<li id="1m"><a href="${contextPath}/manager/deliveryListView.do?searchType=1m" class="btn mb-1 btn-outline-primary btn-sm">최근 1개월</a></li>
							<li id="3m"><a href="${contextPath}/manager/deliveryListView.do?searchType=3m" class="btn mb-1 btn-outline-primary btn-sm">최근 3개월</a></li>
							<li id="6m"><a href="${contextPath}/manager/deliveryListView.do?searchType=6m" class="btn mb-1 btn-outline-primary btn-sm">최근 6개월</a></li>
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
								<option value="orderNo">주문번호</option>
								<option value="orderTitle">주문 내역</option>
							</select>
						</span>
						<span class="form-group">
		                    <input type="text" class="form-control input-flat" name="searchKeyword" id="searchKeyword">
		                </span>
						<button type="button" class="btn btn-flat btn-secondary" onclick="keywordSearch()">검색</button>
					</div>
				</div>
				
			</div>
		</div>
    	
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                    	<div style="float: right; font-size: 12px;">
	                    	<span>주문상태</span>
	                    	<select id="searchStatus">
	                    		<option value="all">전체</option>
	                    		<option value="PAY">결제완료</option>
	                    		<option value="PREPARED">배송준비중</option>
	                    		<option value="DELIVERING">배송중</option>
	                    		<option value="FINISHED">배송완료</option>
	                    	</select>
                    	</div>
                        <table class="table zero-configuration" id="managerDeliveryList" style="font-size:12px;">
                            <thead>
                                <tr>
                                    <th>주문번호</th>
                                    <th>일자</th>
                                    <th>주문 내역</th>
                                    <th>총 가격</th>
                                    <th>배송 상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
							     <c:when test="${empty deliveryList}">
							     	<!-- dataTable에서 colspan을 지원하지 않아서 데이터가 없을때 error발생하여 이렇게 구성 -->			
									<tr>
									   <td style="visibility: hidden;"></td>
									    <td style="visibility: hidden;"></td>
									    <td><p class="font-weight-bold">조회된 주문내역이 없습니다.</p></td>
									    <td style="visibility: hidden;"></td>
									    <td style="visibility: hidden;"></td>
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
													<c:if test="${ item.deliveryStatus eq 'PAY'}"><span class="label label-primary">결제완료</span></c:if>
													<c:if test="${ item.deliveryStatus eq 'PREPARED'}"><span class="label label-secondary">배송준비중</span></c:if>
													<c:if test="${ item.deliveryStatus eq 'DELIVERING'}"><span class="label label-info">배송중</span></c:if>
													<c:if test="${ item.deliveryStatus eq 'FINISHED'}"><span class="label label-success">배송완료</span></c:if>
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

<script src="${contextPath}/resources/plugins/tables/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}/resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script>
$(function($) {
	 $('#managerDeliveryList').DataTable({
		 lengthMenu: [ 5, 10, 20, 30, 40, 50 ],
		 searching: false,
		 order: [
			 [ 0, "desc" ]
		],
		 "language": {
	            "decimal": "",
	            "emptyTable": "데이터가 없습니다.",
	            "info": "총 _TOTAL_개 중 _START_에서 _END_까지 표시",
	            "infoEmpty": "0 개 항목 중 0 ~ 0 개 표시",
	            "infoFiltered": "(총 _MAX_개 항목에서 필터링 됨)",
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


	    // 검색 한 후 searchType selectbox 유지
	    var url = location.href;

	    if(url.indexOf("1w") > -1) {
	    	$("#1w a").attr('class','btn mb-1 btn-primary btn-sm');
		} else if (url.indexOf("1m") > -1) {
			$("#1m a").attr('class','btn mb-1 btn-primary btn-sm');
		} else if (url.indexOf("3m") > -1) {
			$("#3m a").attr('class','btn mb-1 btn-primary btn-sm');
		} else if (url.indexOf("6m") > -1) {
			$("#6m a").attr('class','btn mb-1 btn-primary btn-sm');
		} else if (url.indexOf("orderNo") > -1) {
		     $("#searchType").val("orderNo").prop("selected", true);
		} else if (url.indexOf("orderTitle") > -1) {
		     $("#searchType").val("orderTitle").prop("selected", true);
		} else if (url.indexOf("PAY") > -1) {
		     $("#searchStatus").val("PAY").prop("selected", true);
		} else if (url.indexOf("PREPARED") > -1 ) {
			$("#searchStatus").val("PREPARED").prop("selected", true);
		} else if (url.indexOf("DELIVERING") > -1 ) {
			$("#searchStatus").val("DELIVERING").prop("selected", true);
		} else if (url.indexOf("FINISHED") > -1 ) {
			$("#searchStatus").val("FINISHED").prop("selected", true);
		}
});
</script>

<script>
function keywordSearch() {
	location.href = "${contextPath}/manager/deliveryListView.do?searchType=" + $('#searchType').val() + "&searchKeyword=" + $('#searchKeyword').val();
}

function periodSearch() {
	location.href = "${contextPath}/manager/deliveryListView.do?periodFrom=" +  $("#periodFrom").val() + "&periodTo=" +  $("#periodTo").val();
}

$("#searchStatus").change(function() {
	if($(this).val() == 'all') {
		location.href = "${contextPath}/manager/deliveryListView.do";
	} else {
		location.href = "${contextPath}/manager/deliveryListView.do?searchType=deliveryStatus&searchKeyword=" + $(this).val();
	}
});

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