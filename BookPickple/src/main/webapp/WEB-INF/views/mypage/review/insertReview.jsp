<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="orderDetail"  value="${oneOrder}"  />
 
<link href="${contextPath}/resources/plugins/barrating/fontawesome-stars.css" rel="stylesheet" type="text/css">
<style>
.br-widget {
	width: 115px;
    float: left;
}
</style>
<script src="${contextPath}/resources/plugins/barrating/jquery.barrating.min.js"></script>
 
<div class="col-lg-8 col-xl-9">

	<div class="row page-titles">
	    <div class="col">
	        <ol class="breadcrumb">
	            <li class="breadcrumb-item"><a href="javascript:void(0)">홈</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">마이 페이지</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">주문 내역 조회</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)">주문 내역 상세</a></li>
	            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">후기 등록</a></li>
	        </ol>
	    </div>
	</div>
	
	<div class="card">
		<div class="card-body">
		
			<div class="table-responsive custom-list mb-5">
			    <table class="table header-border" style="text-align: center;">
			
				<tr>
					 <th rowspan="5"><img src="${contextPath}/resources/bookFileRepo/${oneOrder.bookNo}/${oneOrder.changeFileName}" width="100"></th>
			    </tr>
			    <tr>
					<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">도서 제목</td>
					<td height="31" bgcolor="#FFFFFF" align="left" style="padding: 0 0 0 10px;">${oneOrder.title}</td>	
			    </tr>
			    <tr>
					<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">저자</td>
					<td height="31" bgcolor="#FFFFFF" align="left" style="padding: 0 0 0 10px;">${oneOrder.writer}</td>	
			    </tr>
			    <tr>
					<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">출판사</td>
					<td height="31" bgcolor="#FFFFFF" align="left" style="padding: 0 0 0 10px;">${oneOrder.publisher}</td>	
			    </tr>
			    <tr>
					<td scope="row" width="150" height="31" bgcolor="#F5F5F5" align="center">출판일</td>
					<td height="31" bgcolor="#FFFFFF" align="left" style="padding: 0 0 0 10px;">${oneOrder.publishedDate}</td>	
			    </tr>
			</table>
		</div>
		
		<div class="stars stars-fontawesome ml-5 mr-5">
			<h6 class="mb-3 font-weight-bold">후기를 남겨주세요!</h6>
			<form name="reviewForm" id="reviewForm" method="post">
				<div style="display: flex;">
					<select id="rating" name="rating" autocomplete="off">
						<option value="1" data-html="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5" selected>5</option>
					</select>
					<span class="your-rating">
						<span class="value font-weight-bold"></span>
					</span>
				</div>
	             <div class="review-textarea form-group" style="position: relative;">
	                 <textarea class="form-control h-150px" rows="6" id="content" name="content" style="resize:none;"></textarea>
	             	<span id="counter" style="padding: 0 .5em 0 .5em; position: absolute; top: -25px; right: 0px;">###</span>
	             </div>
	             <div class="text-right">
	                <button type="submit" class="btn mb-1 btn-flat btn-primary btn-flat">등록</button>
	             </div>
			</form>
		</div>
		
	</div>
	
</div>

<script src="${contextPath}/resources/plugins/validation/jquery.validate.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/additional-methods.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/messages_ko.min.js"></script>
<script>
$(function() {
	var currentRating = $('#rating').data('current-rating');

    $('#rating').barrating({
        theme: 'fontawesome-stars',
        initialRating: 5,
        onSelect: function(value, text) {
            if (!value) {
                $('#rating')
                    .barrating('clear');
            } else {
                $('.stars-fontawesome .your-rating')
                    .removeClass('hidden')
                    .find('span')
                    .html(value);
            }
        }
    });

    $('#content').keyup(function (e){
        var content = $(this).val();
        $('#counter').html(content.length + '/300');

        if(content.length > 300) {
			alert("최대 300자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 300));
	        $('#counter').html("(300 / 최대 300자)");
        }
    });
    $('#content').keyup();


    $("#reviewForm").validate({
    	submitHandler: function() {
            var f = confirm("후기를 등록 하시겠습니까?");
            if(f){
            	$.ajax({
        			type: "post",
        			async: false,
        			url: "${contextPath}/review/insertReview.do",
        			data: {
        				orderNum: ${oneOrder.orderNum},
        				orderNo: ${oneOrder.orderNo},
        				userNo: ${member.userNo},
        				bookNo: ${oneOrder.bookNo},
        				rating: $("#rating").val(),
        				content: $("#content").val()
        			},
        			success: function(data){
        				if(data.trim() == "success") {
        					alert("후기 등록이 완료되었습니다.");
        					location.href="${contextPath}/order/orderDetail.do?userNo="+${member.userNo}+"&orderNo="+${oneOrder.orderNo};
        				} else {
        					alert("후기 등록이 되지 않았습니다. 관리자에게 문의해주세요.");
        					window.location.reload();
        				}
        			},
        			error: function(jqxhr, textStatus, errorThrown){
                        console.log("후기 등록 처리 실패");
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
        content: {
          required: true
        }
      },
      messages: {
    	  content: {
              required: "필수 입력 사항입니다."
         }
      }
    });
    
 });
</script>
