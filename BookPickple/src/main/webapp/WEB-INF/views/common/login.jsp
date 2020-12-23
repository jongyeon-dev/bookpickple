<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>

 <div class="container h-100">
     <div class="row justify-content-center h-100">
         <div class="col-xl-6">
             <div class="form-input-content">
                 <div class="card mb-0">
                     <div class="card-body pt-5">
                         <h4 class="text-center">
	                         <a href="${contextPath}/">
	               				<img src="${contextPath}/resources/images/common/logo-purple.png" alt="BookPickple" width="150" height="32">
	            			</a>
                         </h4>
                         <form id="loginForm" class="mt-3 mb-3" method="post" name="loginForm"
									action="memberLoginEnd.do">
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="userId">아이디</label>
	                             <div class="col-sm-9">
	                                  <input type="text" class="form-control" name="userId" id="userId" maxlength="20">
	                                  <small id="reqId" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="password">비밀번호</label>
	                             <div class="col-sm-9">
	                                  <input type="password" class="form-control" name="password" id="password" maxlength="15" onkeyup="enterkey()">
	                                  <small id="reqPwd" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
	                             </div>
                             </div>
                             <button class="btn login-form__btn submit w-100">로그인</button>
                         </form>
                             <p class="mt-5 login-form__footer text-center">
                             	<a href="${contextPath}/member/memberJoinView.do" class="text-primary mr-4" style="font-size:12px;">회원가입</a>
                             	<a href="${contextPath}/member/findIdPwd.do" class="text-primary ml-3" style="font-size:12px;">아이디/비밀번호 찾기</a>
                             </p>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
     
     <script>
     	function enterkey() {
	        if (window.event.keyCode == 13) {
	        	$("#loginForm").submit();
	        }
		}
	     
        $(function() {

     		$("#userId").blur(function() {
     			var userId = $("#userId").val().trim();
     			
     			if(userId.length == 0 || userId == "") {
     				$("#reqId").css("display", "block");
         		} else {
         			$("#reqId").css("display", "none");
                }
         	});

         	$("#password").blur(function() {
     			var pwd = $("#password").val()
     			
     			if(pwd.length == 0 || pwd == "") {
     				$("#reqPwd").css("display", "block");
         		} else {
         			$("#reqPwd").css("display", "none");
                }
         	});
        });
     </script>
</body>
</html>
      
