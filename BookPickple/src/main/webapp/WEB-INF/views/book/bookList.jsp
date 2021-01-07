<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<link href="${contextPath}/resources/plugins/barrating/fontawesome-stars.css" rel="stylesheet" type="text/css">
<script src="${contextPath}/resources/plugins/barrating/jquery.barrating.min.js"></script>
<style>
.br-theme-fontawesome-stars .br-widget a {
font-size: 16px !important;
}
</style>

<div class="container">
	<div class="books-list">
		<c:forEach items="${list}" var="book" varStatus="loop">
		<input type="hidden" id="isLogin" value="${isLogin}"/>
		<c:if test="${book.status != 'STOP'}">
			<table width="100%">
				<colgroup>
				    <col width="95">
				    <col>
				    <col width="82">
			    </colgroup>
			    <tbody>
			    <tr>
			    	<td class="goods-img">
			    		<span class="goods-count font-weight-bold">${book.rownum}</span>
			    		<input type="hidden" class="bookImage${book.bookNo}" value="${book.changeFileName}" />
			    		<a href="${contextPath}/book/detailBookView.do?bookNo=${book.bookNo}">
			    			<img src="${contextPath}/resources/bookFileRepo/${book.bookNo}/${book.changeFileName}" width="95px" alt="${book.title}">
			    		</a>
			    	</td>
			    	<td class="goods-infogrp">
			    		<p class="goods-title">
			    			<input type="hidden" class="title${book.bookNo}" value="${book.title}" />
			    			<a href="${contextPath}/book/detailBookView.do?bookNo=${book.bookNo}"><em class="font-weight-bold">${book.title}</em>
			    			</a>
			    		</p>
			    		<div class="goods-info">
			    			<span class="book-auth">${book.writer} 저</span>
				        	<em class="divi">|</em>
					        <span class="book-pub">${book.publisher}</span>
					        <em class="divi">|</em>
					        <input type="hidden" id="dbPublishedDate" value="${book.publishedDate}">
					        <span class="book-pub-date"></span>
			    		</div>
			    		<div class="good-price">
			    			<input type="hidden" class="salesPrice${book.bookNo}" value="${book.salesPrice}"/>
			    			<fmt:formatNumber  value="${book.salesPrice}" type="number" var="salesPrice" />
			    			<em class="text-primary font-weight-bold book-price">${salesPrice}원</em>
			    			<span>(10% 할인)</span>
			    			<em class="divi">|</em>
			    			<input type="hidden" class="point${book.bookNo}" value="${book.point}"/>
			    			<span class="goods-point">포인트 <em class="text-primary">${book.point}</em>원</span>
			    		</div>
			    		<div class="goods-selling" style="display: flex;">
			    			<fmt:parseNumber var="reviewCount" integerOnly="true" type="number" value="${eachReviewList[loop.count-1].count}" />
			    			<span class="goods-review">
			    				회원 리뷰( <em class="text-muted font-weight-bold">${reviewCount}</em> 건)
			    			</span>
			    			<em class="divi" style="margin: 0 5px;">|</em>
			    			<select class="rating" name="rating" autocomplete="off">
		    					<option ${ 0.0 == eachReviewList[loop.count-1].avg ? 'selected':'' } value=""></option>
								<option ${ 0 < eachReviewList[loop.count-1].avg ? 'selected':'' }>1</option>
								<option ${ 1 < eachReviewList[loop.count-1].avg ? 'selected':'' }>2</option>
								<option ${ 2 < eachReviewList[loop.count-1].avg ? 'selected':'' }>3</option>
								<option ${ 3 < eachReviewList[loop.count-1].avg ? 'selected':'' }>4</option>
								<option ${ 4 < eachReviewList[loop.count-1].avg ? 'selected':'' }>5</option>
							</select>
							<span class="book-rating text-muted ml-1 font-weight-bold">${eachReviewList[loop.count-1].avg}</span>
							<em class="divi" style="margin: 0 5px;">|</em>
							<span class="goods-salesCount">
			    				판매량( <em class="text-muted font-weight-bold">${eachSalesCount[loop.count-1]}</em> 권)
			    			</span>
			    		</div>
			    		<div class="goods_deli">
			    			<strong>출고 예상일 : 1일 이내</strong>
			    			<i class="fa fa-info-circle" style="cursor: pointer;"
			    			data-toggle="popover" title="출고예상일과 상품 수령 안내" data-content="주문하신 상품을 확인, 포장하여 발송하는 날을 의미합니다. 출고예상일은 해당 업체의 재고가 원활한 경우 안내된 일정보다 단축될 수 있습니다."></i>
			    		</div>
			    	</td>
			    	<td class="goods-btn">
			    		<c:if test="${book.status == 'ONSALE'}"><p class="font-weight-bold">판매중</p></c:if>
					   	<c:if test="${book.status == 'SOLDOUT'}"><p class="text-danger font-weight-bold">품절</p></c:if>
					   	<c:if test="${book.status == 'OUTOFPRINT'}"><p class="text-danger font-weight-bold">절판</p></c:if>
			    		<c:choose>
		            		<c:when test="${book.status != 'ONSALE'}">
		            			<button class="btn mb-2 btn-primary btn-sm btn-flat" disabled="disabled"><i class="fa fa-shopping-cart"></i> 카트에 담기</button>
			    				<button class="btn btn-outline-secondary btn-sm btn-flat" disabled="disabled"><i class="fa fa-credit-card"></i> 바로 구매</button>
		            		</c:when>
		            		<c:otherwise>
		            			<span><input type="number" class="quantity${book.bookNo}" name="quantity" value="1" min="1" max="5"></span><br>
		            			<button class="btn mb-2 btn-primary btn-sm btn-flat" onclick="insertCart(${book.bookNo}, ${member.userNo})"><i class="fa fa-shopping-cart"></i> 카트에 담기</button>
	    						<button class="btn btn-outline-secondary btn-sm btn-flat" onclick="listEachOrder(${book.bookNo}, ${member.userNo})"><i class="fa fa-credit-card"></i> 바로 구매</button>
	    					
			    			
		            		</c:otherwise>
		            	</c:choose>
			    	</td>
			    	</tr>
			    	<tr>
			    		<td colspan="3" class="goods-division">
			    	</tr>
			    </tbody>
			</table>
			</c:if>
		</c:forEach>
	</div>
	<div class="pt-5 pb-1">
		<c:out value="${pageBar}" escapeXml="false"/>
	</div>
