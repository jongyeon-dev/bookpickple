<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div class="container">
	<div class="goods-list">
		<c:forEach items="${list}" var="book">
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
			    		<a href="${contextPath}/book/detailBookView.do?bookNo=${book.bookNo}">
			    			<img src="${contextPath}/resources/bookFileRepo/${book.bookNo}/${book.changeFileName}" width="95px" alt="${book.title}">
			    		</a>
			    	</td>
			    	<td class="goods-infogrp">
			    		<p class="goods-title">
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
			    			<em class="text-primary font-weight-bold book-price">${book.salesPrice}원</em>
			    			<span>(10% 할인)</span>
			    			<em class="divi">|</em>
			    			<span class="goods-point">포인트 <em class="text-primary">${book.point}</em>원</span>
			    		</div>
			    		<div class="goods-selling">
			    			<span class="goods-review">
			    				회원 리뷰( <em class="text-secondary">100수정</em> 건)
			    			</span>
			    			<em class="divi">|</em>
			    			<span class="goods-rating"><em>9.5수정</em></span>
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
		            			<button class="btn mb-2 btn-primary btn-sm btn-flat"><i class="fa fa-shopping-cart"></i> 카트에 담기</button>
			    				<button class="btn btn-outline-secondary btn-sm btn-flat"><i class="fa fa-credit-card"></i> 바로 구매</button>
		            		</c:otherwise>
		            	</c:choose>
			    	</td>
			    	</tr>
			    	<tr>
			    		<td colspan="3" class="goods-division">
			    	</tr>
			    </tbody>
			</table>
		</c:forEach>
	</div>
	<div class="pt-5 pb-1">
		<c:out value="${pageBar}" escapeXml="false"/>
	</div>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script>
	// 출판일 파싱
	var splitDate = $("#dbPublishedDate").val().split(" ")[0].split("-");
	var finalPubDate = splitDate[0] + "년 " +splitDate[1] + "월"
	$(".book-pub-date").text(finalPubDate);
</script>
