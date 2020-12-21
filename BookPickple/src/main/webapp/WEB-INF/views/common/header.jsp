<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
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
                	<li class="icons">	
                        <p class="member-name"><span class="text-primary">홍길동</span> 님</p>
                    </li>
                    <li class="icons">	
                        <button type="button" class="btn mb-1 btn-primary btn-flat btn-sm"
                        onclick="location.href='${pageContext.request.contextPath}/member/memberLogin.do'">로그인</button>
                    </li>
                    <li class="icons">    
                        <button type="button" class="btn mb-1 btn-outline-primary btn-flat btn-sm"
                        onclick="location.href='${pageContext.request.contextPath}/member/memberJoin.do'">회원가입</button>
                    </li>
                    <li class="icons">    
                        <button type="button" class="btn mb-1 btn-outline-primary btn-flat btn-sm"
                        onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="nk-sidebar">           
        <div class="nk-nav-scroll">
            <ul class="metismenu" id="menu">
                <li>
                    <a href="${contextPath}/">
                        <i class="icon-home menu-icon"></i><span class="nav-text">Home</span>
                    </a>
                </li>
                <li class="mega-menu mega-menu-sm">
                    <a href="#">
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
                        <li><a href="#">주문내역</a></li>
                        <li><a href="#">프로필</a></li>
                        <li><a href="#">1:1 문의 내역</a></li>
                    </ul>
                </li>
            </ul>
        </div>
      </div>
           
</body>
</html>