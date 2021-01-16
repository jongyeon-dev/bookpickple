<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

 <div class="col-lg-8 col-xl-9">
 	<div class="row page-titles">
        <div class="col">
            <ol class="breadcrumb">
            	<li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">프로필</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">프로필 조회</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">비밀번호 확인</a></li>
            </ol>
        </div>
    </div>
     <div class="card">
         <div class="card-body">
         	<p class="text-center mb-5">회원님의 온라인 정보 보호를 위한 본인 확인 절차이오니,<br>
				<em class="text-primary">BookPickple</em> 로그인 시 사용하는 비밀번호를 입력해주세요.</p>
             <form id="confirmPwdForm" class="mt-3 mb-3" method="post" name="confirmPwdForm"
					action="confirmPwd.do">
                 <div class="form-group row">
	                  	<label class="col-sm-3 col-form-label">아이디</label>
	                    <div class="col-sm-6">
	                    	<input type="hidden" id="userNo" name="userNo" value="${ member.userNo }"/>
	                    <p class="mb-0">${ member.userId }</p>
	               </div>
	              </div>
             
            	<div class="form-group row">
	              	<label class="col-sm-3 col-form-label" for="password">비밀번호</label>
	                <div class="col-sm-9">
	                     <input type="password" class="form-control" name="password" id="password" maxlength="15" onkeyup="enterkey()">
	                     <small id="reqPwd" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
	                </div>
	              </div>
             
	              <div class="mt-5 text-center">
	              	<button type="submit" class="btn btn-primary">비밀번호 확인</button>
	              	<button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back()">취소</button>
	          	</div>
             </form>
         </div>
     </div>
 </div>
    
    <script>
     	function enterkey() {
	        if (window.event.keyCode == 13) {
	        	$("#confirmPwdForm").submit();
	        }
		}
	     
        $(function() {

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