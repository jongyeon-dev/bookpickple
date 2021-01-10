<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<body>

	
<div class="col-lg-8 col-xl-9">
	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">프로필</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">프로필 조회</a></li>
	        </ol>
	    </div>
	</div>
     <div class="card">
         <div class="card-body">
             <div class="wrap-profile">
             	<div class="form-group row">
                 	<label class="col-sm-3 col-form-label text-primary font-weight-bold">등급
                 	<i class="fa fa-info-circle grade-info" style="cursor: pointer;"></i>
                 	</label>
	                   <div class="col-sm-7">
		                    <c:if test="${member.gradeType == 1}"> <p class="mb-0"><span class="label label-light">일반</span></p></c:if>
						   	<c:if test="${member.gradeType == 2}"> <p class="mb-0"><span class="label label-primary">실버</span></p></c:if>
						   	<c:if test="${member.gradeType == 3}"> <p class="mb-0"><span class="label label-warning">골드</span></p></c:if>
						   	<c:if test="${member.gradeType == 4}"> <p class="mb-0"><span class="label label-secondary">프리미엄</span></p></c:if>
	                   </div>
                  </div>
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
                 	<label class="col-sm-3 col-form-label text-primary font-weight-bold">포인트</label>
	                   <div class="col-sm-7">
	                   		<fmt:formatNumber  value="${ member.point }" type="number" var="memberPoint" />
	                        <p class="mb-0">${ memberPoint }원</p>
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
	                  	<input type="hidden" id="dbBirth" value="${ member.birth }"/>
	                  	<p class="mb-0 full-birth"></p>
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
	                   	<c:if test="${ member.emailStatus == 'Y'}">
	                   		<p class="mb-0">수신</p>
	                   	</c:if>
	                   	<c:if test="${ member.emailStatus == 'N'}">
	                   		<p class="mb-0">미수신</p>
	                   	</c:if>
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
                  	<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#deleteConfirmModal">회원 탈퇴</button>
              	</div>
              	
              	<!-- Modal -->
                 <div class="modal fade" id="deleteConfirmModal">
                   <div class="modal-dialog modal-dialog-centered" role="document">
                     <div class="modal-content">
                       <div class="modal-header">
                         <h5 class="modal-title">회원 탈퇴 확인</h5>
                         <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                       </div>
                       <div class="modal-body">
                         <p>
                           <em class="text-primary">${ member.userName}</em> 님, 정말로 탈퇴하시겠습니까?
                         </p>
                       </div>
                       <div class="modal-footer">
                         <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                         <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/member/memberDelete.do'">탈퇴 확인</button>
                       </div>
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

			var dbBirth = $("#dbBirth").val();
			$(".full-birth").text(dbBirth.substring(0, 4) + "년 " + dbBirth.substring(4, 6) + "월 " + dbBirth.substring(6, 8) + "일");
		});

		$(".grade-info").hover(function () {
		    $(this).popover({
		        title: "등급 안내",
		        content: "<p>일반 : 기본 5% 적립</p><p>실버 : 기본 5% 적립 + 1% 적립</p><p>골드 : 기본 5% 적립 + 2% 적립</p><p>프리미엄 : 기본 5% 적립 + 3% 적립</p>",
		        html: true
		    }).popover('show');
		}, function () {
		    $(this).popover('hide');
		});
	</script>
    
  </body>