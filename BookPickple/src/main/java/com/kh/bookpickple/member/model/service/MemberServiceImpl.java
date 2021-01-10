package com.kh.bookpickple.member.model.service;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.member.model.dao.MemberDAO;
import com.kh.bookpickple.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public int checkIdDuplicate(String userId) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return memberDAO.checkIdDuplicate(hmap);
	}
	
	@Override
	public int checkEmailDuplicate(String email) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("email", email);
		
		return memberDAO.checkEmailDuplicate(hmap);
	}

	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public Member loginMember(String userId) {
		return memberDAO.loginMember(userId);
	}

	@Override
	public Member selectOneMember(int userNo) {
		return memberDAO.selectOneMember(userNo);
	}

	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}

	@Override
	public int deleteMember(int userNo) {
		return memberDAO.deleteMember(userNo);
	}

	@Override
	public String findIdByEmail(String email) {
		return memberDAO.findIdByEmail(email);
	}

	@Override
	public Member isExistMember(Member member) {
		return memberDAO.isExistMember(member);
	}

	@Override
	public int updateNewPwd(Member member) {
		return memberDAO.updateNewPwd(member);
	}

	@Override
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setFrom("jongyeony@google.com", "BookPickple");
			messageHelper.setText(body, true);
			mailSender.send(message);
		} catch (Exception e){
			e.printStackTrace();
		}
	}

}
