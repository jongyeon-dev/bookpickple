<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<link href="${contextPath}/resources/plugins/summernote/summernote-lite.min.css" rel="stylesheet" type="text/css">
<script src="${contextPath}/resources/plugins/summernote/summernote-lite.js"></script>
<script src="${contextPath}/resources/plugins/summernote/summernote-ko-KR.min.js"></script>

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="page-titles">
		    <div class="col">
		        <ol class="breadcrumb">
		        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">EDM 전송</a></li>
		        </ol>
		    </div>
		</div>
    	
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                	<form id="mailForm">
                    	<div class="form-group">
                             <input type="text" class="form-control bg-transparent" name="mailTitle" id="mailTitle" placeholder="제목을 입력하세요.">
                         </div>
	                      <textarea name="mailContent" style="display: none;"></textarea>
						  <textarea id="summernote"></textarea>
						  <div class="mt-5 text-center">
						 	 <button type="button" class="btn mb-1 btn-flat btn-primary" onclick="mailFormSubmit()">메일 전송</button>
					 	 </div>
					 </form>
                </div>
            </div>
        </div>
    </div>
</div>



<script>
$(function() {

	


});

$('#summernote').summernote({
	 height: ($(window).height() - 500),
	 lang: "ko-KR"
});

function mailFormSubmit() {
	$('textarea[name="mailContent"]').val($('#summernote').val());
	$("#mailForm").attr("method", "post");
	$("#mailForm").attr("action", "${contextPath}/mail/sendMailEnd.do");
	$("#mailForm").submit();
};
</script>

