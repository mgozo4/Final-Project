package com.bitc.jeogi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("customer_center/")
public class CustomerCenterController {
	
//	@GetMapping("customer_center")
//    public String showCustomerCenter() {
//		return "customer_center/customer_center";
//    }
	
	@GetMapping("customer_center")
  public void showCustomerCenter() {
  }
  
	
	
    @GetMapping("/announcement")
    public void showAnnouncement() {
   // /WEB-INF/views/customer_center/announcement.jsp로 포워딩
    }

    @GetMapping("/chatbot")
    public void showChatbot() {// /WEB-INF/views/customer_center/chatbot.jsp로 포워딩
    }

    @GetMapping("/customer-service")
    public void showCustomerService() {// /WEB-INF/views/customer_center/customer-service.jsp로 포워딩
    }

    @GetMapping("/faq")
    public void showFaq() {// /WEB-INF/views/customer_center/faq.jsp로 포워딩
    }
}
