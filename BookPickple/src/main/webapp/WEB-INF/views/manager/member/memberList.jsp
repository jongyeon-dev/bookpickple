<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<link href="${contextPath}/resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
<style>
#managerMemberList_wrapper select, #managerMemberList_wrapper input {
	vertical-align: middle;
}
</style>

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="page-titles">
		    <div class="col">
		        <ol class="breadcrumb">
		        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">회원 목록 조회</a></li>
		        </ol>
		    </div>
		</div>
    	
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered zero-configuration" id="managerMemberList" style="font-size:12px;">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>연락처</th>
                                    <th>이메일</th>
                                    <th>가입일</th>
                                    <th>등급</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
							     <c:when test="${empty memberList}">
							     	<!-- dataTable에서 colspan을 지원하지 않아서 데이터가 없을때 error발생하여 이렇게 구성 -->			
									<tr>
										<td style="visibility: hidden;"></td>
								       <td style="visibility: hidden;"></td>
									   <td style="visibility: hidden;"></td>
									    <td style="visibility: hidden;"></td>
									    <td><p class="font-weight-bold">조회된 회원이 없습니다.</p></td>
									    <td style="visibility: hidden;"></td>
									    <td style="visibility: hidden;"></td>
									    <td style="visibility: hidden;"></td>
								     </tr>
								 </c:when>
								 <c:otherwise>
								     <c:forEach var="item" items="${memberList}">
											 <tr>       
												<td>${ item.userNo }</td>
												<td>
													 <a href="${contextPath}/manager/memberDetailView.do?userNo=${item.userNo}">
													    <p class="font-weight-bold mb-0">${item.userId}</p>
													 </a> 
												</td>
												<td>${item.userName}</td>
												<td>${item.tel}</td>
												<td>${item.email}</td>
												<td>${item.joinDate}</td>
												<td>
												   <c:if test="${item.gradeType == 1}"><span class="label label-light">일반</span></c:if>
												   <c:if test="${item.gradeType == 2}"><span class="label label-primary">실버</span></c:if>
												   <c:if test="${item.gradeType == 3}"><span class="label label-warning">골드</span></c:if>
												   <c:if test="${item.gradeType == 4}"><span class="label label-secondary">프리미엄</span></c:if>
												</td>
												<td>
												   <c:if test="${item.status == 'Y'}"><span class="label label-success">활동중</span></c:if>
												   <c:if test="${item.status == 'N'}"><span class="label label-danger">탈퇴</span></c:if>
												</td>
											</tr>
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
	 $('#managerMemberList').DataTable({
		 lengthMenu: [ 10, 20, 30, 40, 50 ],
		 order: [
			 [ 0, "desc" ]
		],
		 "language": {
	            "decimal": "",
	            "emptyTable": "데이터가 없습니다.",
	            "info": "총 _TOTAL_명 중 _START_에서 _END_까지 표시",
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

</body>