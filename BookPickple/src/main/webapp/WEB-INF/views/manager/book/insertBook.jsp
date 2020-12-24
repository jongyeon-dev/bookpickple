<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<head>


</head>


<body>

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="page-titles">
		    <div class="col">
		        <ol class="breadcrumb">
		        	<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)">도서 목록 조회</a></li>
		            <li class="breadcrumb-item"><a href="javascript:void(0)" class="text-primary">도서 추가</a></li>
		        </ol>
		    </div>
		</div>
    	
    	<div class="col-xl-12">
            <div class="form-input-content">
                <div class="card mb-0">
                    <div class="card-body pt-2 pb-2">
                        <form class="mt-3 mb-3" name="insertBookForm" id="insertBookForm"
                        method="post" enctype="multipart/form-data"
                        action="${contextPath}/manager/insertBookEnd.do">
                            <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="bookType">도서 분류</label>
	                             <div class="col-sm-5">
	                                  <select class="form-control" name="bookType" id="bookType">
                                           <option value="1" selected>IT</option>
                                           <option value="2">소설</option>
                                           <option value="3">경제</option>
                                           <option value="4">사회</option>
                                           <option value="5">취미</option>
                                       </select>
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="title">도서명</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="title" id="title">
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="writer">저자</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="writer" id="writer">
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="publisher">출판사</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="publisher" id="publisher">
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="price">정가</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="price" id="price">
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="salesPrice">판매가</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="salesPrice" id="salePrice">
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="point">포인트</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="point" id="point">
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="publishedDate">출판일</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="publishedDate" id="publishedDate" placeholder="ex)20200101">
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="isbn">ISBN</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="isbn" id="isbn">
	                             </div>
                             </div>
                             <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="deliveryPrice">배송비</label>
	                             <div class="col-sm-5">
	                                  <input type="text" class="form-control" name="deliveryPrice" id="deliveryPrice">
	                             </div>
                             </div>

							<div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="bookIntro">도서 소개</label>
	                             <div class="col-sm-7">
	                                  <textarea class="form-control h-150px" rows="6" name="bookIntro" id="bookInfo" style="resize: none;"></textarea>
	                             </div>
                            </div>
                            <div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="writerIntro">저자 소개</label>
	                             <div class="col-sm-7">
	                                  <textarea class="form-control h-150px" rows="6" name="writerIntro" id="writerIntro" style="resize: none;"></textarea>
	                             </div>
                            </div>

							<div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="titleImg">대표 이미지</label>
	                             <div class="col-sm-5 input-group mb-3">
                                     <div class="custom-file">
                                         <input type="file" class="custom-file-input" name="uploadFile" id="titleImg" accept="image/*">
                                         <label class="custom-file-label">첨부 파일 등록</label>
                                     </div>
                                 </div>
                            </div>
                            <div class="form-group row">
                            	<label class="col-sm-3 col-form-label" for="detailImg">상세 이미지</label>
	                             <div class="col-sm-5 input-group mb-3">
                                     <div class="custom-file">
                                         <input type="file" class="custom-file-input" name="uploadFile" id="detailImg" accept="image/*">
                                         <label class="custom-file-label">첨부 파일 등록</label>
                                     </div>
                                 </div>
                            </div>
                            <div class="form-group row">
                             	<label class="col-sm-3 col-form-label" for="status">상태</label>
	                             <div class="col-sm-5">
	                                  <select class="form-control" name="status" id="bookStatus">
                                           <option value="ONSALE" selected>판매중</option>
                                           <option value="SOLDOUT">품절</option>
                                           <option value="OUTOFPRINT">절판</option>
                                       </select>
	                             </div>
                             </div>
                            <div class="mt-5 text-center">
			                  	<button type="submit" class="btn btn-primary">도서 추가 하기</button>
			                  	<button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back()">취소</button>
			              	</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/jquery-validation/jquery.validate.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/jquery-validation/additional-methods.min.js"></script>
<script src="${contextPath}/resources/plugins/validation/jquery-validation/messages_ko.min.js"></script>
<script>
  $(function($) {

	    $.validator.addMethod("regex", function(value, element, regexp){
		    var re = new RegExp(regexp);
		    var res = re.test(value);
		    return res;
		});
  
    $("#insertBookForm").validate({
    	submitHandler: function() {
            var f = confirm("도서 추가를 하시겠습니까?");
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
            regex: "^(20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$"
        },
        isbn: {
            required: true
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
    
  });
</script>

</body>