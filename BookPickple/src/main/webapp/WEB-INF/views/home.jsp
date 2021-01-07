<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div class="container-fluid">

	<div class="slider-area">
		<div class="block-slider block-slider4">
			<ul class="" id="bxslider-home4">
				<li>
					<img src="http://fakeimg.pl/1163x365/?text=1">
					<div class="caption-group">
						<h2 class="caption title">
							iPhone <span class="primary">6 <strong>Plus</strong></span>
						</h2>
						<h4 class="caption subtitle">Dual SIM</h4>
						<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
					</div>
				</li>
				<li>
					<img src="http://fakeimg.pl/1163x365/?text=2">
					<div class="caption-group">
						<h2 class="caption title">
							by one, get one <span class="primary">50% <strong>off</strong></span>
						</h2>
						<h4 class="caption subtitle">school supplies & backpacks.*</h4>
						<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
					</div>
				</li>
				<li>
					<img src="http://fakeimg.pl/1163x365/?text=3">
					<div class="caption-group">
						<h2 class="caption title">
							Apple <span class="primary">Store <strong>Ipod</strong></span>
						</h2>
						<h4 class="caption subtitle">Select Item</h4>
						<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
					</div>
				</li>
			</ul>
		</div>
  	</div>
            
    <div class="row">
        <div class="quick-menu-area">
		<ul>
			<li class="quick-menu-list">
				<a href="${contextPath}/book/bookList.do?type=IT">
					<svg viewBox="0 0 44 44" style="fill:#FFC9D3;" class="quick-menu-shape">
						<path d="M.001 22s-.046 4.493.453 8.846c.428 3.727 1.402 7.614 3.244 9.456 1.842 1.842 5.729 2.816 9.457 3.244 4.352.499 8.845.453 8.845.453s4.493.046 8.846-.453c3.727-.428 7.614-1.402 9.456-3.244 1.842-1.842 2.816-5.729 3.244-9.456.499-4.353.453-8.846.453-8.846s.046-4.493-.453-8.845c-.428-3.728-1.402-7.615-3.244-9.457C38.46 1.856 34.573.882 30.846.454 26.493-.045 22 .001 22 .001s-4.493-.046-8.845.453C9.427.882 5.54 1.856 3.698 3.698 1.856 5.54.882 9.427.454 13.155-.045 17.507.001 22 .001 22"></path>
					</svg>
					<img alt="IT" src="${contextPath}/resources/images/quickmenu/icon-it.png" class="quick-menu-image">
					<span class="quick-menu-label">IT</span>
				</a>
			</li>
			<li class="quick-menu-list">
				<a href="${contextPath}/book/bookList.do?type=NOVEL">
					<svg viewBox="0 0 44 44" style="fill:#FFE17F;" class="quick-menu-shape">
						<path d="M.001 22s-.046 4.493.453 8.846c.428 3.727 1.402 7.614 3.244 9.456 1.842 1.842 5.729 2.816 9.457 3.244 4.352.499 8.845.453 8.845.453s4.493.046 8.846-.453c3.727-.428 7.614-1.402 9.456-3.244 1.842-1.842 2.816-5.729 3.244-9.456.499-4.353.453-8.846.453-8.846s.046-4.493-.453-8.845c-.428-3.728-1.402-7.615-3.244-9.457C38.46 1.856 34.573.882 30.846.454 26.493-.045 22 .001 22 .001s-4.493-.046-8.845.453C9.427.882 5.54 1.856 3.698 3.698 1.856 5.54.882 9.427.454 13.155-.045 17.507.001 22 .001 22"></path>
					</svg>
					<img alt="소설" src="${contextPath}/resources/images/quickmenu/icon-novel.png" class="quick-menu-image">
					<span class="quick-menu-label">소설</span>
				</a>
			</li>
			<li class="quick-menu-list">
				<a href="${contextPath}/book/bookList.do?type=ECONOMY">
					<svg viewBox="0 0 44 44" style="fill:#C8ED7E;" class="quick-menu-shape">
						<path d="M.001 22s-.046 4.493.453 8.846c.428 3.727 1.402 7.614 3.244 9.456 1.842 1.842 5.729 2.816 9.457 3.244 4.352.499 8.845.453 8.845.453s4.493.046 8.846-.453c3.727-.428 7.614-1.402 9.456-3.244 1.842-1.842 2.816-5.729 3.244-9.456.499-4.353.453-8.846.453-8.846s.046-4.493-.453-8.845c-.428-3.728-1.402-7.615-3.244-9.457C38.46 1.856 34.573.882 30.846.454 26.493-.045 22 .001 22 .001s-4.493-.046-8.845.453C9.427.882 5.54 1.856 3.698 3.698 1.856 5.54.882 9.427.454 13.155-.045 17.507.001 22 .001 22"></path>
					</svg>
					<img alt="경제" src="${contextPath}/resources/images/quickmenu/icon-economy.png" class="quick-menu-image">
					<span class="quick-menu-label">경제</span>
				</a>
			</li>
			<li class="quick-menu-list">
				<a href="${contextPath}/book/bookList.do?type=SOCIETY">
					<svg viewBox="0 0 44 44" style="fill:#ADDEFF;" class="quick-menu-shape">
						<path d="M.001 22s-.046 4.493.453 8.846c.428 3.727 1.402 7.614 3.244 9.456 1.842 1.842 5.729 2.816 9.457 3.244 4.352.499 8.845.453 8.845.453s4.493.046 8.846-.453c3.727-.428 7.614-1.402 9.456-3.244 1.842-1.842 2.816-5.729 3.244-9.456.499-4.353.453-8.846.453-8.846s.046-4.493-.453-8.845c-.428-3.728-1.402-7.615-3.244-9.457C38.46 1.856 34.573.882 30.846.454 26.493-.045 22 .001 22 .001s-4.493-.046-8.845.453C9.427.882 5.54 1.856 3.698 3.698 1.856 5.54.882 9.427.454 13.155-.045 17.507.001 22 .001 22"></path>
					</svg>
					<img alt="사회" src="${contextPath}/resources/images/quickmenu/icon-society.png" class="quick-menu-image">
					<span class="quick-menu-label">사회</span>
				</a>
			</li>
			<li class="quick-menu-list">
				<a href="${contextPath}/book/bookList.do?type=HOBBY">
					<svg viewBox="0 0 44 44" style="fill:#bddee6;" class="quick-menu-shape">
						<path d="M.001 22s-.046 4.493.453 8.846c.428 3.727 1.402 7.614 3.244 9.456 1.842 1.842 5.729 2.816 9.457 3.244 4.352.499 8.845.453 8.845.453s4.493.046 8.846-.453c3.727-.428 7.614-1.402 9.456-3.244 1.842-1.842 2.816-5.729 3.244-9.456.499-4.353.453-8.846.453-8.846s.046-4.493-.453-8.845c-.428-3.728-1.402-7.615-3.244-9.457C38.46 1.856 34.573.882 30.846.454 26.493-.045 22 .001 22 .001s-4.493-.046-8.845.453C9.427.882 5.54 1.856 3.698 3.698 1.856 5.54.882 9.427.454 13.155-.045 17.507.001 22 .001 22"></path>
					</svg>
					<img alt="" src="${contextPath}/resources/images/quickmenu/icon-hobby.png" class="quick-menu-image">
					<span class="quick-menu-label">취미</span>
				</a>
			</li>
			<li class="quick-menu-list">
				<a href="${contextPath}/book/bookList.do?type=new">
					<svg viewBox="0 0 44 44" style="fill:#B08EAD;" class="quick-menu-shape">
						<path d="M.001 22s-.046 4.493.453 8.846c.428 3.727 1.402 7.614 3.244 9.456 1.842 1.842 5.729 2.816 9.457 3.244 4.352.499 8.845.453 8.845.453s4.493.046 8.846-.453c3.727-.428 7.614-1.402 9.456-3.244 1.842-1.842 2.816-5.729 3.244-9.456.499-4.353.453-8.846.453-8.846s.046-4.493-.453-8.845c-.428-3.728-1.402-7.615-3.244-9.457C38.46 1.856 34.573.882 30.846.454 26.493-.045 22 .001 22 .001s-4.493-.046-8.845.453C9.427.882 5.54 1.856 3.698 3.698 1.856 5.54.882 9.427.454 13.155-.045 17.507.001 22 .001 22"></path>
					</svg>
					<img alt="신간" src="${contextPath}/resources/images/quickmenu/icon-new.png" class="quick-menu-image">
					<span class="quick-menu-label">신간</span>
				</a>
			</li>
			<li class="quick-menu-list">
				<a href="${contextPath}/book/bookList.do?type=best">
					<svg viewBox="0 0 44 44" style="fill:#b8bfca;" class="quick-menu-shape">
						<path d="M.001 22s-.046 4.493.453 8.846c.428 3.727 1.402 7.614 3.244 9.456 1.842 1.842 5.729 2.816 9.457 3.244 4.352.499 8.845.453 8.845.453s4.493.046 8.846-.453c3.727-.428 7.614-1.402 9.456-3.244 1.842-1.842 2.816-5.729 3.244-9.456.499-4.353.453-8.846.453-8.846s.046-4.493-.453-8.845c-.428-3.728-1.402-7.615-3.244-9.457C38.46 1.856 34.573.882 30.846.454 26.493-.045 22 .001 22 .001s-4.493-.046-8.845.453C9.427.882 5.54 1.856 3.698 3.698 1.856 5.54.882 9.427.454 13.155-.045 17.507.001 22 .001 22"></path>
					</svg>
					<img alt="베스트" src="${contextPath}/resources/images/quickmenu/icon-best.png" class="quick-menu-image">
					<span class="quick-menu-label">베스트</span>
				</a>
			</li>
			<li class="quick-menu-list">
				<a href="${contextPath}/book/bookList.do?type=steady">
					<svg viewBox="0 0 44 44" style="fill:#898d94;" class="quick-menu-shape">
						<path d="M.001 22s-.046 4.493.453 8.846c.428 3.727 1.402 7.614 3.244 9.456 1.842 1.842 5.729 2.816 9.457 3.244 4.352.499 8.845.453 8.845.453s4.493.046 8.846-.453c3.727-.428 7.614-1.402 9.456-3.244 1.842-1.842 2.816-5.729 3.244-9.456.499-4.353.453-8.846.453-8.846s.046-4.493-.453-8.845c-.428-3.728-1.402-7.615-3.244-9.457C38.46 1.856 34.573.882 30.846.454 26.493-.045 22 .001 22 .001s-4.493-.046-8.845.453C9.427.882 5.54 1.856 3.698 3.698 1.856 5.54.882 9.427.454 13.155-.045 17.507.001 22 .001 22"></path>
					</svg>
					<img alt="화제의 책" src="${contextPath}/resources/images/quickmenu/icon-steady.png" class="quick-menu-image">
					<span class="quick-menu-label">화제의 책</span>
				</a>
			</li>
			
			</ul>
		</div>
	</div>
			
			
	<div class="row" style="background: #F3F3F9;">
		<div style="width: 1005px; margin: 30px auto 0px; position: relative;">
		<h2 class="section-title">이번 달 신간</h2>
           <div class="owl-carousel owl-theme">
           		<c:forEach items="${mainBooksMap.newBooksList}" var="newList">
				    <div class="item">
				    	<img src="${contextPath}/resources/bookFileRepo/${newList.bookNo}/${newList.changeFileName}" alt="${newList.title}">
			    		<div class="book-info">
			                <p class="book-title"><a href="${contextPath}/book/detailBookView.do?bookNo=${newList.bookNo}">${newList.title}</a></p>
			                <p class="book-publish">
			                	<span class="book-auth">${newList.writer} 저</span>
						        <em class="divi">|</em>
						        <span class="book-pub">${newList.publisher}</span>
					        </p>
			                <p class="book-price">
			                	<fmt:formatNumber value="${newList.salesPrice}" type="number" var="newSalesPrice" />
			                    <em class="bp-price">${newSalesPrice}</em>원
			                </p>
		              	</div>
				    </div>
			    </c:forEach>
			</div>
		</div>
    </div>
            
    <div class="row">
      	<div class="bestseller-area">
       		<h2 class="section-title">베스트 셀러</h2>
       		<div>
    			<ul>
    				<c:forEach items="${mainBooksMap.bestBooksList}" var="bestList">
	    				<li class="bestseller-list">
							<a href="${contextPath}/resources/bookFileRepo/${bestList.bookNo}/${bestList.changeFileName}">
								<img src="${contextPath}/resources/bookFileRepo/${bestList.bookNo}/${bestList.changeFileName}" alt="${bestList.title}" width="50">
							</a>
							<div class="bestseller-content">
								<h3>${bestList.rownum}</h3>
								<div class="bestseller">
									<a href="${contextPath}/resources/bookFileRepo/${bestList.bookNo}/${bestList.changeFileName}">
	  									<div class="book-info">
						                	<p class="book-title">${bestList.title}</p>
						                	<p class="book-publish">
						                		<span class="book-auth">${bestList.writer} 저</span><em class="divi">|</em><span class="book-pub">${bestList.publisher}</span>
								        	</p>
						                	<p class="book-price">
						                		<fmt:formatNumber value="${bestList.salesPrice}" type="number" var="bestSalesPrice" />
						                		<em class="bp-price">${bestSalesPrice}</em>원
						                	</p>
					              		</div>
	  								</a>
								</div>
							</div>
						</li>
					</c:forEach>
    			</ul>
    		</div>
    	</div>
    </div>
            
    <div class="row">
		<div style="width: 1005px; margin: 30px auto 0px; position: relative;">
			<h2 class="section-title">화제의 책</h2>
           	<div class="owl-carousel owl-theme">
    			<c:forEach items="${mainBooksMap.steadyBooksList}" var="steadyList">
				    <div class="item">
				    	<img src="${contextPath}/resources/bookFileRepo/${steadyList.bookNo}/${steadyList.changeFileName}" alt="${steadyList.title}">
			    		<div class="book-info">
			                <p class="book-title"><a href="${contextPath}/book/detailBookView.do?bookNo=${steadyList.bookNo}">${steadyList.title}</a></p>
			                <p class="book-publish">
			                	<span class="book-auth">${steadyList.writer} 저</span>
						        <em class="divi">|</em>
						        <span class="book-pub">${steadyList.publisher}</span>
					        </p>
			                <p class="book-price">
			                	<fmt:formatNumber value="${steadyList.salesPrice}" type="number" var="steadySalesPrice" />
			                    <em class="bp-price">${steadySalesPrice}</em>원
			                </p>
		              	</div>
				    </div>
			    </c:forEach>
			</div>
		</div>
   </div>
       
</div>