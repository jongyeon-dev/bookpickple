package com.kh.bookpickple.goods.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bookpickple.common.util.Pagination;
import com.kh.bookpickple.goods.model.service.GoodsService;
import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;
import com.kh.bookpickple.review.model.service.ReviewService;
import com.kh.bookpickple.review.model.vo.Review;

@Controller
public class GoodsController {
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/book/selectBookList.do")
	public String selectBookList(@RequestParam String type, @RequestParam( value="cPage", required=false, defaultValue="1") 
									int cPage, Model model) {
		// 한 페이지당 게시글
		int numPerPage = 5;
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = goodsService.selectBookList(cPage, numPerPage, type);
		System.out.println(list);
		
		// 2. 전페 게시글 수 (페이징 처리)
		int totalContents = goodsService.selectBookTotalContents(type);
		
		// 3. 페이지 계산된 html 구하기
		String pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, "selectBookList.do?type=" + type);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
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
		String pageBar = Pagination.getPageBar(totalReviewContents, cPage, numPerPage, "detailBookView.do");
		
		// 해당 도서의 평균 평점 조회
		double oneBookAvgRating = reviewService.oneBookAvgRating(bookNo);
		// 해당 도서의 리뷰 개수 조회
		int oneBookReviewCount = reviewService.oneBookReviewCount(bookNo);

		model.addAttribute("book", book);
		model.addAttribute("bookImages", bookImages);
		model.addAttribute("avgRating", oneBookAvgRating);
		model.addAttribute("reviewCount", oneBookReviewCount);
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
