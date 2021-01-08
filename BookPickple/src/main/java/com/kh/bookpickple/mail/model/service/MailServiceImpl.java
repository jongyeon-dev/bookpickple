package com.kh.bookpickple.mail.model.service;

import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.bookpickple.mail.model.dao.MailDAO;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	MailDAO mailDAO;

	@Override
	public String sendMail(String mailTitle, String mailContent) {
		
		MimeMessage message = mailSender.createMimeMessage();

	    try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("jongyeony@google.com", "BookPickple"); // 발신자 정보
			messageHelper.setSubject(mailTitle); // 제목
			// messageHelper.setTo(); // 수신자

			List<String> receiverList = mailDAO.receiverList();
			
			for(int i = 0; i < receiverList.size(); i++) {
				// 수신자가 여러 명일때 사용
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverList.get(i)));
			}

			messageHelper.setText(mailContent, true); // 메일이 html 형식으로 출력되게 하려면 true
			mailSender.send(message);  
	    } catch (Exception e){
			e.printStackTrace();
		}
	    
		return "success";
	}
	


}
