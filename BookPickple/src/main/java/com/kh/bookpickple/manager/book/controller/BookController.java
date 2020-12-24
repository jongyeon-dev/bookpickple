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

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
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
	public String bookListView() {
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
	
	// 단순 파일 이름 변경용 메소드 
	public String fileNameChanger(String oldFileName) {

		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		
	}
}
