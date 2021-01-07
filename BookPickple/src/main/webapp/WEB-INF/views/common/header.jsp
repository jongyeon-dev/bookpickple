<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

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
                	<form name="searchForm" action="${contextPath}/book/searchBookList.do" style="display: inline-flex; align-items: center;">
						<input type="text" name="keyword" id="keyword" class="form-control" placeholder="도서명 검색" onkeyup="searchKeyword()" autocomplete="off">
						<button type="submit" name="search" class="btn mb-1 btn-flat btn-outline-primary ml-3 btn-sm">검색</button>
					</form>
                </div>
                <div id="quickSearch">
                	<div class="result">
				        <table class="searchTable">
				        	<tbody id="searchTbody">
				        	</tbody>
				        </table>
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
	                        <li><a href="${contextPath}/book/bookList.do?type=IT">IT</a></li>
	                        <li><a href="${contextPath}/book/bookList.do?type=NOVEL">소설</a></li>
	                        <li><a href="${contextPath}/book/bookList.do?type=ECONOMY">경제</a></li>
	                        <li><a href="${contextPath}/book/bookList.do?type=SOCIETY">사회</a></li>
	                        <li><a href="${contextPath}/book/bookList.do?type=HOBBY">취미</a></li>
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
	                        <li><a href="${contextPath}/book/bookList.do?type=IT">IT</a></li>
	                        <li><a href="${contextPath}/book/bookList.do?type=NOVEL">소설</a></li>
	                        <li><a href="${contextPath}/book/bookList.do?type=ECONOMY">경제</a></li>
	                        <li><a href="${contextPath}/book/bookList.do?type=SOCIETY">사회</a></li>
	                        <li><a href="${contextPath}/book/bookList.do?type=HOBBY">취미</a></li>
	                    </ul>
	                </li>
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
	                 <li>
	                    <a class="has-arrow" href="${contextPath}/member/memberProfileView.do?userNo=${member.userNo}" aria-expanded="false">
	                        <i class="icon-user menu-icon"></i><span class="nav-text">마이 페이지</span>
	                    </a>
	                </li>
                </c:if>
            </ul>
        </div>
      </div>
           
<script>
$(function(){
	$("#quickSearch").css("display", "none");
});
var continueSearch = true;

function searchKeyword() {

	if (window.event.keyCode == 13) {
    	$("#searchForm").submit();
    }
    
	if(continueSearch == false) return;
	
	var keyword = $("#keyword").val();
	if(keyword == "" || keyword == null) {
		$("#quickSearch").css("display", "none");
	} else {
		$.ajax({
			type : "get",
			async : true,
			url : "${contextPath}/book/ajaxKeywordSearch.do",
			data : {keyword: keyword},
			success : function(data, textStatus) {
			    var keywordInfo = JSON.parse(data);
				displayResult(keywordInfo);
			},
			error: function(jqxhr, textStatus, errorThrown){
                console.log("도서 검색 처리 실패");
                //에러 로그
                console.log(jqxhr);
                console.log(textStatus);
                console.log(errorThrown);
            }
		}); 
	}
}

function displayResult(keywordInfo){
	var count = keywordInfo.keyword.length;
	if(count > 0) {
	    var html = '';
	    for(var i in keywordInfo.keyword){
	    	html += "<tr><td class='pb-1' style='width: 50px;'>";
	    	html += "<a href=\"${contextPath}/book/detailBookView.do?bookNo="+keywordInfo.keyword[i].bookNo+"\">";
	    	html += "<img src=\"${contextPath}/resources/bookFileRepo/"+keywordInfo.keyword[i].bookNo+"/"+keywordInfo.keyword[i].changeFileName+"\" width='40px' class='pr-1'></a></td>";
	    	html += "<td class='pb-2'><a href=\"${contextPath}/book/detailBookView.do?bookNo="+keywordInfo.keyword[i].bookNo+"\" class='font-weight-bold'>"+keywordInfo.keyword[i].title+"</a>";
	    	html += "<p class='mb-0'>"+keywordInfo.keyword[i].writer+" 저 | " + keywordInfo.keyword[i].publisher +"</p>";
	    	html += "<span>"+keywordInfo.keyword[i].salesPrice+"원</span>";
		    html += "</td></tr>";
	    }
	   var listView = document.getElementById("searchTbody");
	    listView.innerHTML = html;
	    $("#quickSearch").css("display", "block");
	}
}
	
</script>