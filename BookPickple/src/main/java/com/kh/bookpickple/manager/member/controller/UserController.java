package com.kh.bookpickple.manager.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bookpickple.manager.member.model.service.UserService;
import com.kh.bookpickple.member.model.vo.Member;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/manager/memberListView.do")
	public String memberListView(Model model) {
		List<Member> memberList = userService.selectMemberList();
		model.addAttribute("memberList", memberList);
		return "manager/member/memberList";
	}
	
	@RequestMapping("/manager/memberDetailView.do")
	public String memberDetailView(int userNo, Model model) {
		Member m = userService.seletOneMember(userNo);
		model.addAttribute("oneMember", m);
		return "manager/member/memberDetail";
	}

}
