package com.kh.bookpickple.manager.book.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookpickple.manager.book.model.service.BookService;
import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@RequestMapping("/manager/bookListView.do")
	public String bookListView(Model model) {
		
		List<Map<String, String>> list = bookService.selectBookList();
		
		model.addAttribute("list", list);
		return "manager/book/bookList";
	}
	
	@RequestMapping("/manager/insertBookView.do")
	public String insertBookView() {
		return "manager/book/insertBook";
	}
	
	@RequestMapping("/manager/insertBookEnd.do")
	public String insertBook(Book book, Model model, HttpServletRequest req,
			@RequestParam(value="uploadFile") MultipartFile[] upFiles) {
		
		List<BookImages> bookImages = new ArrayList<BookImages>();
		
		String root = req.getServletContext().getRealPath("/resources/bookFileRepo");
		
		for(MultipartFile f : upFiles) {
			if(f.isEmpty() == false) {
				String originFileName = f.getOriginalFilename();
				String changeFileName = fileNameChanger(originFileName);
				
				try {
					f.transferTo(new File(root + "/" + changeFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				BookImages bi = new BookImages();
				bi.setOriginFileName(originFileName);
				bi.setChangeFileName(changeFileName);
				
				bookImages.add(bi);
			}
		}
		
		int result = bookService.insertBook(book, bookImages);
		
		int bookNo = bookImages.get(0).getBookNo(); 
		String saveDir = root + "/" + bookNo;
		File folder = new File(saveDir);
		
		if(bookImages != null && bookImages.size() > 0) {
			for(BookImages bi :bookImages) {
				String bookImageFileName = bi.getChangeFileName();
				
				if(!folder.exists()) {
					folder.mkdir();
				}
				
				Path file = Paths.get(root + "/" + bookImageFileName);
				Path movePath = Paths.get(saveDir);
				
				try {
					Files.move(file, movePath.resolve(file.getFileName()));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		String loc = "";
		String msg = "";
		
		if( result > 0 ) {
			loc = "/manager/bookListView.do";
			msg = "도서 추가가 완료되었습니다.";
		} else {
			loc = "/manager/bookListView.do";
			msg = "도서 추가가 완료되지 않았습니다. 도서 추가 페이지로 돌아갑니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/manager/detailBookView.do")
	public String detailBookView(@RequestParam int bookNo, Model model) {
		// Book book = bookService.updateBookView(bookNo);
		Book book = bookService.selectOneBook(bookNo);
		List<BookImages> bookImages = bookService.selectOneBookImagesList(bookNo);
		
		model.addAttribute("book", book);
		model.addAttribute("bookImages", bookImages);
		
		return "manager/book/detailBook";
	}
	
	@RequestMapping("/manager/bookUpdateView.do")
	public String bookUpdateView(@RequestParam int bookNo, Model model) {
		Book book = bookService.updateBookView(bookNo);
		List<BookImages> bookImages = bookService.selectOneBookImagesList(bookNo);
		
		model.addAttribute("book", book);
		model.addAttribute("bookImages", bookImages);
		
		return "manager/book/updateBook";
	}
	
	@RequestMapping("/manager/bookUpdateEnd.do")
	public String bookUpdate(Book book, @RequestParam(value="uploadFile") MultipartFile[] upFiles,
							HttpServletRequest req, Model model) {
		
		int bookNo = book.getBookNo();

		// 파일 저장 경로 선언
		String saveDir = req.getServletContext().getRealPath("/resources/bookFileRepo/" + bookNo);
		
		List<BookImages> bookImages = bookService.selectOneBookImagesList(bookNo);	

		if (bookImages == null ) bookImages = new ArrayList<BookImages>(); 
		
		// 변경한 이미지 정보 업로드 
		int idx = 0;
		for(MultipartFile f : upFiles) {
			BookImages bi = null;
			
			if(f.isEmpty() == false) {
				//원본파일 삭제
				if(bookImages.size() > idx) {
					boolean fileDelete
					 	= new File(saveDir + "/" + bookImages.get(idx).getChangeFileName()).delete();
					
					bi = bookImages.get(idx);
				} else {
					bi = new BookImages();
					bi.setBookNo(bookNo);
					
					bookImages.add(bi);
				}
				
				// 파일 이름 변경하기
				String originFileName = f.getOriginalFilename();
				String changeFileName = fileNameChanger(originFileName);
				
				// 실제 파일 저장
				try {
					f.transferTo(new File(saveDir + "/" + changeFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				bi.setOriginFileName(originFileName);
				bi.setChangeFileName(changeFileName);
				
				bookImages.set(idx, bi);
			}
			idx++;
		}
		
		int result = bookService.updateBook(book, bookImages); // 그냥 book해도 되지 않나?
		
		String loc = "";
		String msg = "";
		
		if( result > 0 ) {
			loc = "/manager/bookListView.do";
			msg = "도서 수정이 완료되었습니다.";
		} else {
			loc = "/manager/detailBookView.do";
			msg = "도서 수정이 완료되지 않았습니다. 도서 상세 조회 페이지로 돌아갑니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";

	}
	
	@RequestMapping("/manager/deleteBookEnd.do")
	public String bookDelete(@RequestParam int bookNo, HttpServletRequest req, Model model) {
		String root = req.getServletContext().getRealPath("/resources/bookFileRepo");
		String saveDir = root + "/" + bookNo;
		
		// 이미지 삭제 명단
		List<BookImages> deleteBookImages = bookService.selectOneBookImagesList(bookNo);
		
		// DB 정보 수정 ==> status -> 'STOP'
		int result = bookService.deleteBook(bookNo); // 실제로는 update
		
		String loc = "";
		String msg = "";
		
		if( result > 0 ) {
			loc = "/manager/bookListView.do";
			msg = "도서 삭제가 완료되었습니다.";
			
		} else {
			loc = "/manager/detailBookView.do";
			msg = "도서 삭제가 완료되지 않았습니다. 도서 상세 조회 페이지로 돌아갑니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	// 단순 파일 이름 변경용 메소드 
	public String fileNameChanger(String oldFileName) {

		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		
	}
}
