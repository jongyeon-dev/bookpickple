package com.kh.bookpickple.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bookpickple.common.exception.OrderException;
import com.kh.bookpickple.common.util.Pagination;
import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.member.model.vo.Member;
import com.kh.bookpickple.order.model.service.OrderService;
import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;
import com.kh.bookpickple.review.model.service.ReviewService;
import com.kh.bookpickple.review.model.vo.Review;

@SessionAttributes("orderList")
@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	ReviewService reviewService;

	@RequestMapping("/order/eachOrder.do")
	public ModelAndView eachOrder(@ModelAttribute Order order) {
		ModelAndView mv = new ModelAndView();
		
		if(order.getBookNo() == 0) {
			mv.setViewName("redirect:/");
		} else {
			List<Order> orderList = new ArrayList<Order>();
			orderList.add(order);
			mv.addObject(orderList); // 주문서 작성 부분이기 때문에 세션으로 둔다.
			mv.setViewName("order/orderForm");
		}
		
		return mv;
	}
	
	@RequestMapping("order/cartOrder.do")
	public ModelAndView cartOrder( @RequestParam String[] cartOrderValue, HttpServletRequest request ) {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Map cartMap = (Map) session.getAttribute("cartMap");
		List<Order> orderList = new ArrayList<Order>();
		List<Book> bookList = (List<Book>) cartMap.get("bookList");
		if(cartOrderValue == null || cartOrderValue.length == 0) {
			mv.setViewName("redirect:/");
		} else {
			for(int i = 0; i < cartOrderValue.length; i++) {
				String[] booksInfo = cartOrderValue[i].split(","); //체크박스 value 값 (수량, 정가, 판매가, 포인트, 추가 포인트, 도서 번호)
				
				for(int j = 0; j < bookList.size(); j++) {
					
					Book book = bookList.get(j);
					int bookNo = book.getBookNo();
					if(bookNo == Integer.parseInt(booksInfo[5].trim())) {
						Order order = new Order();
						String title = book.getTitle();
						int salesPrice = book.getSalesPrice();
						String changeFileName = book.getChangeFileName();
						
						// 주문서에 보여질 도서 정보들
						order.setBookNo(bookNo);
						order.setBookImage(changeFileName);
						order.setTitle(title);
						order.setPrice(Integer.parseInt(booksInfo[1].trim()));
						order.setSalesPrice(salesPrice);
						order.setQuantity(Integer.parseInt(booksInfo[0].trim()));
						order.setTotalPrice(Integer.parseInt(booksInfo[2].trim()));
						order.setPoint(Integer.parseInt(booksInfo[3].trim()));
						order.setGradePoint(Integer.parseInt(booksInfo[4].trim()));
						
						orderList.add(order);
						break;
					}
				}
			}
		}
		
		mv.addObject(orderList);
		mv.setViewName("order/orderForm");
	
		return mv;
	};

	
	@RequestMapping("/order/orderPayment.do")
	@ResponseBody
	public String orderPayment(@RequestParam int usePoint, Order order, Model model, HttpServletRequest request) throws OrderException {
		
		HttpSession session=request.getSession();
	
		  
		  List<Order> allOrderList = (List<Order>) session.getAttribute("orderList");
		  Member member = (Member) session.getAttribute("member");
		  
		  for(int i = 0; i < allOrderList.size(); i++) {
			// 1종이면 도서 이름 / 2종이면 리스트 첫번째 도서 외 1종
			  String orderTitle = allOrderList.get(0).getTitle();
			  int bookNo = allOrderList.get(0).getBookNo();
			  
			  if(allOrderList.size() == 1) {
				  order.setOrderTitle(orderTitle);
			  } else {
				  order.setOrderTitle(orderTitle + " 외 " + i + " 종");
			  }
			  order.setBookNo(bookNo);
		  }

		  if(usePoint > 0) {
			  // 포인트를 사용했으면 멤버의 포인트를 0으로 바꿔야함
			  order.setUsePoint(member.getPoint());  
		  } else {
			  // 아니면 원래의 멤버 포인트 유지
			  // 우선 PAYRECORD 테이블에 안쓰면 안 썼다고 넣어야하기 때문
			  order.setUsePoint(0); 
		  }
		  
		 List<OrderDetail> orderDetail = new ArrayList<OrderDetail>();
		 // 도서 목록이나 상세페이지에서 조회하면 allOrderList는 도서 1종
		 // 카트에서 여러개 주문하면 allOrderList는 도서 여려권
		 // 1종이든 여러종이든 allOrderList의 수만큼 orderDetail에 따로따로 저장한다.
		 for(int i = 0; i < allOrderList.size(); i++) { 
			 Order orList = allOrderList.get(i);
			 OrderDetail od = new OrderDetail(); 
			 od.setUserNo(member.getUserNo());
			 od.setBookNo(orList.getBookNo());
			 od.setTitle(orList.getTitle()); 
			 od.setSalesPrice(orList.getSalesPrice());
			 od.setQuantity(orList.getQuantity());
			 od.setPoint(orList.getPoint());
			 od.setGradePoint(orList.getGradePoint());
			 
			 orderDetail.add(od);
		 }

		int result = orderService.insertPayRecord(order, orderDetail);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("/order/orderListView.do")
	public String orderListView(@RequestParam int userNo,
								@RequestParam(value="periodFrom", required=false) String periodFrom,
								@RequestParam(value="periodTo", required=false) String periodTo,
								@RequestParam(value="searchType", required=false) String searchType,
								@RequestParam(value="searchKeyword", required=false) String searchKeyword,
								@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,  Model model) {
		
		Order order = new Order();
		order.setUserNo(userNo);
		order.setPeriodFrom(periodFrom);
		order.setPeriodTo(periodTo);
		order.setSearchType(searchType);
		order.setSearchKeyword(searchKeyword);
		
		int numPerPage = 10;
		List<Order> myOrderList = orderService.selectOrderList(cPage, numPerPage, order);
		int totalContents = orderService.selectOrderTotalContents(order);
		String pageBar = null;
		
		if( order.getPeriodFrom() == null && order.getPeriodTo() == null && order.getSearchType() == null && order.getSearchKeyword()== null) {
			pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, "orderListView.do?userNo=" + userNo);
		} else if(order.getPeriodFrom() != null && order.getPeriodTo() != null) {
			pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, 
					"orderListView.do?userNo=" + userNo + "&periodFrom=" + periodFrom + "&periodTo=" + periodTo);
		} else if(order.getSearchType() != null && order.getSearchKeyword() == "") {
			pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, "orderListView.do?userNo=" + userNo + "&searchType=" + searchType);
		} else if(order.getSearchType() != null && order.getSearchKeyword() != ""){
			pageBar = Pagination.getPageBar(totalContents, cPage, numPerPage, 
											"orderListView.do?userNo=" + userNo + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword);
		}
	
		model.addAttribute("myOrderList", myOrderList);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "mypage/order/orderList";
	}
	
	@RequestMapping("/order/orderDetail.do")
	public String orderDetail(@RequestParam int userNo, @RequestParam int orderNo, Model model) {
		Order order = new Order();
		order.setUserNo(userNo);
		order.setOrderNo(orderNo);
		List<Order> myOrderDetailList = orderService.selectOrderDetailList(order);
		
		List<Review> reviewList = new ArrayList<Review>();
		
		for(int i = 0; i < myOrderDetailList.size(); i++) {
			Review review = new Review();
			review.setOrderNum(myOrderDetailList.get(i).getOrderNum());
			review.setOrderNo(myOrderDetailList.get(i).getOrderNo());
			review.setUserNo(myOrderDetailList.get(i).getUserNo());
			
			reviewList.add(review);
		}
		
		// 주문한 도서의 리뷰가 등록 된 상태인지 조회
		List<String> isExistReview = reviewService.isExistReview(reviewList); 

		model.addAttribute("myOrderDetailList", myOrderDetailList);
		model.addAttribute("isExistReview", isExistReview);
		return "mypage/order/orderDetail";
	}
	
	
}
