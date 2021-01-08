<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>

<div class="col-lg-8 col-xl-9">
  	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">프로필</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">프로필 조회</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">프로필 수정</a></li>
	        </ol>
	    </div>
	</div>
         <div class="card">
             <div class="card-body">
                 <form id="updateMemberForm" class="mt-3 mb-3" method="post" name="updateMemberForm"
							action="memberUpdateEnd.do">
                      <div class="form-group row">
                      	<input type="hidden" name="userNo" id="userNo" value="${ member.userNo }" />
	                	<label class="col-sm-3 col-form-label" for="userId">아이디</label>
	                 <div class="col-sm-9">
	                      <input type="text" class="form-control" name="userId" id="userId" value="${ member.userId }" readonly>
	                 </div>
	                </div>
	                <div class="form-group row">
	                	<label class="col-sm-3 col-form-label" for="password">비밀번호<span class="text-danger">*</span></label>
	                 <div class="col-sm-9">
	                      <input type="password" class="form-control" name="password" id="password" maxlength="15">
	                      <small id="infoPwd" class="form-text text-muted">영대문자, 숫자, 특수문자를 조합하여 8~15자를 입력해주세요.</small>
	                      <small id="okPwd" class="form-text text-success" style="display:none;">사용 가능한 비밀번호입니다.</small>
	                      <small id="validatePwd" class="form-text text-danger" style="display:none;">영대문자, 숫자, 특수문자를 조합하여 8~15자를 입력해주세요.</small>
	                      <small id="checkPwdSpace" class="form-text text-danger" style="display:none;">공백은 입력하실 수 없습니다.</small>
	                      <small id="reqPwd" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
	                 </div>
	                </div>
	                <div class="form-group row">
	                	<label class="col-sm-3 col-form-label" for="pwdCheck">비밀번호 확인<span class="text-danger">*</span></label>
	                 <div class="col-sm-9">
	                      <input type="password" class="form-control" name="pwdCheck" id="pwdCheck" maxlength="15">
	                      <small id="okPwdCheck" class="form-text text-success" style="display:none;">비밀번호가 일치합니다.</small>
	                      <small id="validatePwdCheck" class="form-text text-danger" style="display:none;">입력하신 비밀번호와 일치하지 않습니다.</small>
	                      <small id="reqPwdCheck" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
	                 </div>
	                </div>
	                <div class="form-group row">
	                	<label class="col-sm-3 col-form-label" for="userName">이름</label>
	                 <div class="col-sm-9">
	                      <input type="text" class="form-control" name="userName" id="userName" value="${ member.userName}" readonly>
	                 </div>
	                </div>
	                <div class="form-group row">
	                	<label class="col-sm-3 col-form-label">성별<span class="text-danger">*</span></label>
	                 <div class="col-sm-9">
	                      <label class="radio-inline mr-3 col-form-label">
	                       	<input type="radio" name="gender" id="genderM" value="M" ${ member.gender == 'M' ? 'checked' : ''} onclick="return(false);"> 남
	                       </label>
	                       <label class="radio-inline mr-3 col-form-label">
	                       	<input type="radio" name="gender" id="genderF" value="F" ${ member.gender == 'F' ? 'checked' : ''} onclick="return(false);"> 여
	                       </label>
	                 </div>
	                </div>
	                <div class="form-group row">
	                	<label class="col-sm-3 col-form-label" for="tel">연락처<span class="text-danger">*</span></label>
	                 <div class="col-sm-9">
	                      <input type="tel" class="form-control" name="tel" id="tel" placeholder="ex)010-1234-5678" value="${ member.tel }">
	                      <small id="validateTel" class="form-text text-danger" style="display:none;">입력하신 연락처 형식이 올바르지 않습니다.</small>
	                      <small id="reqTel" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
	                 </div>
	                </div>
	                <div class="form-group row">
	                	<label class="col-sm-3 col-form-label" for="birth">생년월일</label>
	                 <div class="col-sm-9">
	                      <input type="text" class="form-control" name="birth" id="birth" value="${ member.birth}" readonly>
	                 </div>
	                </div>
	                <div class="form-group row">
	                	<label class="col-sm-3 col-form-label" for="email">이메일<span class="text-danger">*</span></label>
	                 <div class="col-sm-9">
	                      <input type="email" class="form-control" name="email" id="email" value="${ member.email }">
	                      <small id="infoEmail" class="form-text text-muted">비밀번호 찾기 시에 사용할 이메일을 입력해주세요.</small>
	                      <small id="okEmail" class="form-text text-success" style="display:none;">사용 가능한 이메일입니다.</small>
	                      <small id="duplicateEmail" class="form-text text-danger" style="display:none;">이미 사용중인 이메일입니다.</small>
	                      <small id="validateEmail" class="form-text text-danger" style="display:none;">입력하신 이메일 형식이 올바르지 않습니다.</small>
	                      <small id="reqEmail" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
	                       <input type="hidden" name="duplicateEmailCheck" id="duplicateEmailCheck" value="0"/>
	                  </div>
	                 </div>
	                 <div class="form-group row">
	                 	<label class="col-sm-3 col-form-label">이메일 수신여부<span class="text-danger">*</span></label>
	                  <div class="col-sm-9">
	                      	<label class="radio-inline mr-3 col-form-label">
	                        	<input type="radio" name="emailStatus" id="emailY" value="Y" checked> 수신
	                        </label>
	                        <label class="radio-inline col-form-label">
	                        	<input type="radio" name="emailStatus" id="emailN" value="N"> 미수신
	                        </label>
	                  </div>
	                 </div>
	                 <div class="form-group row">
	                 	<label class="col-sm-3 col-form-label" for="address">주소<span class="text-danger">*</span></label>
	                  <div class="col-sm-7">
	                      	<input type="text" name="address" id="zipCode" class="form-control" readonly/>
							<input type="text" name="address" id="address1" class="form-control" readonly/>
							<input type="text" name="address" id="address2" class="form-control" placeholder="상세 주소 입력"/>
							<input type="hidden" name="dbAddress" id="dbAddress" value="${member.address}" />
							<small id="reqAddr" class="form-text text-danger" style="display:none;">필수 입력 사항 입니다.</small>
	                 </div>
	                 <div class="col-sm-2">
	                        <button type="button" class="btn btn-flat btn-outline-secondary" onclick="searchAddr()">검색</button>
	                    </div>
	                </div>
	                <div class="mt-5 text-center">
	                	<button type="button" class="btn btn-primary" onclick="checkForm()">수정 하기</button>
	                	<button type="button" class="btn btn-outline-secondary"
	                			onclick="location.href='${contextPath}/member/memberProfileView.do?userNo=${member.userNo}'">프로필로 돌아가기</button>
	             	</div>
	             </form>
	        </div>
	    </div>
	</div>
    
           
    <script>
    	$(function() {
			var dbAddr = $("#dbAddress").val();
			var zipCode = dbAddr.substring(dbAddr.indexOf(","), dbAddr.indexOf(",") - 5); 
			var address1 = dbAddr.substring(dbAddr.lastIndexOf(","), dbAddr.indexOf(",") + 1);
			var address2 = dbAddr.substring(dbAddr.lastIndexOf(",") + 1);

			$("#zipCode").val(zipCode);
			$("#address1").val(address1);
			$("#address2").val(address2);

        });
  		// 엔터 전송 방지
	  	$("input").keydown(function() {
			if(event.keyCode === 13) {
				event.preventDefault();
			};
	     });
	
	  	// 정규식 테스트
	    function chk(re, e){
	    	if(re.test(e)){
	            return true;
	         }
	         return false;
	     };
	
	 	// 공백 체크
 	   	function chkSpace(e) {
 		   	if(e.search(/\s/) != -1){
 			   	return true;
 		   	} else {
 			   return false;
 		   	}
 	   	};

 		// submit 할 때 error 문구 있는지 확인용
	   	var errorPwd = true;
	   	var errorPwd2 = true;
	   	var errorTel = false; // 이미 값이 있음
	   	var errorEmail = false; // 이미 값이 있음
	   	var errorAddr = false ; // 이미 값이 있음
	   	
     	function checkForm() {
         	// 모든 항목에 에러가 없으면 form 전송
     		if(!errorPwd && !errorPwd2 && !errorTel && !errorEmail && !errorAddr) {
     			 $("#updateMemberForm").submit();
     	    } else {
				alert("입력사항을 확인해주세요.");
            }
        };
	
     	$(function() { 

        	/* 비밀번호 */
     		$("#password").blur(function() {
				var pwd = $("#password").val().trim();
				var pwdReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

				if(pwd.length == 0 || pwd == "") {
					// 비밀번호를 입력하지 않았으면 info 메세지를 지우고 req 메세지 보여주기
					$("#infoPwd").css("display", "none");
					$("#okPwd").css("display", "none");
					$("#validatePwd").css("display", "none");
					$("#checkSpace").css("display", "none");
					$("#reqPwd").css("display", "block");
				} else {
					if(pwd.length >= 8) {
						// 비밀번호를 8자 이상 입력했으나
						if(!chk(pwdReg, pwd)){ 
							// 비밀번호 유효성 검사를 통과하지 못하면 validate 메세지 보여주기
							$("#infoPwd").css("display", "none");
							$("#okPwd").css("display", "none");
							$("#validatePwd").css("display", "block");
							$("#reqPwd").css("display", "none");
						} else {
							if(chkSpace(pwd)){
	                    		// 유효성 검사를 통과 했으면 공백검사 (공백입력시)
								$("#infoPwd").css("display", "none");
								$("#okPwd").css("display", "none");
								$("#validatePwd").css("display", "none");
								$("#checkSpace").css("display", "block");
								$("#reqPwd").css("display", "none");
		                      } else {
		                    	// 유효성 검사와 공백 검사를 모두 통과했으면 ok 메세지 보여주기
		                    	$("#infoPwd").css("display", "none");
		      					$("#okPwd").css("display", "block");
		      					$("#validatePwd").css("display", "none");
		      					$("#checkSpace").css("display", "none");
		      					$("#reqPwd").css("display", "none");
		      					errorPwd = false;
		                     } 
						}
					} else {
						// 비밀번호를 8자 미만으로 입력했으면
						$("#infoPwd").css("display", "none");
   						$("#okPwd").css("display", "none");
   						$("#validatePwd").css("display", "block");
   						$("#checkSpace").css("display", "none");
   						$("#reqPwd").css("display", "none");
					}
				}
        	}); // 비밀번호 전체 체크 종료

         	/* 비밀번호 확인 */
			$("#pwdCheck").blur(function() {
				var pwd = $("#password").val();
				var pwdCheck = $("#pwdCheck").val();
				
				if(pwdCheck.length == 0 || pwdCheck == "") {
					$("#okPwdCheck").css("display", "none");
					$("#validatePwdCheck").css("display", "none");
					$("#reqPwdCheck").css("display", "block");
				} else {
					if(pwd != pwdCheck) {
						$("#okPwdCheck").css("display", "none");
						$("#validatePwdCheck").css("display", "block");
						$("#reqPwdCheck").css("display", "none");
					} else {
						$("#okPwdCheck").css("display", "block");
						$("#validatePwdCheck").css("display", "none");
						$("#reqPwdCheck").css("display", "none");
						errorPwd2 = false;
					}
				}
			});

			/* 연락처 */
			var tel = $("#tel").val();
			var telReg = /^\d{2,3}-\d{3,4}-\d{4}$/;

			if(tel.length == 0 || tel == "") {
				// 연락처를 입력하지 않았으면 req 메세지 보여주기
				$("#validateTel").css("display", "none");
				$("#reqTel").css("display", "block");
				errorTel = true;
			} else {
				// 연락처를 입력했으나
				if(!chk(telReg, tel)){ 
					// 연락처 유효성 검사를 통과하지 못하면 validate 메세지 보여주기
					$("#validateTel").css("display", "block");
					$("#reqTel").css("display", "none");
					errorTel = true;
				} else {
               	 	// 유효성 검사 통과하면 error 메세지 지우기
					$("#validateTel").css("display", "none");
					$("#reqTel").css("display", "none");
					errorTel = false;
                   }
			}
			
			/* 이메일 */
			var originEmail = $("#email").val();
			var emailReg = /^[a-z][a-z0-9_-]{3,20}@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;

			$("#email").change(function(){
				var changeEmail = $(this).val();

				if(originEmail != changeEmail) {
					if(changeEmail.length == 0 || changeEmail == "") {
						// 이메일을 입력하지 않았으면
						$("#infoEmail").css("display", "none");
						$("#okEmail").css("display", "none");
						$("#duplicateEmail").css("display", "none");
						$("#validateEmail").css("display", "none");
						$("#reqEmail").css("display", "block");
						errorEmail = true;
					} 
					if(!chk(emailReg, changeEmail)){ 
						// 이메일 유효성 검사를 통과하지 못하면 validate 메세지 보여주기
						$("#infoEmail").css("display", "none");
						$("#okEmail").css("display", "none");
						$("#duplicateEmail").css("display", "none");
						$("#validateEmail").css("display", "block");
						$("#reqEmail").css("display", "none");
						errorEmail = true;
					} else {
						// ajax로 중복 여부 체크
						$.ajax({
							url: "${contextPath}/member/checkEmailDuplicate.do",
							data : {email: changeEmail},
							dataType: "json",
							success: function(data) {
								if(data.isUsable) {
									// 중복되지 않은 경우 ok
									$("#infoEmail").css("display", "none");
									$("#okEmail").css("display", "block");
									$("#duplicateEmail").css("display", "none");
									$("#validateEmail").css("display", "none");
									$("#reqEmail").css("display", "none");
									$("#duplicateEmailCheck").val(1);
									errorEmail = false;
								} else {
									// 중복 된 경우
									$("#infoEmail").css("display", "none");
									$("#okEmail").css("display", "none");
									$("#duplicateEmail").css("display", "block");
									$("#validateEmail").css("display", "none");
									$("#reqEmail").css("display", "none");
									$("#duplicateEmailCheck").val(0);
									errorEmail = true;
								}
							},
							error: function(jqxhr, textStatus, errorThrown){
				                console.log("email 중복체크 ajax 처리 실패");
				                //에러 로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
						});
					}
				} else {
					// 기존 이메일 주소와 바뀐 이메일 주소가 같다면
					$("#infoEmail").css("display", "block");
					$("#okEmail").css("display", "none");
					$("#duplicateEmail").css("display", "none");
					$("#validateEmail").css("display", "none");
					$("#reqEmail").css("display", "none");
					errorEmail = false;
					return;
				}
			});

			/* 주소 */
			if($("#zipCode").val().length == 0 && $("#zipCode").val() == "" &&
				$("#address1").val().length == 0 && $("#address1").val() == "" &&
				$("#address2").val().length == 0 && $("#address2").val() == "" ) {
				$("#reqAddr").css("display", "block");
				errorAddr = true;
			} else {
				$("#reqAddr").css("display", "none");
				errorAddr = false;
			}
			
        });

     </script>
       
     <script>
		// 참조 API : http://postcode.map.daum.net/guide
		function searchAddr() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#zipCode").val(data.zonecode); //5자리 새우편번호 사용
	                
	                $("#address1").val(fullAddr);

	                // 커서를 상세주소 필드로 이동한다.
	                $("#address2").focus();
	            }
	        }).open();
	    };
	    
	</script>

</body>
</html>