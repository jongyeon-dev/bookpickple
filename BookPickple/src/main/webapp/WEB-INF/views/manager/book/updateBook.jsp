<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<body>

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="page-titles">
		    <div class="col">
		        <ol class="breadcrumb">
		        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">도서 목록 조회</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">도서 수정</a></li>
		        </ol>
		    </div>
		</div>
    	
    <div class="col-xl-12">
            <div class="form-input-content">
                <div class="card mb-0">
                    <div class="card-body pt-2 pb-2">
                        <form class="mt-3 mb-3" name="updateBookForm" id="updateBookForm"
                        method="post" enctype="multipart/form-data"
                        action="${contextPath}/manager/bookUpdateEnd.do">
                        	<input type="hidden" name="bookNo" value="${ book.bookNo }"/>
                            <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="type">도서 분류</label>
	                             <div class="col-sm-5">
	                                  <select class="form-control" name="type" id="type">
                                           <option value="IT" ${ book.type == "IT" ? 'selected':'' }>IT</option>
                                           <option value="NOVEL" ${ book.type == "NOVEL" ? 'selected':'' }>소설</option>
                                           <option value="ECONOMY" ${ book.type == "ECONOMY" ? 'selected':'' }>경제</option>
                                           <option value="SOCIETY" ${ book.type == "SOCIETY" ? 'selected':'' }>사회</option>
                                           <option value="HOBBY" ${ book.type == "HOBBY" ? 'selected':'' }>취미</option>
                                       </select>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="title">도서명</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="title" id="title" value="${ book.title }" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="writer">저자</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="writer" id="writer" value="${ book.writer }" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="publisher">출판사</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="publisher" id="publisher" value="${ book.publisher }" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="publishedDate">출판일</label>
	                             <div class="col-sm-5">
	                             	<input type="hidden" name="dbPublishedDate" id="dbPublishedDate" value="${ book.publishedDate }" />
	                                  <input type="text" class="form-control" name="publishedDate" id="publishedDate" placeholder="ex)20200101" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="price">정가</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="price" id="price" value="${ book.price }" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="salesPrice">판매가</label>
	                              <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="salesPrice" id="salePrice" value="${ book.salesPrice }" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="point">포인트</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="point" id="point" placeholder="정가에서 5% 적립" value="${ book.point }" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="isbn">ISBN</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="isbn" id="isbn" value="${ book.isbn }" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="isbn">입고 수량</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="creStock" id="creStock" value="${ book.creStock }" autocomplete="off"/>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="deliveryPrice">배송비</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="deliveryPrice" id="deliveryPrice" placeholder="기본 2500원 / 1만원 이상 무료배송" value="${ book.deliveryPrice }" autocomplete="off"/>
	                             </div>
                             </div>

							<div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="bookIntro">도서 소개</label>
	                             <div class="col-sm-7">
	                                  <textarea class="form-control h-150px" rows="6" name="bookIntro" id="bookInfo" style="resize: none;">${ book.bookIntro }</textarea>
	                             </div>
                            </div>
                            <div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="writerIntro">저자 소개</label>
	                             <div class="col-sm-7">
	                                  <textarea class="form-control h-150px" rows="6" name="writerIntro" id="writerIntro" style="resize: none;">${ book.writerIntro }</textarea>
	                             </div>
                            </div>

							<div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="titleImg">대표 이미지</label>
	                             <div class="col-sm-7 input-group mb-3">
                                     <div class="custom-file">
                                     	<input class="upload-title-name form-control" disabled="disabled" value="${ bookImages[0].originFileName }"/>
                                         <input type="file" style="display:none;" class="custom-file-input title-file"
                                         name="uploadFile" id="titleImg" accept="image/*">
                                         <button type="button" class="btn ml-2 btn-flat btn-outline-primary btn-title-file">첨부파일 등록</button>
                                     </div>
                                 </div>
                            </div>
                            <div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="detailImg">상세 이미지</label>
	                             <div class="col-sm-7 input-group mb-3">
                                     <div class="custom-file">
                                     	<input class="upload-detail-name form-control" disabled="disabled" value="${ bookImages[1].originFileName }"/>
                                         <input type="file" style="display:none;"class="custom-file-input detail-file"
                                         name="uploadFile" id="detailImg" accept="image/*">
                                         <button type="button" class="btn ml-2 btn-flat btn-outline-primary btn-detail-file">첨부파일 등록</button>
                                     </div>
                                 </div>
                            </div>
                            <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="status">상태</label>
	                             <div class="col-sm-5">
	                                  <select class="form-control" name="status" id="bookStatus">
                                           <option value="ONSALE" ${ book.status == "ONSALE" ? 'selected':'' }>판매중</option>
                                           <option value="SOLDOUT" ${ book.status == "SOLDOUT" ? 'selected':'' }>품절</option>
                                           <option value="OUTOFPRINT" ${ book.status == "OUTOFPRINT" ? 'selected':'' }>절판</option>
                                       </select>
	                             </div>
                             </div>
                            <div class="mt-5 text-center">
			                  	<button type="submit" class="btn btn-primary">수정하기</button>
			                  	<button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back()">돌아가기</button>
			              	</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${contextPath}/resources/plugins/validation/jquery.validate.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/additional-methods.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/messages_ko.min.js"></script>
