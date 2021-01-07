package com.kh.bookpickple.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookpickple.common.util.Pagination;
import com.kh.bookpickple.goods.model.service.GoodsService;
import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;
import com.kh.bookpickple.order.model.service.OrderService;
import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.service.ReviewService;
import com.kh.bookpickple.review.model.vo.Review;

import net.sf.json.JSONObject;

@Controller
public class GoodsController {
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/book/bookList.do")
	public String selectBookList(@RequestParam String type, @RequestParam( value="cPage", required=false, defaultValue="1") 
									int cPage, Model model) {
		// 한 페이지당 게시글
		int numPerPage = 5;
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = goodsService.selectBookList(cPage, numPerPage, type);
		
		// 2. 전페 게시글 수 (페이징 처리)
		int totalContents = goodsService.selectBookTotalContents(type);
		
		// 3. 페이지 계산된 html 구하기
		String pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, "bookList.do?type=" + type);
		
		// 4. 도서 각각의 리뷰 개수, 평점, 판매량
		List<Book> bookList = new ArrayList<Book>();
		
		for(int i = 0; i < list.size(); i++) {
			bookList.add((Book) list.get(i)); // List<Map> 형식을 List로 변경 (bookNo와 type을 찾기 위해)
		}

		List<Object> eachReviewList = new ArrayList<Object>(); // 빈 리스트 생성
		Map<String, Double> reviewMap = new HashMap<>(); // 리뷰용 빈 맵 생성
		List<Integer> eachSalesCount = new ArrayList<>(); // 판매지수용 빈 리스트 생성
		
		for(int j = 0; j < bookList.size(); j ++) {
			Review review = new Review();
			review.setBookNo(bookList.get(j).getBookNo());
			// bookList 크기만큼 반복하며 review객체를 사용하여 조회한 avg와 count를 Map 형태로 가져온다.
			reviewMap = reviewService.eachBookReview(review); // 출력 형식 : {avg=4.3, count=3.0}
			eachReviewList.add(reviewMap); // 조회한 모든 Map을 다시 List에 넣는다.
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBookNo(bookList.get(j).getBookNo());
			int salesCount = orderService.eachBookSalesCount(orderDetail);
			eachSalesCount.add(salesCount);
			
		}
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("eachReviewList", eachReviewList); // 출력 형식 : [{avg=4.3, count=3.0}, {avg=0.0, count=0.0}]
		model.addAttribute("eachSalesCount", eachSalesCount); // 출력 형식 : [4, 0, 1, 1, 2]
		
