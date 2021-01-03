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

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.member.model.vo.Member;
import com.kh.bookpickple.order.model.service.OrderService;
import com.kh.bookpickple.order.model.vo.Order;
import com.kh.bookpickple.order.model.vo.OrderDetail;

@SessionAttributes("orderList")
@Controller
public class OrderController {

	@Autowired
	OrderService orderService;

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
	public ModelAndView cartOrder( @RequestParam("cartOrderValue") String[] cartOrderValue, HttpServletRequest request ) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		Map cartMap = (Map) session.getAttribute("cartMap");
		List<Order> orderList = new ArrayList<Order>();
		List<Book> bookList = (List<Book>) cartMap.get("bookList");
		
		if(cartOrderValue == null || cartOrderValue.length == 0) {
			mv.setViewName("redirect:/");
		} else {
			for(int i = 0; i < cartOrderValue.length; i++) {
				String[] booksInfo = cartOrderValue[i].split(","); //체크박스 value 값 (수량, 가격, 포인트, 도서 번호)
				System.out.println(booksInfo[3]);
				System.out.println(bookList.size());//5
				
				for(int j = 0; j < bookList.size(); j++) {
					
					Book book = bookList.get(j);
					int bookNo = book.getBookNo();
					if(bookNo == Integer.parseInt(booksInfo[3].trim())) {
						Order order = new Order();
						String title = book.getTitle();
						int salesPrice = book.getSalesPrice();
						String changeFileName = book.getChangeFileName();
						
						System.out.println(changeFileName);
						
						// 주문서에 보여질 도서 정보들
						order.setBookNo(bookNo);
						order.setBookImage(changeFileName);
						order.setTitle(title);
						order.setSalesPrice(salesPrice);
						order.setQuantity(Integer.parseInt(booksInfo[0].trim()));
						order.setTotalPrice(Integer.parseInt(booksInfo[1].trim()));
						order.setPoint(Integer.parseInt(booksInfo[2].trim()));
						
						orderList.add(order);
						break;
					}
				}
			}
		}
		
		
		System.out.println(orderList);
		mv.addObject(orderList);
		mv.setViewName("order/orderForm");
	
		return mv;
	};

	
	@RequestMapping("/order/orderPayment.do")
	@ResponseBody
	public String orderPayment(Order order, Model model, HttpServletRequest request) {
		
		HttpSession session=request.getSession();
	
		  
		  List<Order> allOrderList = (List<Order>) session.getAttribute("orderList");
		  Member member = (Member) session.getAttribute("member");
		  
		  for(int i = 0; i < allOrderList.size(); i++) {
			// 1종이면 도서 이름 / 2종이면 리스트 첫번째 도서 외 1종
			  String orderTitle = allOrderList.get(0).getTitle();
			  int bookNo = allOrderList.get(0).getBookNo();
			  System.out.println("orderTitle:::::::::::" + orderTitle);
			  if(allOrderList.size() == 1) {
				  order.setOrderTitle(orderTitle);
			  } else {
				  order.setOrderTitle(orderTitle + " 외 " + i + " 종");
			  }
			  order.setBookNo(bookNo);
		  }
 		 
		  System.out.println(order);
		  
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
			 
			 orderDetail.add(od);
		 }

		int result = orderService.insertPayRecord(order, orderDetail);
		
		System.out.println(result);
	
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}
