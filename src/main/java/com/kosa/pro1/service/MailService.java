package com.kosa.pro1.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailService {
	@Autowired
	 private JavaMailSender mailSender;
    @Autowired
    private SimpleMailMessage preConfiguredMessage;
 
    @Async 
	public void sendMail(String to) {
      MimeMessage message = mailSender.createMimeMessage();
      try {
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		//messageHelper.setCc("zzzzzz@naver.com"); 
		messageHelper.setFrom("audtjd1201@gamil.com", "관리자");
		messageHelper.setSubject("앗싸 나 성공함ㅋㅋ");
		messageHelper.setTo(to); 
		messageHelper.setText("야호~플젝끝남ㅎㅎ" );
		mailSender.send(message); 
      }catch(Exception e){
		e.printStackTrace();
	  }
	}

	@Async
	public void sendPreConfiguredMail(String message) {
	  SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
	  mailMessage.setText(message);
	  mailSender.send(mailMessage);
	}
}

