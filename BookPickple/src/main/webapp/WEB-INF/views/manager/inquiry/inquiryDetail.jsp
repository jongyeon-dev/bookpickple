<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div class="container">

	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">1:1 문의 내역 조회</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">1:1 문의 내역 상세</a></li>
	        </ol>
	    </div>
	</div>
	
	<div class="card">
		<div class="card-body">
			<c:if test="${inquiryDetail.clevel == 1 and inquiryDetail.status == 'N' }">
				<div class="mb-5" style="float:right;">
					<button type="button" class="btn mb-1 btn-flat btn-primary"
						onclick="displayForm()">답변 하기</button>
				</div>
			</c:if>
			<div class="table-responsive custom-list mt-5 mb-5">
				<table class="table header-border" style="padding: 30px;">
				  <tbody>
				  	<c:if test="${inquiryDetail.clevel == 1 }">
					    <tr>
						      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 유형</th>
						      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
						      	<c:if test="${inquiryDetail.type eq 'BOOK'}">도서</c:if>
			      					<c:if test="${inquiryDetail.type eq 'DELIVERY'}">주문/배송</c:if>
			      					<c:if test="${inquiryDetail.type eq 'IMPROVE'}">개선</c:if>
			      					<c:if test="${inquiryDetail.type eq 'ETC'}">기타</c:if>
						      </td>
						      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 상태</th>
						      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
						      	<c:if test="${inquiryDetail.status eq 'N'}"><span class="label label-primary">미답변</span></c:if>
								<c:if test="${inquiryDetail.status eq 'Y'}"><span class="label label-secondary">답변완료</span></c:if>
						      </td>
					     </tr>
					     <tr>
					     	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">작성자</th>
					      	<td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${inquiryDetail.userId}</td>
					      	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 날짜</th>
					      	<td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${inquiryDetail.creDate }</td>
					    </tr>
					    <tr>
					      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 제목</th>
					      <td width="420" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="font-weight-bold">${inquiryDetail.title }</td>
					    </tr>
					    <tr>
					    	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 내용</th>
					      	<td width="420" height="31" bgcolor="#FFFFFF" class="mt-2 mb-2"style="padding: 0 0 0 10px; white-space:pre; line-height: 30px;"><c:out value="${inquiryDetail.content}" /></td>
					    </tr>
				    </c:if>
				    <c:if test="${inquiryDetail.clevel == 2 }">
					    <tr>
						      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">문의 유형</th>
						      <td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
						      	<c:if test="${inquiryDetail.type eq 'BOOK'}">도서</c:if>
			      					<c:if test="${inquiryDetail.type eq 'DELIVERY'}">주문/배송</c:if>
			      					<c:if test="${inquiryDetail.type eq 'IMPROVE'}">개선</c:if>
			      					<c:if test="${inquiryDetail.type eq 'ETC'}">기타</c:if>
						      </td>
						      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">답변 상태</th>
					      	<td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">
								<c:if test="${inquiryDetail.status eq null}"><span class="label label-secondary">답변 완료</span></c:if>
					      	</td>
					     </tr>
					     <tr>
					     	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">작성자</th>
					      	<td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${inquiryDetail.userId}</td>
					      	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">답변 날짜</th>
					      	<td width="210" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;">${inquiryDetail.creDate }</td>
					    </tr>
					    <tr>
					      <td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">답변 제목</th>
					      <td width="420" height="31" bgcolor="#FFFFFF" style="padding: 0 0 0 10px;" class="font-weight-bold">${inquiryDetail.title }</td>
					    </tr>
					    <tr>
					    	<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">답변 내용</th>
					    	<td width="420" height="31" bgcolor="#FFFFFF" class="mt-2 mb-2"style="padding: 0 0 0 10px; white-space:pre; line-height: 30px;"><c:out value="${inquiryDetail.content}" /></td>
					    </tr>
				    </c:if>
				   </tbody>
			   </table>
			</div>
			
			<div class="wrap-answerForm form-input-content">
                <div class="card mb-0">
                    <div class="card-body pt-2 pb-2">
                        <form class="mt-3 mb-3" name="answerForm" id="answerForm">
                             <div class="form-group row">
                             	<input type="hidden" name="inquiryNo" id="inquiryNo" value="${inquiryDetail.inquiryNo}"/>
                             	<input type="hidden" name="refNo" id="refNo" value="${inquiryDetail.inquiryNo}"/>
                             	<input type="hidden" name="type" id="type" value="${inquiryDetail.type}"/>
                             	<label class="col-sm-3 col-form-label" for="title">답변 제목</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="title" id="title" autocomplete="off" value="BookPickple에서 답변 드립니다.">
	                             </div>
                             </div>
                            <div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="content">답변 내용</label>
	                             <div class="col-sm-7">
	                                  <textarea class="form-control h-150px" rows="6" name="content" id="content" style="resize: none;"></textarea>
	                             </div>
                            </div>
                            <div class="mt-5 text-center">
			                  	<button type="submit" class="btn btn-primary">답변 등록</button>
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
	$(".wrap-answerForm").hide();

	 $("#answerForm").validate({
	    	submitHandler: function() {
	            var f = confirm("답변 등록을 하시겠습니까?");
	            if(f){
	            	$.ajax({
	        			type: "post",
	        			async: false,
	        			url: "${contextPath}/manager/insertAnswerEnd.do",
	        			data: {
	        				inquiryNo: $("#inquiryNo").val(),
		        			type: $("#type").val(),
	            			userNo: ${member.userNo},
	        				title: $("#title").val(),
	        				content: $("#content").val(),
	        				refNo: $("#refNo").val()
	        			},
	        			success: function(data){
	        				if(data.trim() == "success") {
	        					alert("답변 등록이 완료되었습니다.");
	        					location.href="${contextPath}/manager/inquiryListView.do";
	        				} else {
	        					alert("답변 등록이 되지 않았습니다.");
	        					window.location.reload();
	        				}
	        			},
	        			error: function(jqxhr, textStatus, errorThrown){
	                        console.log("답변 등록 처리 실패");
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
	          title: {
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

function displayForm() {
	$(".wrap-answerForm").toggle();
	
}
</script>
