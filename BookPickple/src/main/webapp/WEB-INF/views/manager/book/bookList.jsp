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
		
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body" style="margin: 0 auto;">
					<div class="period-search mb-3">
						<p class="mb-0 text-primary font-weight-bold" style="font-size: 12px"><i class="fa fa-search"></i> 입고일 기준</p>
						<ul>
							<li id="1w"><a href="${contextPath}/manager/bookListView.do?searchType=1w" class="btn mb-1 btn-outline-primary btn-sm">최근 1주일</a></li>
							<li id="1m"><a href="${contextPath}/manager/bookListView.do?searchType=1m" class="btn mb-1 btn-outline-primary btn-sm">최근 1개월</a></li>
							<li id="3m"><a href="${contextPath}/manager/bookListView.do?searchType=3m" class="btn mb-1 btn-outline-primary btn-sm">최근 3개월</a></li>
							<li id="6m"><a href="${contextPath}/manager/bookListView.do?searchType=6m" class="btn mb-1 btn-outline-primary btn-sm">최근 6개월</a></li>
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
								<option value="title">도서명</option>
								<option value="isbn">ISBN</option>
								<option value="writer">저자</option>
								<option value="publisher">출판사</option>
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
        	<div style="text-align: right;">
        		<button type="button" class="mb-3 btn btn-primary" onclick="location.href='${contextPath}/manager/insertBookView.do'">도서 추가</button>
        	</div>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered zero-configuration" id="managerBookList" style="font-size:12px;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>도서명</th>
                                    <th>저자</th>
                                    <th>출판사</th>
                                    <th>판매가</th>
                                    <th>입고일</th>
                                    <th>출판일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
							     <c:when test="${empty list}">	
							     	<!-- dataTable에서 colspan을 지원하지 않아서 데이터가 없을때 error발생하여 이렇게 구성 -->			
									<tr>
										<td style="visibility: hidden;"></td>
								       <td style="visibility: hidden;"></td>
									   <td style="visibility: hidden;"></td>
									   <td style="visibility: hidden;"></td>
									   <td><p class="font-weight-bold">조회된 도서가 없습니다.</p></td>
									   <td style="visibility: hidden;"></td>
									   <td style="visibility: hidden;"></td>
									   <td style="visibility: hidden;"></td>
									   <td style="visibility: hidden;"></td>
								     </tr>
								 </c:when>
								 <c:otherwise>
								     <c:forEach var="item" items="${list}">
								     	<c:if test="${ item.status != 'STOP' }">
											 <tr>       
												<td>${ item.bookNo }</td>
												<td>
													 <a href="${contextPath}/manager/detailBookView.do?bookNo=${item.bookNo}">
													    <p class="font-weight-bold mb-0">${item.title}<br>
													    <em class="font-weight-normal">${item.isbn}</em></p>
													 </a> 
												</td>
												<td>${item.writer}</td>
												<td>${item.publisher}</td>
												<td class="font-weight-bold">
													<fmt:formatNumber  value="${item.salesPrice}" type="number" var="salePrice" />
													${salePrice}원
												</td>
												<td>${item.creDate}
												</td>
												<td>
												   <c:set var="pub_date" value="${item.publishedDate}" />
												   <c:set var="arr" value="${fn:split(pub_date,' ')}" />
												   <c:out value="${arr[0]}" />
												</td>
												<td>
												   <c:if test="${item.status == 'ONSALE'}"><span class="label label-secondary">판매중</span></c:if>
												   <c:if test="${item.status == 'SOLDOUT'}"><span class="label label-danger">품절</span></c:if>
												   <c:if test="${item.status == 'OUTOFPRINT'}"><span class="label label-primary">절판</span></c:if>
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

<script src="${contextPath}/resources/plugins/tables/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}/resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script>
$(function($) {
	 $('#managerBookList').DataTable({
		 lengthMenu: [ 10, 20, 30, 40, 50 ],
		 searching: false,
		 order: [
			 [ 0, "desc" ]
		],
		 "language": {
	            "decimal": "",
	            "emptyTable": "데이터가 없습니다.",
	            "info": "총 _TOTAL_권 중 _START_에서 _END_까지 표시",
	            "infoEmpty": "0 개 항목 중 0 ~ 0 개 표시",
	            "infoFiltered": "(총 _MAX_ 권 항목에서 필터링 됨)",
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
});

function keywordSearch() {
	location.href = "${contextPath}/manager/bookListView.do?searchType=" + $('#searchType').val() + "&searchKeyword=" + $('#searchKeyword').val();
}

function periodSearch() {
	location.href = "${contextPath}/manager/bookListView.do?periodFrom=" +  $("#periodFrom").val() + "&periodTo=" +  $("#periodTo").val();
}
</script>

</body>