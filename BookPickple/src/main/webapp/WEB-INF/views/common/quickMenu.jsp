<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<body>    
    <div id="sticky" >
	<div class="recent">
		<h3>최근 본 도서</h3>
		  <ul>
		 <c:choose>
			<c:when test="${ empty quickBooksList }">
		     	<p>최근 본 도서가 없습니다.</p>
			</c:when>
			<c:otherwise>
			<form name="quickMenuForm">	     
		      <c:forEach var="book" items="${quickBooksList}" varStatus="bookNum">
		         <c:choose>
			           <c:when test="${bookNum.count==1 }">
					      <a href="${contextPath}/book/detailBookView.do?bookNo=${book.bookNo}" id="bookLink">
					  	         <img width="75" height="95" id="quickBookImage"  
					                 src="${contextPath}/resources/bookFileRepo/${book.bookNo}/${book.changeFileName}">
					      </a>
					        <input type="hidden"  name="bookNo" id="bookNo" value="${book.bookNo}" />
					        <input type="hidden" name="bookFileName" id="bookFileName" value="${book.changeFileName}" />
					      <br>
				      </c:when>
				      <c:otherwise>
				        <input type="hidden"  name="bookNo" value="${book.bookNo}" />
				        <input type="hidden" name="bookFileName" value="${book.changeFileName}" />
				      </c:otherwise>
			      </c:choose>
		     </c:forEach>
		   </c:otherwise>
	      </c:choose>
		 </ul>
		 </form>
	    <c:if test="${ not empty quickBooksList }">
		    <p>
	           	<button onclick="preBook()"><i class="icon-arrow-left"></i></button> &nbsp; 
	          	<span id="currentBook">1</span> / ${quickBooksListNum}  &nbsp; 
	           	<button class="" onclick="nextBook()"><i class="icon-arrow-right"></i></button>
           </p>
	    </c:if>	 
	</div>
</div>

<script>
	var index = 0;
	
	function nextBook(){
		var bookLink = document.getElementById("bookLink");
		var bookImage = document.getElementById("quickBookImage");
		var currentBook = document.getElementById("currentBook");
		var bookNo = document.quickMenuForm.bookNo;
		var bookFileName = document.quickMenuForm.bookFileName;
		
		if(index == bookNo.length -1) {
			index = -1;
		}
		
		if(index < bookNo.length - 1) {
			index++;
		}	

		var nextBookNo = bookNo[index].value;
		var nextFileName = bookFileName[index].value;

		bookLink.setAttribute("href", "${contextPath}/book/detailBookView.do?bookNo=" + nextBookNo);
		bookImage.src = "${contextPath}/resources/bookFileRepo/" + nextBookNo + "/" + nextFileName;

		currentBook.innerHTML = index+1;
	}


 function preBook(){
	 	var bookLink = document.getElementById("bookLink");
	 	var bookImage = document.getElementById("quickBookImage");
		var currentBook = document.getElementById("currentBook");
		var bookNo = document.quickMenuForm.bookNo;
		var bookFileName = document.quickMenuForm.bookFileName;

		if(index == 0) {
			index = bookNo.length;
		}
		
		if(index > 0) {
			index--;
		}	

		var preBookNo = bookNo[index].value;
		var preFileName = bookFileName[index].value;
		
		bookLink.setAttribute("href", "${contextPath}/book/detailBookView.do?bookNo=" + preBookNo);
		bookImage.src = "${contextPath}/resources/bookFileRepo/" + preBookNo + "/" + preFileName;

		currentBook.innerHTML = index+1;

}

</script>  
</body>
</html>
 
