package com.kh.bookpickple.manager.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/manager/managerMain.do")
	public String managerMain() {
		return "manager/main";
	}
}
