<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<div class="footer">
   <a href="${contextPath}/">
       <img src="${contextPath}/resources/images/common/logo-purple.png" alt="BookPickple" width="130" height="29">
   </a>
  <div class="copyright">
    <p>
      서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F
    </p>
    <p>
      Copyright &copy; Designed & Developed by <a href="${contextPath}/">BookPickple</a>
    </p>
  </div>
</div>