package com.bitc.jeogi.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.jeogi.review.dto.MemberDTO;
import com.bitc.jeogi.review.dto.ReviewDTO;
import com.bitc.jeogi.review.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {
	private final ReviewService reviewService;

    @GetMapping("/create")
    public String showReviewForm(
    		int accommodationId,
             int userId,
            Model model, HttpSession session) {

        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member == null) {
            return "redirect:/login"; 
        }

        model.addAttribute("member", member);
        return "review/createReview";
    }
    @PostMapping("/create")
    public String createReview(
         int accommodationId,
          int userId,
         int rating,
         String content,
         HttpSession session) {
    	 MemberDTO member = (MemberDTO) session.getAttribute("member");
         if (member == null) {
             return "redirect:/login"; 
         }
        ReviewDTO review = new ReviewDTO();
        review.setAccommodationId(accommodationId);
        review.setUserId(userId);
        review.setRating(rating);
        review.setContent(content);

        reviewService.createReview(review);

        return "redirect:/review/list?accommodationId=" + accommodationId;
    }
    
    @GetMapping("/list")
    public String listReviews(
            int accommodationId,
            HttpSession session, Model model) {

        if (accommodationId <= 0) {
            return "errorPage";
        }

        List<ReviewDTO> reviews = reviewService.getReviewsByAccommodationId(accommodationId);
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member != null) {
            model.addAttribute("member", member);
        }

        model.addAttribute("reviews", reviews);
        return "review/reviewList";
    }


    @GetMapping("/detail")
    public String reviewDetail( int reviewId,
    		  HttpSession session, Model model) {

        if (reviewId <= 0) {
            return "errorPage";
        }

        ReviewDTO review = reviewService.getReviewById(reviewId);
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member != null) {
            model.addAttribute("member", member);
        }

        model.addAttribute("review", review);
        return "review/reviewDetail";
    }
    @GetMapping("/review")
    public String showReviewPage(
 Integer accommodationId, 
 HttpSession session, Model model) {

        if (accommodationId != null && accommodationId > 0) {
            List<ReviewDTO> reviews = reviewService.getReviewsByAccommodationId(accommodationId);
            model.addAttribute("reviews", reviews);
        }

        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member != null) {
            model.addAttribute("member", member);
        }

        return "review/review";
    }
}