<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%
	pageContext.setAttribute("crcn", "\r\n");
	pageContext.setAttribute("br", "<br>");
%>
<body>

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="page-titles">
		    <div class="col">
		        <ol class="breadcrumb">
		        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">도서 목록 조회</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">도서 상세 조회</a></li>
		        </ol>
		    </div>
		</div>
    	
    <div class="col-xl-12">
            <div class="form-input-content">
                <div class="card mb-0">
                    <div class="card-body pt-2 pb-5 pt-5 pl-5 wrap-detailBook">
                            <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">도서 분류</label>
	                             <div class="col-sm-7">
	                             	<c:if test="${book.type == 'IT'}"><p class="mb-0">IT</p></c:if>
	                             	<c:if test="${book.type == 'NOVEL'}"><p class="mb-0">소설</p></c:if>
	                             	<c:if test="${book.type == 'ECONOMY'}"><p class="mb-0">경제</p></c:if>
	                             	<c:if test="${book.type == 'SOCIETY'}"><p class="mb-0">사회</p></c:if>
	                             	<c:if test="${book.type == 'HOBBY'}"><p class="mb-0">취미</p></c:if>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">도서명</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0">${ book.title }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold"">저자</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0">${ book.writer }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-labe text-primary font-weight-bold">출판사</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0">${ book.publisher }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">출판일</label>
	                             <div class="col-sm-7">
	                             	<input type="hidden" name="dbPublishedDate" id="dbPublishedDate" value="${ book.publishedDate }" />
	                             	<p class="mb-0 publishedDate"></p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">정가</label>
	                             <div class="col-sm-7">
	                            	 <p class="mb-0" id="publishedDate">${ book.price }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">판매가</label>
	                              <div class="col-sm-7">
	                              	<p class="mb-0" id="publishedDate">${ book.salesPrice }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">포인트</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0" id="publishedDate">${ book.point }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">ISBN</label>
	                             <div class="col-sm-5">
	                             	<p class="mb-0" id="publishedDate">${ book.isbn }</p>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">배송비</label>
	                             <div class="col-sm-7">
	                             	<p class="mb-0" id="publishedDate">${ book.deliveryPrice }</p>
	                             </div>
                             </div>

							<div class="form-group row">
                            	<label class="col-sm-3 col-form-label text-primary font-weight-bold">도서 소개</label>
	                             <div class="col-sm-7">
	                             	<p>${fn:replace(book.bookIntro,crcn,br)}</p>
	                             </div>
                            </div>
                            <div class="form-group row">
                            	<label class="col-sm-3 col-form-label text-primary font-weight-bold">저자 소개</label>
	                             <div class="col-sm-7">
	                             	<p>${fn:replace(book.writerIntro,crcn,br)}</p>
	                             </div>
                            </div>

							<div class="form-group row">
                            	<label class="col-sm-3 col-form-label text-primary font-weight-bold">대표 이미지</label>
	                             <div class="col-sm-7 input-group mb-3">
                                     <div class="custom-file">
                                     	<input class="upload-title-name form-control" disabled="disabled" value="${ bookImages[0].originFileName }"/>
                                         
                                     </div>
                                 </div>
                            </div>
                            <div class="form-group row">
                            	<label class="col-sm-3 col-form-label text-primary font-weight-bold">상세 이미지</label>
	                             <div class="col-sm-7 input-group mb-3">
                                     <div class="custom-file">
                                     	<input class="upload-detail-name form-control" disabled="disabled" value="${ bookImages[1].originFileName }"/>
                                     </div>
                                 </div>
                            </div>
                            <div class="form-group row">
                             	<label class="col-sm-3 col-form-label text-primary font-weight-bold">상태</label>
	                             <div class="col-sm-7">
	                             	<c:if test="${book.status == 'ONSALE'}"><p class="mb-0">판매중</p></c:if>
								  	<c:if test="${book.status == 'SOLDOUT'}"><p class="mb-0">품절</p></c:if>
								  	<c:if test="${book.status == 'OUTOFPRINT'}"><p class="mb-0">절판</p></c:if>
	                             </div>
                             </div>
                            <div class="mt-5 text-center">
			                  	<button type="submit" class="btn btn-primary"  onclick="location.href='${contextPath}/manager/bookUpdateView.do?bookNo=${book.bookNo}'">수정하기</button>
			                  	<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#deleteBookModal">삭제하기</button>
			              	</div>
			              <!-- Modal -->
		                    <div class="modal fade" id="deleteBookModal">
		                      <div class="modal-dialog modal-dialog-centered" role="document">
		                        <div class="modal-content">
		                          <div class="modal-header">
		                            <h5 class="modal-title">도서 삭제</h5>
		                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
		                          </div>
		                          <div class="modal-body">
		                            <p>
		                              <em class="text-primary font-weight-bold">${ book.title }</em> 도서를 정말로 삭제 하시겠습니까?
		                            </p>
		                          </div>
		                          <div class="modal-footer">
		                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                            <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/manager/deleteBookEnd.do?bookNo=${book.bookNo}'">확인</button>
		                          </div>
		                        </div>
		                      </div>
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
	var finalPubDate = splitDate[0] + "/" +splitDate[1] + "/" + splitDate[2];
	$(".publishedDate").text(finalPubDate);
</script>

</body>