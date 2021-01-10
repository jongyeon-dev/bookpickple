<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

 <div class="container h-100">
     <div class="row justify-content-center h-100">
     
         <div class="col-xl-6">
             <div class="form-input-content">
                 <div class="card mb-0">
                     <div class="card-body pt-5">
                         <h4 class="text-center mb-5">
	                         <a href="${contextPath}/">
	               				<img src="${contextPath}/resources/images/common/logo-purple.png" alt="BookPickple" width="150" height="32">
	            			</a>
	            			<p class="mt-3 font-weight-bold">아이디 찾기</p>
                         </h4>
	                         <form id="findIdForm" class="mt-3 mb-3" method="post" name="findIdForm">
	                             <div class="form-group row">
	                             	<label class="col-sm-3 col-form-label" for="findIdByEmail">이메일 주소</label>
		                             <div class="col-sm-9">
		                                  <input type="email" class="form-control" name="findIdByEmail" id="findIdByEmail" autocomplete="off">
		                                  <small id="reqEmail1" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
		                             </div>
	                             </div>
	                             <button class="btn login-form__btn submit w-100 mt-5" onclick="findId()">아이디 찾기</button>
	                         </form>
                         </div>
                     </div>
                 </div>
             </div>
             
              <div class="col-xl-6">
	             <div class="form-input-content">
	                 <div class="card mb-0">
	                     <div class="card-body pt-5">
	                         <h4 class="text-center mb-5">
		                         <a href="${contextPath}/">
		               				<img src="${contextPath}/resources/images/common/logo-purple.png" alt="BookPickple" width="150" height="32">
		            			</a>
		            			<p class="mt-3 font-weight-bold">비밀번호 찾기</p>
	                         </h4>
		                         <form id="findPwdForm" class="mt-3 mb-3" method="post" name="loginForm">
		                             <div class="form-group row">
		                             	<label class="col-sm-3 col-form-label" for="findPwdById">아이디</label>
			                             <div class="col-sm-9">
			                                  <input type="text" class="form-control" name="userId" id="findPwdById" autocomplete="off">
			                                  <small id="reqId" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
			                             </div>
		                             </div>
		                             <div class="form-group row">
		                             	<label class="col-sm-3 col-form-label" for="findPwdByEmail">이메일 주소</label>
			                             <div class="col-sm-9">
			                                  <input type="email" class="form-control" name="email" id="findPwdByEmail" autocomplete="off">
			                                  <small id="reqEmail2" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
			                             </div>
		                             </div>
		                             <button class="btn login-form__btn submit w-100" onclick="findPwd()">비밀번호 찾기</button>
		                         </form>
	                         </div>
	                     </div>
	                 </div>
	             </div>
             
         </div>
     </div>
     
<script>

$(function() {

	$("#findIdByEmail").blur(function() {
		var findIdByEmail = $("#findIdByEmail").val().trim();
		
		if(findIdByEmail.length == 0 || findIdByEmail == "") {
			$("#reqEmail1").css("display", "block");
  		} else {
	  			$("#reqEmail1").css("display", "none");
         }
  	});
	
  	$("#findPwdById").blur(function() {
		var id = $("#findPwdById").val()
		
		if(id.length == 0 || id == "") {
			$("#reqId").css("display", "block");
  		} else {
	  			$("#reqId").css("display", "none");
         }
  	});

  	$("#findPwdByEmail").blur(function() {
		var id = $("#findPwdByEmail").val()
		
		if(id.length == 0 || id == "") {
			$("#reqEmail2").css("display", "block");
  		} else {
	  			$("#reqEmail2").css("display", "none");
         }
  	});
});

function findId(){
	$.ajax({
		type: "post",
		async: false,
		url: "${contextPath}/member/findId.do",
		data: {
			findIdByEmail: $("#findIdByEmail").val()
		},
		success: function(data){
			if(data.trim() == "failFindId") {
				alert("등록되지 않은 이메일입니다.");
			} else {
				alert("고객님의 아이디는 " + data + " 입니다.");
			}
		},
		error: function(jqxhr, textStatus, errorThrown){
            alert("아이디 찾기 에러! 관리자에게 문의해주세요.");
            //에러 로그
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
        }
	});
}

function findPwd() {
	$.ajax({
		type: "post",
		async: false,
		url: "${contextPath}/member/findPwd.do",
		data: {
			userId: $("#findPwdById").val(),
			email: $("#findPwdByEmail").val()
		},
		success: function(data){
			if(data.trim() == "successNewPwd") {
				alert("이메일 주소로 임시 비밀번호를 발급하였습니다.");
			} else if(data.trim() == "failNewPwd") {
				alert("임시 비밀번호 메일 전송에 실패하였습니다.");
			} else {
				alert("입력 정보를 확인해주세요.");
			}
		},
		error: function(jqxhr, textStatus, errorThrown){
            alert("임시 비밀번호 발급 에러! 관리자에게 문의해주세요.");
            //에러 로그
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
        }
	});
}
      
</script>