</div>

<script>

	$(function($){
		// 출판일 파싱
		var splitDate = $("#dbPublishedDate").val().split(" ")[0].split("-");
		var finalPubDate = splitDate[0] + "년 " +splitDate[1] + "월"
		$(".book-pub-date").text(finalPubDate);

		$('.rating').barrating({
	        theme: 'fontawesome-stars',
	        readonly: true
	    });
	});

	function insertCart(bookNo, userNo) {
		if($("#isLogin").val() == null || $("#isLogin").val() == "") {
			alert("로그인 후 카트 사용이 가능합니다.");
		} else {
			$.ajax({
				type : "post",
				async : false,
				url: "${contextPath}/cart/insertCart.do",
				data : {"bookNo":bookNo, "userNo": userNo, "quantity": $('.quantity' + bookNo).val() },
				success: function(data) {
					if(data.trim() == "insertCart") {
						alert("카트에 추가되었습니다.");
					} else if(data.trim() == "exist"){
						alert("이미 카트에 등록 된 상품입니다.");
					}
				},
				error : function(data, textStatus) {
					console.log(userNo);
					alert("에러가 발생했습니다."+data);
				}
			});
		}
	}

	function listEachOrder(bookNo, userNo) {
		 var orderForm = $('<form></form>');
	
		 orderForm.attr('action', '${contextPath}/order/eachOrder.do');
	
		 orderForm.attr('method', 'post');
	
		 orderForm.appendTo('body');
	
		 var title = $('.title' + bookNo).val();
		 var quant = $('.quantity' + bookNo).val();
		 var salesPrice = $('.salesPrice' + bookNo).val();
		 var point = $('.point' + bookNo).val();
		 var bookImage = $('.bookImage' + bookNo).val();

		var userNo = ($('<input type="hidden" value="${member.userNo}" name = userNo>'));
		var bookNo = ($('<input type="hidden" value="' + bookNo + '" name = bookNo>'));
		var title = ($('<input type="hidden" value="' + title + '" name = title>'));
		var quantity = ($('<input type="hidden" value="' + quant + '" name = quantity>'));
		var salesPrice = ($('<input type="hidden" value="' + salesPrice + '" name = salesPrice>'));
		var point = ($('<input type="hidden" value="' + point + '" name = point>'));
		var bookImage = ($('<input type="hidden" value="' + bookImage + '" name = bookImage>'));

		orderForm.append(userNo);
		orderForm.append(bookNo);
		orderForm.append(title);
		orderForm.append(quantity);
		orderForm.append(salesPrice);
		orderForm.append(point);
		orderForm.append(bookImage);

		orderForm.submit();
	
	}
</script>
