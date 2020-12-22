<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
</head>
<body>

	<div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
            	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">프로필</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">프로필 조회</a></li>
            </ol>
        </div>
    </div>

	<div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-xl-3">
                <div class="card">
                    <div class="card-body">
                    	<ul>
                    		<li class="nav-label"><a href="${contextPath}/order/orderView.do?userNo=${member.userNo}">주문내역</a></li>
                    		<li class="nav-label active"><a href="${contextPath}/member/memberProfileView.do?userNo=${member.userNo}" class="text-primary font-weight-bold">프로필</a></li>
                    		<li class="nav-label"><a href="${contextPath}/inquiry/inquiryListView.do?userNo=${member.userNo}">1:1 문의</a></li>
                    	</ul>
           			</div>
                </div>  
            </div>
            <div class="col-lg-7 col-xl-8">
                <div class="card">
                    <div class="card-body">
                        <div class="wrap-profile">
                            <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">아이디</label>
	                             <div class="col-sm-7">
	                                  <p class="mb-0">${ member.userId }</p>
	                             </div>
                             </div>
                             
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">이름</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0">${ member.userName }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">성별</label>
	                             <div class="col-sm-7">
                                  	<p class="mb-0">${ member.gender == 'M' ? '남' : '여' }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">연락처</label>
                             	<div class="col-sm-7">
	                             	<p class="mb-0">${ member.tel }</p>
	                            </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">생년월일</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0">${ member.birth }</p>
	                            </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">이메일</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0">${ member.email }</p>
	                            </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">이메일 수신여부</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0">${ member.emailStatus }</p>
	                            </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">주소</label>
	                             <div class="col-sm-7">
	                             	<input type="hidden" id="dbAddr" value="${ member.address }"/>
	                             	<p class="mb-0 full-address"></p>
	                            </div>
                             </div>
                             <div class="mt-5 text-center">
                             	<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/member/confirmPwdView.do'">정보 수정</button>
                             	<button type="button" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/member/memberDelete.do'">회원 탈퇴</button>
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
  </body>
</html>