		return "book/bookList";
	}
	
	@RequestMapping("/book/detailBookView.do")
	public String selectOneBook(@RequestParam int bookNo, @RequestParam( value="cPage", required=false, defaultValue="1") 
								int cPage, Model model, HttpServletRequest request) {
		
		Book book = goodsService.selectOneBook(bookNo);
		List<BookImages> bookImages = goodsService.selectOneBookImagesList(bookNo);
		
		// 해당 도서의 리뷰 리스트 조회
		int numPerPage = 5;
		List<Review> reviewList = reviewService.selectOneBookReivewList(cPage, numPerPage, bookNo);
		int totalReviewContents = reviewService.totalReviewContents(bookNo);
		String pageBar = Pagination.getPageBar(totalReviewContents, cPage, numPerPage, "detailBookView.do?bookNo=" + bookNo);
		
		// 해당 도서의 평균 평점 조회
		double oneBookAvgRating = reviewService.oneBookAvgRating(bookNo);
		// 해당 도서의 리뷰 개수 조회
		int oneBookReviewCount = reviewService.oneBookReviewCount(bookNo);
		// 해당 도서의 판매량 조회
		int oneBookSalesCount = orderService.oneBookSalesCount(bookNo);

		model.addAttribute("book", book);
		model.addAttribute("bookImages", bookImages);
		model.addAttribute("avgRating", oneBookAvgRating);
		model.addAttribute("reviewCount", oneBookReviewCount);
		model.addAttribute("salesCount", oneBookSalesCount);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("totalContents", totalReviewContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		// 최근 본 상품 목록 세션에 저장
		HttpSession session=request.getSession();
		Book quickBook = goodsService.selectQuickBook(bookNo);
		addQuickList(bookNo, quickBook, session);
		
		return "book/bookDetails";
	}
	
	@RequestMapping(value = "/book/ajaxKeywordSearch.do", produces = "application/text; charset=UTF-8") // keyword 한글 인코딩
	@ResponseBody
	public String ajaxKeywordSearch(@RequestParam String keyword) {
		if(keyword.equals("") || keyword == null) return null;
		keyword = keyword.toUpperCase();
		List<String> ajaxKeywordSearch = goodsService.selectAjaxKeywordSeach(keyword);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", ajaxKeywordSearch);
		
		String keywordInfo = jsonObject.toString(); // json -> 문자열
		return keywordInfo;
	}
	
	@RequestMapping("/book/searchBookList.do")
	public String searchBookList(@RequestParam String keyword, @RequestParam( value="cPage", required=false, defaultValue="1") 
								int cPage, Model model) {
		//List<Book> bookSearchList = goodsService.selectBookSearchList(searchWord);
		//model.addAttribute("list", bookSearchList);
		
		/******** !!!!!! /book/bookList.do 랑 코드 동일 !!!!!!!!!! ********/
		
		// 한 페이지당 게시글
		int numPerPage = 5;
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = goodsService.selectSearchBookList(cPage, numPerPage, keyword);
		
		// 2. 전페 게시글 수 (페이징 처리)
		int totalContents = goodsService.selectSearchBookTotalContents(keyword);
		
		// 3. 페이지 계산된 html 구하기
		String pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, "searchBookList.do?keyword=" + keyword);
		
		// 4. 도서 각각의 리뷰 개수, 평점, 판매량
		List<Book> bookList = new ArrayList<Book>();
		
		for(int i = 0; i < list.size(); i++) {
			bookList.add((Book) list.get(i)); // List<Map> 형식을 List로 변경 (bookNo와 type을 찾기 위해)
		}
	
		List<Object> eachReviewList = new ArrayList<Object>(); // 빈 리스트 생성
		Map<String, Double> reviewMap = new HashMap<>(); // 리뷰용 빈 맵 생성
		List<Integer> eachSalesCount = new ArrayList<>(); // 판매지수용 빈 리스트 생성
		
		for(int j = 0; j < bookList.size(); j ++) {
			Review review = new Review();
			review.setBookNo(bookList.get(j).getBookNo());
			// bookList 크기만큼 반복하며 review객체를 사용하여 조회한 avg와 count를 Map 형태로 가져온다.
			reviewMap = reviewService.eachBookReview(review); // 출력 형식 : {avg=4.3, count=3.0}
			eachReviewList.add(reviewMap); // 조회한 모든 Map을 다시 List에 넣는다.
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBookNo(bookList.get(j).getBookNo());
			int salesCount = orderService.eachBookSalesCount(orderDetail);
			eachSalesCount.add(salesCount);
			
		}
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("eachReviewList", eachReviewList); // 출력 형식 : [{avg=4.3, count=3.0}, {avg=0.0, count=0.0}]
		model.addAttribute("eachSalesCount", eachSalesCount); // 출력 형식 : [4, 0, 1, 1, 2]
		
		return "book/searchBookList";
	}
	
	
	private void addQuickList(int bookNo, Book quickBook, HttpSession session) {
		boolean exist =false;
		List<Book> quickBooksList=(ArrayList<Book>)session.getAttribute("quickBooksList");
	
		if(quickBooksList!=null){
			if(quickBooksList.size() < 5){
				for(int i = 0; i < quickBooksList.size(); i++){
					Book book= (Book) quickBooksList.get(i);
					if(bookNo == book.getBookNo()){
						exist=true;
						break;
					}
				}
				if(exist == false){
					quickBooksList.add(quickBook);
				}
			}
			
		}else{
			quickBooksList =new ArrayList<Book>();
			quickBooksList.add(quickBook);
			
		}
		session.setAttribute("quickBooksList", quickBooksList);
		session.setAttribute("quickBooksListNum", quickBooksList.size());
		
	}
}
