<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />


<body>
	
    <div class="nav-header">
        <div class="brand-logo">
            <a href="${contextPath}/">
                <span class="logo-compact"><img src="${contextPath}/resources/images/common/logo-white.png" alt="BookPickple" width="170" height="36"></span>
            </a>
        </div>
    </div>
    <div class="header">    
        <div class="header-content clearfix">
            
            <div class="nav-control">
                <div class="hamburger">
                    <span class="toggle-icon"><i class="icon-menu"></i></span>
                </div>
            </div>
            <div class="header-left">
                <div class="input-group icons">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                    </div>
                    <input type="search" class="form-control" placeholder="Search" aria-label="Search">
                    <div class="drop-down   d-md-none">
						<form action="#">
							<input type="text" class="form-control" placeholder="Search">
						</form>
                    </div>
                </div>
            </div>
            <div class="header-right">
                <ul class="clearfix">
                	<c:choose>
                		<c:when test="${isLogin == true and not empty member and member.type == 'MEMBER'}">
                			<li class="icons">	
	                        	<p class="member-name"><span class="text-primary">${ member.userName }</span> 님</p>
	                    	</li>
		                    <li class="icons">    
		                        <button type="button" class="btn mb-1 btn-primary btn-flat btn-sm"
		                        onclick="location.href='${contextPath}/member/memberLogout.do'">로그아웃</button>
		                    </li>
                		</c:when>
                		<c:when test="${isLogin == true and not empty member and member.type == 'MANAGER'}">
	                		<li class="icons">	
	                        	<p class="member-name"><span class="text-primary">${ member.userName }</span> 님</p>
	                    	</li>
	                    	<li class="icons">    
		                        <button type="button" class="btn mb-1 btn-secondary btn-flat btn-sm"
		                        onclick="location.href='${contextPath}/manager/managerMain.do'">관리자 페이지</button>
		                    </li>
		                    <li class="icons">    
		                        <button type="button" class="btn mb-1 btn-outline-primary btn-flat btn-sm"
		                        onclick="location.href='${contextPath}/member/memberLogout.do'">로그아웃</button>
		                    </li>
                		</c:when>
                		<c:otherwise>
	                		<li class="icons">	
		                        <button type="button" class="btn mb-1 btn-primary btn-flat btn-sm"
		                        onclick="location.href='${contextPath}/member/memberLoginView.do'">로그인</button>
		                    </li>
		                    <li class="icons">    
		                        <button type="button" class="btn mb-1 btn-outline-secondary btn-flat btn-sm"
		                        onclick="location.href='${contextPath}/member/memberJoinView.do'">회원가입</button>
		                    </li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
        </div>
    </div>
    <div class="nk-sidebar">           
        <div class="nk-nav-scroll">
            <ul class="metismenu" id="menu">
            	<c:if test="${ isLogin != true or empty member or member.type == 'MEMBER'}">
            		<li>
	                    <a href="${contextPath}/">
	                        <i class="icon-home menu-icon"></i><span class="nav-text">Home</span>
	                    </a>
	                </li>
	                <li>
	                    <a class="has-arrow" href="#" aria-expanded="false">
	                        <i class="icon-book-open menu-icon"></i><span class="nav-text">도서</span>
	                    </a>
	                    <ul aria-expanded="false">
	                        <li><a href="${contextPath}/book/selectBookList.do?type=IT">IT</a></li>
	                        <li><a href="${contextPath}/book/selectBookList.do?type=NOVEL">소설</a></li>
	                        <li><a href="${contextPath}/book/selectBookList.do?type=ECONOMY">경제</a></li>
	                        <li><a href="${contextPath}/book/selectBookList.do?type=SOCIETY">사회</a></li>
	                        <li><a href="${contextPath}/book/selectBookList.do?type=HOBBY">취미</a></li>
	                    </ul>
	                </li>
	                <li class="mega-menu mega-menu-sm">
	                    <a href="${contextPath}/cart/cartList.do?userNo=${member.userNo}">
	                        <i class="icon-basket-loaded menu-icon"></i><span class="nav-text">내 Cart</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                         <i class="icon-note menu-icon"></i><span class="nav-text">1:1 문의하기</span>
	                    </a>
	                </li>
	                <li>
	                    <a class="has-arrow" href="#" aria-expanded="false">
	                        <i class="icon-user menu-icon"></i><span class="nav-text">마이 페이지</span>
	                    </a>
	                    <ul aria-expanded="false">
	                        <li><a href="${contextPath}/order/orderListView.do?userNo=${member.userNo}">주문내역</a></li>
	                        <li><a href="${contextPath}/member/memberProfileView.do?userNo=${member.userNo}">프로필</a></li>
	                        <li><a href="${contextPath}/inquiry/inquiryListView.do?userNo=${member.userNo}">1:1 문의 내역</a></li>
	                    </ul>
	                </li>
            	</c:if>
               <c:if test="${isLogin == true and not empty member and member.type == 'MANAGER'}">
               		<a href="${contextPath}/">
                        <i class="icon-home menu-icon"></i><span class="nav-text">Home</span>
                    </a>
                	<li class="mega-menu mega-menu-sm">
	                    <a href="${contextPath}/manager/memberListView.do">
	                        <i class="icon-people menu-icon"></i><span class="nav-text">회원 관리</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="${contextPath}/manager/bookListView.do">
	                         <i class="icon-book-open menu-icon"></i><span class="nav-text">도서 관리</span>
	                    </a>
	                </li>
	                <li>
	                    <a class="has-arrow" href="${contextPath}/manager/deliveryListView.do" aria-expanded="false">
	                        <i class="icon-drawer menu-icon"></i><span class="nav-text">배송 관리</span>
	                    </a>
	                </li>
	                <li>
	                    <a class="has-arrow" href="#" aria-expanded="false">
	                        <i class="icon-note menu-icon"></i><span class="nav-text">1:1 문의 관리</span>
	                    </a>
	                </li>
	                <li>
	                    <a class="has-arrow" href="#" aria-expanded="false">
	                        <i class="icon-envelope-letter menu-icon"></i><span class="nav-text">EDM 전송</span>
	                    </a>
	                </li>
                </c:if>
            </ul>
        </div>
      </div>
           
</body>
</html>