<script>
  $(function() {

	// 출판일 파싱
	var splitDate = $("#dbPublishedDate").val().split(" ")[0].split("-");
    var finalPubDate = splitDate[0] + splitDate[1] + splitDate[2]
	$("#publishedDate").val(finalPubDate);
	
    $.validator.addMethod("regex", function(value, element, regexp){
	    var re = new RegExp(regexp);
	    var res = re.test(value);
	    return res;
	});
  
    $("#updateBookForm").validate({
	   	submitHandler: function() {
	           var f = confirm("도서 수정을 하시겠습니까?");
	           if(f){
	               return true;
	           } else {
	               return false;
	           }
	       },
    	
      rules: {
        title: {
          required: true
        },
        writer: {
            required: true
        },
        publisher: {
            required: true
        },
        price: {
            required: true,
            digits: true
        },
        salesPrice: {
            required: true,
       		digits: true
        },
        point: {
            required: true,
            digits: true
        },
        publishedDate: {
            required: true,
            regex: "^(20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$"
        },
        isbn: {
            required: true
        },
        creStock: {
            required: true,
            digits: true
        },
        deliveryPrice: {
            required: true,
            digits: true
        },
        bookIntro: {
            required: true
        },
        writerIntro: {
            required: true
        },
        uploadFile: {
            required: true
        }
      },
      messages: {
    	  title: {
              required: "필수 입력 사항입니다."
         },
         writer: {
         	required: "필수 입력 사항입니다."
         },
         publisher: {
         	required: "필수 입력 사항입니다."
         },
         price: {
        	 required: "필수 입력 사항입니다.",
             digits: "숫자만 입력하세요."
         },
         salesPrice: {
        	 required: "필수 입력 사항입니다.",
             digits: "숫자만 입력하세요."
         },
         point: {
        	 required: "필수 입력 사항입니다.",
             digits: "숫자만 입력하세요."
         },
         publishedDate: {
        	 required: "필수 입력 사항입니다.",
        	 regex: "형식이 올바르지 않습니다."
         },
         isbn: {
        	 required: "필수 입력 사항입니다."
         },
         creStock: {
        	 required: "필수 입력 사항입니다.",
             digits: "숫자만 입력하세요."
         },
         deliveryPrice: {
        	 required: "필수 입력 사항입니다.",
             digits: "숫자만 입력하세요."
         },
         bookIntro: {
        	 required: "필수 입력 사항입니다."
         },
         writerIntro: {
        	 required: "필수 입력 사항입니다."
         },
         uploadFile: {
        	 required: "필수 입력 사항입니다."
         }
      }
    });


    $(".btn-title-file").click(function() {
			$("#titleImg").click();
		});

    $(".btn-detail-file").click(function() {
		$("#detailImg").click();
	});
		
	var titleFileTarget = $('.title-file');
	var detailFileTarget = $('.detail-file');
	
	titleFileTarget.on('change', function(e){
		// 대표 이미지 값이 변경되면 
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		} 
		
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-title-name').val(filename); 

	}); 

	detailFileTarget.on('change', function(e){
		// 대표 이미지 값이 변경되면 
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		} 
		
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-detail-name').val(filename); 

	}); 
  });
</script>

</body>