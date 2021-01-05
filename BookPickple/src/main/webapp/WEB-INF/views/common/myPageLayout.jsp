<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">

<link href="${contextPath}/resources/plugins/highlightjs/styles/darkula.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/common/custom.css" rel="stylesheet" type="text/css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<title><tiles:insertAttribute name="title" ignore="true"/></title>
</head>
<body>

	<div id="main-wrapper">
		<div class="main">
			<header>
			   <tiles:insertAttribute name="header" ignore="true" />
			</header>
			
			<section class="content-body" style="margin-top: 50px; background: #F3F3F9;">
			 	<div class="container-fluid">
					<div class="row" style="padding: 0 30px;">
						 <div class="col-lg-4 col-xl-3">
			                <div class="card">
			                    <div class="card-body">
			                    	<ul>
			                    		<li class="nav-label"><a href="${contextPath}/order/orderListView.do?userNo=${member.userNo}" id="orderPage">주문내역</a></li>
			                    		<li class="nav-label"><a href="${contextPath}/member/memberProfileView.do?userNo=${member.userNo}" id="profilePage">프로필</a></li>
			                    		<li class="nav-label"><a href="${contextPath}/inquiry/inquiryListView.do?userNo=${member.userNo}" id="inquiryPage">1:1 문의</a></li>
			                    	</ul>
			           			</div>
			                </div>  
			            </div>
			            
			            <tiles:insertAttribute name="body" ignore="true" />	 	
			            
					</div>
				</div>
		 	</section>
		 	
		 	<footer>
	      		<tiles:insertAttribute name="footer" ignore="true" />
	      	</footer>
	      	
		</div>
	</div>
	
	<script src="${contextPath}/resources/js/common/common.min.js"></script>
  	<script src="${contextPath}/resources/js/common/custom.min.js"></script>
  	<script src="${contextPath}/resources/js/common/settings.js"></script>
  	<script src="${contextPath}/resources/js/common/styleSwitcher.js"></script>
  	<script src="${contextPath}/resources/js/common/gleek.js"></script>
  	<script src="${contextPath}/resources/plugins/highlightjs/highlight.pack.min.js"></script>
  	<script>hljs.initHighlightingOnLoad();</script>
  	<script>
		$(function() {
			     
			"use strict"
	
	        new quixSettings({
	            version: "light", //2 options "light" and "dark"
	            layout: "horizontal", //2 options, "vertical" and "horizontal"
	            navheaderBg: "color_1", //have 10 options, "color_1" to "color_10"
	            headerBg: "color_1", //have 10 options, "color_1" to "color_10"
	            sidebarStyle: "vertical", //defines how sidebar should look like, options are: "full", "compact", "mini" and "overlay". If layout is "horizontal", sidebarStyle won't take "overlay" argument anymore, this will turn into "full" automatically!
	            sidebarBg: "color_1", //have 10 options, "color_1" to "color_10"
	            sidebarPosition: "fixed", //have two options, "static" and "fixed"
	            headerPosition: "fixed", //have two options, "static" and "fixed"
	            containerLayout: "boxed",  //"boxed" and  "wide". If layout "vertical" and containerLayout "boxed", sidebarStyle will automatically turn into "overlay".
	            direction: "ltr" //"ltr" = Left to Right; "rtl" = Right to Left
	        });

			var url = location.href;
			
			if (url.indexOf("order") > -1 || url.indexOf("review") > -1) {
			     $("#orderPage").addClass("text-primary font-weight-bold");
			} else if (url.indexOf("member") > -1 ) {
			     $("#profilePage").addClass("text-primary font-weight-bold");
			} else if (url.indexOf("inquiry") > -1 ) {
			     $("#inquiryPage").addClass("text-primary font-weight-bold");
			}
			
		});
   	</script>


</body>
</html>