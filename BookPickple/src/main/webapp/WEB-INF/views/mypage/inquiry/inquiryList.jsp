<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<div class="col-lg-8 col-xl-9">

	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">마이 페이지</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">1:1 문의 내역 조회</a></li>
	        </ol>
	    </div>
	</div>
	
	<div class="card">
		<div style="text-align: right; margin: 30px;">
       		<button type="button" class=" btn btn-primary" onclick="location.href='${contextPath}/inquiry/insertInquiryView.do'">문의하기</button>
       	</div>
		<div class="card-body">
			<div class="table-responsive custom-list mb-5">
			    <table class="table header-border" style="text-align: center;">
			        <thead>
			            <tr>
			            	<th scope="col">유형</th>
			                <th scope="col" width="350px;">제목</th>
			                <th scope="col">날짜</th>
			                <th scope="col">문의 상태</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:choose>
				        	<c:when test="${empty myInquiryList}">			
									<tr>
								       <td colspan="4">
										  <p class="font-weight-bold">조회된 문의 내역이 없습니다.</p>
									   </td>
								     </tr>
							 </c:when>
							 <c:otherwise>
				      			<c:forEach items="${myInquiryList}" var="inquiry">
					       			<tr>
					       				<td>
					       					<c:if test="${inquiry.type eq 'BOOK'}">도서</c:if>
					       					<c:if test="${inquiry.type eq 'DELIVERY'}">주문/배송</c:if>
					       					<c:if test="${inquiry.type eq 'IMPROVE'}">개선</c:if>
					       					<c:if test="${inquiry.type eq 'ETC'}">기타</c:if>
									 	</td>
									 	<td>
									 		<c:if test="${inquiry.status eq 'N'}">
									 			<a href="${contextPath}/inquiry/inquiryDetail.do?userNo=${member.userNo}&inquiryNo=${inquiry.inquiryNo}" class="font-weight-bold">${inquiry.title}</a>
									 		</c:if>
									 		<c:if test="${inquiry.status eq 'Y'}">
									 			<a href="${contextPath}/inquiry/inquiryAllDetail.do?inquiryNo=${inquiry.inquiryNo}&refNo=${inquiry.inquiryNo}" class="font-weight-bold">${inquiry.title}</a>
									 		</c:if>
									 	</td>	
									 	<td>
											${inquiry.creDate}
									 	</td>
									 	<td>
									 		<c:if test="${inquiry.status eq 'N'}"><span class="label label-primary">답변 대기</span></c:if>
											<c:if test="${inquiry.status eq 'Y'}"><span class="label label-secondary">답변 완료</span></c:if>
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