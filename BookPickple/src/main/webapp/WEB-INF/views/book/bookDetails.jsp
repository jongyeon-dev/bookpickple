<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%
	pageContext.setAttribute("crcn", "\r\n");
	pageContext.setAttribute("br", "<br>");
%>

<link href="${contextPath}/resources/plugins/barrating/fontawesome-stars.css" rel="stylesheet" type="text/css">
<script src="${contextPath}/resources/plugins/barrating/jquery.barrating.min.js"></script>
<style>
.br-theme-fontawesome-stars .br-widget a {
font-size: 16px !important;
}
</style>

<div class="container">
	<div class="row">
		<div class="wrap-details">
			<div style="overflow: hidden;">
				
					<input type="hidden" id="isLogin" value="${isLogin}"/>
					<div class="details-left">
						<img src="${contextPath}/resources/bookFileRepo/${book.bookNo}/${bookImages[0].changeFileName}" width="200px" alt="${book.title}" />
					</div>
					<div class="details-right">
						<div class="book-info-top">
							<div class="book-title">
								<h2>${book.title}</h2>
							</div>
							<div class="book-pubgrp">
								<span class="book-auth">${book.writer} 저</span>
					        	<em class="divi">|</em>
						        <span class="book-pub">${book.publisher}</span>
						        <em class="divi">|</em>
						        <input type="hidden" id="dbPublishedDate" value="${book.publishedDate}"/>
						        <span class="book-pub-date"></span>
							</div>
							<div class="book-selling">
								<select class="rating" name="rating" autocomplete="off">
									<option ${ 0.0 == eachReviewList[loop.count-1].avg ? 'selected':'' } value=""></option>
									<option ${ 0 < avgRating ? 'selected':'' }>1</option>
									<option ${ 1 < avgRating ? 'selected':'' }>2</option>
									<option ${ 2 < avgRating ? 'selected':'' }>3</option>
									<option ${ 3 < avgRating ? 'selected':'' }>4</option>
									<option ${ 4 < avgRating ? 'selected':'' }>5</option>
								</select>
								<span class="book-rating text-muted ml-1 font-weight-bold">${avgRating}</span>
								<em class="divi">|</em>
								<a href="#reviewArea">
									<span class="book-review">
					    				회원 리뷰( <em class="text-muted font-weight-bold">${reviewCount}</em> 건)
					    			</span>
				    			</a>
							</div>
						</div>
						<div class="book-info-bot">
							<table>
								<colgroup>
						            <col width="110">
						            <col width="150">
						        </colgroup>
						       	<tbody>
						       		<tr>
						       			<th scope="row">정가</th>
						       			<td>
						       				<fmt:formatNumber  value="${book.price}" type="number" var="price" />
						       				${price}원
						       			</td>
						       		</tr>
						       		<tr>
						       			<th scope="row price">판매가</th>
						       			<td class="text-danger font-weight-bold">
						       				<span class="sales-price">
						       					<fmt:formatNumber  value="${book.salesPrice}" type="number" var="sales_price" />
						       					<em>${sales_price}</em>원
					       					</span>(10% 할인)
					       				</td>
						       		</tr>
						       		<tr>
						       			<th scope="row">포인트</th>
						       			<td>
						       				<fmt:formatNumber  value="${book.point}" type="number" var="point" />
						       				${point}원 (5% 적립)
						       			</td>
						       		</tr>
						       	</tbody>
							</table>
						</div>
						<div class="book-action">
							<c:if test="${book.status == 'ONSALE'}"><p class="font-weight-bold">판매중</p></c:if>
						   	<c:if test="${book.status == 'SOLDOUT'}"><p class="text-danger font-weight-bold">품절</p></c:if>
						   	<c:if test="${book.status == 'OUTOFPRINT'}"><p class="text-danger font-weight-bold">절판</p></c:if>
							<dl class="book-quantity">
				                <dt>수량</dt>
				                <dd>
				                	<fmt:formatNumber  value="1" type="number" var="quantity" />
				                    <span><input id="book-quantity" type="text" value="${quantity}" readonly></span>
				                    <button type="button" class="minus"><i class="fa fa-minus-square"></i></button>
				                    <button type="button" class="plus"><i class="fa fa-plus-square"></i></button>
				                </dd>
				            </dl>
				            <p>배송비 : <em>${book.deliveryPrice}원</em></p>
				            <div class="btn-grp">
				            	<c:choose>
				            		<c:when test="${book.status != 'ONSALE'}">
				            			<button class="btn mb-2 btn-primary btn-lg btn-flat" disabled="disabled">카트에 담기</button>
				    					<button class="btn btn-outline-secondary btn-lg btn-flat" disabled="disabled">바로 구매</button>
				            		</c:when>
				            		<c:otherwise>
				            			<button class="btn mb-2 btn-primary btn-lg btn-flat" onclick="insertCart(${book.bookNo}, ${member.userNo})">카트에 담기</button>
				            			<form action="${contextPath}/order/eachOrder.do" method="post" id="orderForm" name="orderForm">
						            			<input type="hidden" name="userNo" value="${member.userNo}" />
												<input type="hidden" name="bookNo" value="${book.bookNo}" />
												<input type="hidden" name="title" value="${book.title}" />
												<input type="hidden" id="quantity" name="quantity" value="1" />
												<input type="hidden" name="salesPrice" value="${book.salesPrice}" />
												<input type="hidden" name="point" value="${book.point}"/>
												<input type="hidden" name="bookImage" value="${bookImages[0].changeFileName}"/>
				    						<button type="submit"class="btn btn-outline-secondary btn-lg btn-flat">바로 구매</button>
				    					</form>
				            		</c:otherwise>
				            	</c:choose>
				    		</div>
						</div>
						
					</div>
				
			</div>
			
			<!--
			<div class="detail-list">
				<div class=""><h2>${book.title}</h2></div>
				<ul>
					<li class="active"><a href="#bookIntro">도서 소개</a></li>
					<li><a href="#bookImage">도서 상세</a></li>
					<li><a href="#wirterIntro">저자 소개</a></li>
					<li><a href="#review">회원 리뷰</a></li>
				</ul>
			</div>
			 -->
			
			<div class="details">
				<div id="bookIntro">
					<h3 class="font-weight-bold">도서 소개</h3>
					<p>${fn:replace(book.bookIntro,crcn,br)}</p>
				</div>
				
				<div id="bookImage">
					<h3 class="font-weight-bold">도서 상세</h3>
					<img src="${contextPath}/resources/bookFileRepo/${book.bookNo}/${bookImages[1].changeFileName}" alt="${book.title} 상세 설명"/>
				</div>
				
				<div id="writerIntro">
					<h3 class="font-weight-bold">저자 소개</h3>
					<p>${fn:replace(book.writerIntro,crcn,br)}</p>
				</div>
				
				<div id="reviewArea" class="review mt-5" style="background: #F3F3F9; padding: 30px">
					<h4 class="font-weight-bold">회원 리뷰</h4>
					<div class="media media-reply" style="display:block;">
						<c:choose>
							<c:when test="${ empty reviewList }">
								<p class="text-center">등록된 리뷰가 없습니다.<br>첫번째 리뷰어가 되어주세요!</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${reviewList}" var="review">
		                         <div class="media-body mb-3" style="background: #fff;">
		                             <div class="d-sm-flex justify-content-between mb-2">
		                                 <h5 class="mb-sm-0" style="display: flex;">${review.userId }
		                                 	<small class="text-muted ml-3">${review.creDate}</small> 
		                                 	<em class="divi" style="margin: 4px -5px 0 12px;">|</em>
		                                 	<small class="text-muted ml-3 mr-1">평점 : </small>
											<select class="rating" name="rating" autocomplete="off">
												<option ${ review.rating == 1 ? 'selected':'' }>1</option>
												<option ${ review.rating == 2 ? 'selected':'' }>2</option>
												<option ${ review.rating == 3 ? 'selected':'' }>3</option>
												<option ${ review.rating == 4 ? 'selected':'' }>4</option>
												<option ${ review.rating == 5 ? 'selected':'' }>5</option>
											</select>
											<span class="your-rating">
												<span class="value text-muted ml-1" style="font-size: 12px;">${review.rating}</span>
											</span>
		                                 </h5>
		                             </div>
		                             <p>${fn:replace(review.content,crcn,br)}</p>
		                        </div>
		                        </c:forEach>
		                          <div class="pt-3 pb-1">
									<c:out value="${pageBar}" escapeXml="false"/>
								</div>
							</c:otherwise>
						</c:choose>
                    </div>
         
				</div>
				
			</div>
		</div>
	</div>
