package com.kh.bookpickple.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookpickple.mail.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	MailService mailService;

	@RequestMapping("/mail/sendMailView.do")
	public String sendMailView() {
		return "manager/mail/sendMail";
	}
	
	@RequestMapping(value="/mail/sendMailEnd.do") 
	public String sendMailEnd(@RequestParam String mailTitle, @RequestParam String mailContent, Model model) {
		
		String loc="";
		String msg = "";
		
		try {
			
			StringBuffer sb = new StringBuffer();
			sb.append(mailContent); // html로 작성된 내용을 StringBuffer에 저장
			String str = sb.toString();
			
			String result = mailService.sendMail(mailTitle, str);
			
			loc = "/manager/managerMain.do";
			msg = "";
			
			if(result.equals("success")) msg = "성공적으로 메일 전송이 완료되었습니다.";
			else msg = "메일 전송에 실패하였습니다.";
			
		} catch (Exception e) {
			System.out.println("메일 전송 에러 발생");
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
		
	}
}
