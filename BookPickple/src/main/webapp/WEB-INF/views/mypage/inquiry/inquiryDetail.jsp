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
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 유형</th>
				      <td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
				      	<c:if test="${inquiryDetail.type eq 'BOOK'}">도서</c:if>
       					<c:if test="${inquiryDetail.type eq 'DELIVERY'}">주문/배송</c:if>
       					<c:if test="${inquiryDetail.type eq 'IMPROVE'}">개선</c:if>
       					<c:if test="${inquiryDetail.type eq 'ETC'}">기타</c:if>
				      </td>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 상태</th>
				      <td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
				      	<c:if test="${inquiryDetail.status eq 'N'}"><span class="label label-primary">답변 대기</span></c:if>
						<c:if test="${inquiryDetail.status eq 'Y'}"><span class="label label-secondary">답변 완료</span></c:if>
				      </td>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 날짜</th>
				      <td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${inquiryDetail.creDate }</td>
				    </tr>
				    <tr>
				      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 제목</th>
				      <td width="420" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="font-weight-bold">${inquiryDetail.title }</td>
				    </tr>
				    <tr>
				    	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 내용</th>
				      	<td width="420" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;"><p>${fn:replace(inquiryDetail.content,crcn,br)}</p></td>
				    </tr>
				   </tbody>
			   </table>
			</div>
			
			<div class="text-center">
				<button type="button" class="btn mb-1 btn-outline-primary btn-flat" onclick="javascirpt:history.back()">목록으로 돌아가기</button>
			</div>
			
		</div>
	</div>
	
</div>
