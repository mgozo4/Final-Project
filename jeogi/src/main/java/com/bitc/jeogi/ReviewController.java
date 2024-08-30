package com.bitc.jeogi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @GetMapping("/review")
    public String showReview() {
        return "review/review"; // /WEB-INF/views/review/review.jsp로 포워딩
    }
}
	