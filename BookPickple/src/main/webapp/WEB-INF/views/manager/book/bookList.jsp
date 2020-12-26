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
#managerBookList_wrapper select, #managerBookList_wrapper input {
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
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">도서 목록 조회</a></li>
		        </ol>
		    </div>
		</div>
    	
        <div class="col-md-12">
         <button type="button" class="mb-3 btn btn-primary" onclick="location.href='${contextPath}/manager/insertBookView.do'">도서 추가</button>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered zero-configuration" id="managerBookList">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>도서명</th>
                                    <th>저자</th>
                                    <th>출판사</th>
                                    <th>가격</th>
                                    <th>입고일</th>
                                    <th>출판일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
							     <c:when test="${empty list}">			
										<tr>
									       <td colspan="9" class="fixed">
											  <p class="font-weight-bold">조회된 상품이 없습니다.</p>
										   </td>
									     </tr>
								 </c:when>
								 <c:otherwise>
								     <c:forEach var="item" items="${list}">
								     	<c:if test="${ item.status != 'STOP' }">
											 <tr>       
												<td>${ item.bookNo }</td>
												<td>
													 <a href="${contextPath}/manager/detailBookView.do?bookNo=${item.bookNo}">
													    <p class="font-weight-bold">${item.title} </p>
													 </a> 
												</td>
												<td>${item.writer}</td>
												<td>${item.publisher}</td>
												<td>
													<fmt:formatNumber value="${item.salesPrice}" groupingUsed="true"/>
												</td>
												<td>${item.creDate}
												</td>
												<td>
												   <c:set var="pub_date" value="${item.publishedDate}" />
												   <c:set var="arr" value="${fn:split(pub_date,' ')}" />
												   <c:out value="${arr[0]}" />
												</td>
												<td>
												   <c:if test="${item.status == 'ONSALE'}">판매중</c:if>
												   <c:if test="${item.status == 'SOLDOUT'}">품절</c:if>
												   <c:if test="${item.status == 'OUTOFPRINT'}">절판</c:if>
												</td>
											</tr>
										</c:if>
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
	 $('#managerBookList').DataTable({
		 "language": {
	            "decimal": "",
	            "emptyTable": "데이터가 없습니다.",
	            "info": "총 _TOTAL_권 중 _START_에서 _END_까지 표시",
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
<!-- <script src="${contextPath}/resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script> -->

</body>