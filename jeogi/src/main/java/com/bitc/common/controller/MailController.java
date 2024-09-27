package com.bitc.common.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MailController {
	
	private final JavaMailSender mailSender;	
	
	@GetMapping("checkEmail")
	public String sendMail() throws Exception{
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
		helper.setFrom("fghjkl8720@gmail.com", "MASTER");	// 발신자
		helper.setTo("hap0p9y@nate.com");		// 수신자 // String[] == 다중 발송
		helper.setSubject("이메일 테스트!!!!");
		helper.setText("반가워요. <span style='color:red;'>안녕.</span>", true);
		mailSender.send(message);  // 메일 발송 요청
		System.out.println("발신 완료");
		return "redirect:/";
	}

}






