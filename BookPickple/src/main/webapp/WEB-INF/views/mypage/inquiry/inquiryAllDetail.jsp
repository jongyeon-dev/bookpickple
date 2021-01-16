<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
	pageContext.setAttribute("crcn", "\r\n");
	pageContext.setAttribute("br", "<br>");
%>

<div class="col-lg-8 col-xl-9">

	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">마이 페이지</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">1:1 문의 내역 조회</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">1:1 문의 내역 상세</a></li>
	        </ol>
	    </div>
	</div>
	
	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-list mt-5 mb-5">
				<table class="table header-border" style="padding: 30px;">
				  <tbody>
				  <c:forEach items="${inquiryAllDetail}" var="inquiryAllDetail">
				  	<c:if test="${inquiryAllDetail.clevel == 1 }">
					    <tr>
						      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 유형</td>
						      <td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
						      	<c:if test="${inquiryAllDetail.type eq 'BOOK'}">도서</c:if>
			      					<c:if test="${inquiryAllDetail.type eq 'DELIVERY'}">주문/배송</c:if>
			      					<c:if test="${inquiryAllDetail.type eq 'IMPROVE'}">개선</c:if>
			      					<c:if test="${inquiryAllDetail.type eq 'ETC'}">기타</c:if>
						      </td>
						      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 상태</td>
						      <td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
						      	<c:if test="${inquiryAllDetail.status eq 'N'}"><span class="label label-primary">미답변</span></c:if>
								<c:if test="${inquiryAllDetail.status eq 'Y'}"><span class="label label-secondary">답변완료</span></c:if>
						      </td>
						      	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 날짜</td>
					      		<td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${inquiryAllDetail.creDate }</td>
					     </tr>
					     <tr>
					    </tr>
					    <tr>
					      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 제목</td>
					      <td width="420" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="font-weight-bold">${inquiryAllDetail.title }</td>
					    </tr>
					    <tr>
					    	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 내용</td>
					    	<td width="420" height="31" bgcolor="#FFFFFF" class="mt-2 mb-2"style="padding: 0 0 0 10px; white-space: break-spaces; line-height: 30px;"><c:out value="${inquiryAllDetail.content}" /></td>
					    </tr>
				    </c:if>
				    <tr>
				   		<td scope="row" width="150" height="31"></th>
			      		<td width="210" height="31"></td>
				    </tr>
				    <c:if test="${inquiryAllDetail.clevel == 2 }">
					    
					     <tr>
					     	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">작성자</td>
					      	<td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${inquiryAllDetail.userId}</td>
					      	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">답변 날짜</td>
					      	<td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${inquiryAllDetail.creDate }</td>
					    </tr>
					    <tr>
					      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">답변 제목</td>
					      <td width="420" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="font-weight-bold">${inquiryAllDetail.title }</td>
					    </tr>
					    <tr>
					    	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">답변 내용</td>
					    	<td width="420" height="31" bgcolor="#FFFFFF" class="mt-2 mb-2"style="padding: 0 0 0 10px; white-space: break-spaces; line-height: 30px;"><c:out value="${inquiryAllDetail.content}" /></td>
					    </tr>
				    </c:if>
				    </c:forEach>
				   </tbody>
			   </table>
			</div>
		</div>
	</div>
	
</div>