</div>


<script>
	// 출판일 파싱
	var splitDate = $("#dbPublishedDate").val().split(" ")[0].split("-");
	var finalPubDate = splitDate[0] + "년 " +splitDate[1] + "월 " + splitDate[2] + "일"
	$(".book-pub-date").text(finalPubDate);

	$(function($){
		$('.minus').click(function(e){
			e.preventDefault();
			var stat = $('#book-quantity').val();
			var num = parseInt(stat, 10);
			num--;
			
			if(num <= 0){
				alert('1개 이상 구매 가능합니다.');
				num = 1;
			}
			$('#book-quantity').val(num);
			$("#quantity").val(num);
		});
		
		$('.plus').click(function(e){
			e.preventDefault();
			var stat = $('#book-quantity').val();
			var num = parseInt(stat, 10);
			num++;

			if(num > 5){
				alert('최대 수량입니다.');
				num = 5;
			}
			$('#book-quantity').val(num);
			$("#quantity").val(num);
		});

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
				data : {"bookNo":bookNo, "userNo": userNo, "quantity": $('#book-quantity').val() },
				success: function(data) {
					if(data.trim() == "insertCart") {
						alert("카트에 추가되었습니다.");
					} else if(data.trim() == "exist"){
						alert("이미 카트에 등록 된 상품입니다.");
					}
				},
				error: function(jqxhr, textStatus, errorThrown){
	                console.log("카트 수량 변경 ajax 실패");
	                //에러 로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
			});
		}
	}
</script>
