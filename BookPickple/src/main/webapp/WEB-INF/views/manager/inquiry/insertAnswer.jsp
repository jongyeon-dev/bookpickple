<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<div class="container">

	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">마이 페이지</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">1:1 문의 답변 하기</a></li>
	        </ol>
	    </div>
	</div>
	
	<div class="card">
		<div class="card-body">
			<div class="form-input-content">
                <div class="card mb-0">
                    <div class="card-body pt-2 pb-2">
                        <form class="mt-3 mb-3" name="inquiryForm" id="inquiryForm">
                            <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="type">문의 유형</label>
	                             <div class="col-sm-5">
	                                  <select class="form-control" name="type" id="type">
                                           <option value="BOOK" selected>도서</option>
                                           <option value="DELIVERY">주문/배송</option>
                                           <option value="IMPROVE">개선</option>
                                           <option value="ETC">기타</option>
                                       </select>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="title">문의 제목</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="title" id="title" autocomplete="off">
	                             </div>
                             </div>
                            <div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="content">문의 내용</label>
	                             <div class="col-sm-7">
	                                  <textarea class="form-control h-150px" rows="6" name="content" id="content" style="resize: none;"></textarea>
	                             </div>
                            </div>
                            <div class="mt-5 text-center">
			                  	<button type="submit" class="btn btn-primary">문의 하기</button>
			                  	<button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back()">돌아가기</button>
			              	</div>
                        </form>
                    </div>
                </div>
            </div>
		</div>
	</div>
	
</div>

<script src="${contextPath}/resources/plugins/validation/jquery.validate.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/additional-methods.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/messages_ko.min.js"></script>
<script>
$(function($) {
    $("#inquiryForm").validate({
    	submitHandler: function() {
            var f = confirm("문의 하시겠습니까?");
            if(f){
            	$.ajax({
        			type: "post",
        			async: false,
        			url: "${contextPath}/inquiry/insertInquiryEnd.do",
        			data: {
            			userNo: ${member.userNo},
        				type: $("#type").val(),
        				title: $("#title").val(),
        				content: $("#content").val(),
        				refNo: $("#refNo").val()
        			},
        			success: function(data){
        				if(data.trim() == "success") {
        					alert("문의 등록이 완료되었습니다.");
        					location.href="${contextPath}/inquiry/inquiryListView.do?userNo="+${member.userNo};
        				} else {
        					alert("문의 등록이 되지 않았습니다. 관리자에게 문의해주세요.");
        					window.location.reload();
        				}
        			},
        			error: function(jqxhr, textStatus, errorThrown){
                        console.log("문의 등록 처리 실패");
                        //에러 로그
                        console.log(jqxhr);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
        		});
            } else {
                return false;
            }
        },
      rules: {
    	  titie: {
	          required: true
	        },
			content: {
			  required: true
			}
      },
      messages: {
    	  title: {
              required: "필수 입력 사항입니다."
         },
    	  content: {
              required: "필수 입력 사항입니다."
         }
      }
    });
    
 });
</script>