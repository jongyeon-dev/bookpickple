<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
	    		<span class="goods-count">${book.rownum }</span>
	    		<a href="${contextPath }/detailBook.do?bookNo="+${bookNo}">
	    			<img src="${contextPath}/resources/bookFileRepo/${book.bookNo}/${book.changeFileName}" width="95px" alt="${book.title}">
	    		</a>
	    	</td>
	    	<td class="goods-infogrp">
	    		<p class="goods-title">
	    			<a href="${contextPath}/detailBook.do?bookNo="+${bookNo}><em class="font-weight-bold">${book.title}</em>
	    			</a>
	    		</p>
	    		<div class="goods-info">
	    			<span class="book-auth">${book.writer} 저</span>
		        	<em class="divi">|</em>
			        <span class="book-pub">${book.publisher}</span>
			        <em class="divi">|</em>
			        <span class="book-pub">${book.publishedDate}</span>
	    		</div>
	    		<div class="good-price">
	    			<em class="text-primary font-weight-bold book-price">${book.salesPrice}원</em>
	    			<span>(10% 할인)</span>
	    			<em class="divi">|</em>
	    			<span class="goods-point">포인트 <em class="text-primary">${book.point}</em>원</span>
	    		</div>
	    		<div class="goods-selling">
	    			<span class="goods-sell">
	    				판매지수 123456(수정)
	    			</span>
	    			<em class="divi">|</em>
	    			<span class="goods-review">
	    				회원 리뷰( <em class="text-secondary">100수정</em> 건)
	    			</span>
	    			<span class="goods-rating"><em>9.5수정</em></span>
	    		</div>
	    		<div class="goods_deli">
	    			<strong>출고 예상일 : 1일 이내 (팝업)</strong>
	    		</div>
	    	</td>
	    	<td class="goods-btn">
	    		<button class="btn mb-2 btn-primary btn-sm btn-flat"><i class="fa fa-shopping-cart"></i> 카트에 담기</button>
	    		<button class="btn btn-outline-secondary btn-sm btn-flat"><i class="fa fa-credit-card"></i> 바로 구매</button>
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

</body>
</html>