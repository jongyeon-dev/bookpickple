<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%
	pageContext.setAttribute("crcn", "\r\n");
	pageContext.setAttribute("br", "<br>");
%>

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
							<span class="book-rating">10.0(수정)</span>
							<em class="divi">|</em>
							<span class="book-review">
			    				회원 리뷰( <em class="text-secondary">100수정</em> 건)
			    			</span>
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
					       			<td>${book.price}원</td>
					       		</tr>
					       		<tr>
					       			<th scope="row price">판매가</th>
					       			<td class="text-danger font-weight-bold"><span class="sales-price"><em>${book.price}</em>원</span>(10% 할인)</td>
					       		</tr>
					       		<tr>
					       			<th scope="row">포인트</th>
					       			<td>${book.point}원 (5% 적립)</td>
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
			                    <span><input name="quantity" id="quantity" type="text" value="1" readonly></span>
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
			    					<button class="btn btn-outline-secondary btn-lg btn-flat">바로 구매</button>
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
				
				<div class="review mt-5">
					<h3 class="font-weight-bold">회원 리뷰</h3>
					<div class="media media-reply">
                                    
                         <div class="media-body">
                             <div class="d-sm-flex justify-content-between mb-2">
                                 <h5 class="mb-sm-0">u****1 <small class="text-muted ml-3">등록일</small> <em class="divi">|</em> <small class="text-muted ml-3">평점 <em>8</em></small></h5>
                             </div>
                             <p>리뷰내용</p>
                        </div>
                    </div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<script>
	// 출판일 파싱
	var splitDate = $("#dbPublishedDate").val().split(" ")[0].split("-");
	var finalPubDate = splitDate[0] + "년 " +splitDate[1] + "월 " + splitDate[2] + "일"
	$(".book-pub-date").text(finalPubDate);

	$(function(){
		$('.minus').click(function(e){
			e.preventDefault();
			var stat = $('#quantity').val();
			var num = parseInt(stat, 10);
			num--;
			
			if(num <= 0){
				alert('1개 이상 구매 가능합니다.');
				num = 1;
			}
			$('#quantity').val(num);
		});
		
		$('.plus').click(function(e){
			e.preventDefault();
			var stat = $('#quantity').val();
			var num = parseInt(stat, 10);
			num++;

			if(num > 5){
				alert('최대 수량입니다.');
				num = 5;
			}
			$('#quantity').val(num);
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
				data : {"bookNo":bookNo, "userNo": userNo, "quantity": $('#quantity').val() },
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
