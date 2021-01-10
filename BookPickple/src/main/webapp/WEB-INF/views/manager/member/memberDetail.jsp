<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="page-titles">
		    <div class="col">
		        <ol class="breadcrumb">
		        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">회원 목록 조회</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">회원 상세 조회</a></li>
		        </ol>
		    </div>
		</div>
    	
    <div class="col-xl-12">
            <div class="form-input-content">
                <div class="card mb-0">
                    <div class="card-body pt-2 pb-5 pt-5 pl-5">
						
						<div class="col-12 table-responsive custom-list mb-5">
							<h4 class="mb-5 font-weight-bold">회원 기본 정보</h4>
							<table class="table header-border" style="padding: 30px;">
							  <tbody>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">회원 번호</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.userNo}</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">아이디</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.userId}</td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">이름</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.userName}</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">성별</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.gender == 'M' ? '남' : '여'}</td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">연락처</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.tel}</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">생년월일</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.birth}</td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">이메일</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.email}</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">이메일 수신여부</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.emailStatus == 'Y' ? '수신' : '미수신'}</td>
							    </tr>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">주소</th>
							      <input type="hidden" id="dbAddr" value="${oneMember.address}"/>
				      				<td colspan="3" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="full-address"></td>
							    </tr>
							   </tbody>
						   </table>
						</div>
						
						<div class="col-12 table-responsive custom-list mb-5">
							<h4 class="mb-5 font-weight-bold">구매 정보</h4>
							<table class="table header-border" style="padding: 30px;">
							  <tbody>
							    <tr>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">등급</th>
							      <td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
							      	<c:if test="${oneMember.gradeType == 1}"><span class="label label-light">일반</span></c:if>
								   <c:if test="${oneMember.gradeType == 2}"><span class="label label-primary">실버</span></c:if>
								   <c:if test="${oneMember.gradeType == 3}"><span class="label label-warning">골드</span></c:if>
								   <c:if test="${oneMember.gradeType == 4}"><span class="label label-secondary">프리미엄</span></c:if>
							      </td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">총 구매액</th>
							      <td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="font-weight-bold text-primary">
							      	<fmt:formatNumber  value="${oneMember.totalPrice}" type="number" var="totalPrice" />
							      	${totalPrice}원
							      </td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">보유 포인트</th>
							      <td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="font-weight-bold">
							      	<fmt:formatNumber  value="${oneMember.point}" type="number" var="totalPoint" />
							      	${totalPoint}원
							      </td>
							    </tr>
							   </tbody>
						   </table>
						</div>
						
						<div class="col-12 table-responsive custom-list mb-5">
							<h4 class="mb-5 font-weight-bold">활동 여부</h4>
							<table class="table header-border" style="padding: 30px;">
							  <tbody>
							    <tr>
							    <c:if test="${oneMember.status == 'Y'}">
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">가입일</th>
							      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.joinDate}</td>
							      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">상태</th>
							      	<td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">활동중</td>
							      </c:if>
							      <c:if test="${oneMember.status == 'N'}">
							        <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">가입일</th>
							      	<td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.joinDate}</td>
							      	 <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">상태</th>
							      	<td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">탈퇴</td>
							      	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">탈퇴일</th>
							      	<td width="140" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${oneMember.delDate }</td>
							      </c:if>
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

<script>
$(function() {
	var dbAddr = $("#dbAddr").val().split(",");
	var fullAddr = "";
	
	for(var i = 0; i < dbAddr.length; i++) {
		fullAddr += dbAddr[i] + " ";
	};
	
	$(".full-address").text(fullAddr);
});
</script>