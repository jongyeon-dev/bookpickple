<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">

<link href="${contextPath}/resources/plugins/highlightjs/styles/darkula.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/common/custom.css" rel="stylesheet" type="text/css">

<script src="${contextPath}/resources/js/common/common.min.js"></script>

<title><tiles:insertAttribute name="title" ignore="true"/></title>

</head>
<body class="h-100" style="background: #F3F3F9;">
	<div class="login-form-bg h-100">
		<tiles:insertAttribute name="body" ignore="true" />	 	
    </div>
  	
</body>      
