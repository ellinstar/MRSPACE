package com.space.admin.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.space.admin.service.AdminCompService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin/notice/**")
public class AdminEmailController {
	
	@Autowired
	private AdminCompService adminCompServ;
	
	@RequestMapping(value="/mailSender",method=RequestMethod.POST)
	public String mailSender(HttpServletRequest request) throws AddressException, MessagingException{
		String title = (String) request.getParameter("mail_title");//메일 제목
		String message = (String) request.getParameter("mail_message");//메일 내용
		log.info("mailsender호출");
		//SMTP서버 설정
		final String host = "smtp.gmail.com";//smtp host
		final String accountId = "ellinstar48@gmail.com";
		final String accountPwd = "비밀번호";
		final int port = 465;//smtp포트
		
		String sender = "ellinstar48@gmail.com";//보내는 이메일
		
		//property 정보 생성
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		//사용자 인증
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(accountId, accountPwd);
			}
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);//MimeMessage생성
		mimeMessage.setFrom(new InternetAddress(sender));//보내는 Email
		
		//String receiver = "ellinstar@naver.com";//받는 이메일
		
		/*String[] list = receiver.toArray(new String[receiver.size()]);
		for(int i=0; i<list.length;i++) {
			toAddr[i] = new InternetAddress();
		}*/
		Map<String, Object> receiver = adminCompServ.cpMail();
		InternetAddress[] toAddr = new InternetAddress[receiver.size()];
		Iterator<String> keys = receiver.keySet().iterator();
		while(keys.hasNext()) {
			for(int i=0; i<receiver.size();i++) {
			toAddr[i] = new InternetAddress((String)receiver.get(keys));
			}
		}
		mimeMessage.setRecipients(Message.RecipientType.TO, toAddr);
		
		//Message Setting
		mimeMessage.setSubject(title);
		mimeMessage.setText(message);
		
		Transport.send(mimeMessage);
	/*	String result = "";
		result = "success";
		model.addAttribute("mail", result);*/
		return "redirect: list";
		
	}
	

}
