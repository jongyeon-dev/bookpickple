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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookpickple.common.util.Pagination;
import com.kh.bookpickple.goods.model.service.GoodsService;
import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

@Controller
public class GoodsController {
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping("/book/selectBookList.do")
	public String selectBookList(@RequestParam String type, @RequestParam( value="cPage", required=false, defaultValue="1") 
									int cPage, Model model) {
		// 한 페이지당 게시글
		int numPerPage = 10;
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = goodsService.selectBookList(cPage, numPerPage, type);
		
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
	public String selectOneBook(@RequestParam int bookNo, Model model, HttpServletRequest request) {
		
		Book book = goodsService.selectOneBook(bookNo);
		List<BookImages> bookImages = goodsService.selectOneBookImagesList(bookNo);

		model.addAttribute("book", book);
		model.addAttribute("bookImages", bookImages);
	
		
		HttpSession session=request.getSession();
		Book quickBook = goodsService.selectQuickBook(bookNo);
		addQuickList(bookNo, quickBook, session);
		
		return "book/bookDetails";
	}
	
	private void addQuickList(int bookNo, Book quickBook, HttpSession session) {
		boolean exist =false;
		List<Book> quickGoodsList; //최근 본 상품 저장 ArrayList
		quickGoodsList=(ArrayList<Book>)session.getAttribute("quickGoodsList");
		
		if(quickGoodsList!=null){
			if(quickGoodsList.size() < 5){
				for(int i=0; i<quickGoodsList.size();i++){
					Book _goodsBean=(Book)quickGoodsList.get(i);
					if(bookNo == _goodsBean.getBookNo()){
						exist=true;
						break;
					}
				}
				if(exist == false){
					quickGoodsList.add(quickBook);
				}
			}
			
		}else{
			quickGoodsList =new ArrayList<Book>();
			quickGoodsList.add(quickBook);
			
		}
		session.setAttribute("quickGoodsList",quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
		
	}
}
