package com.bitc.jeogi.review;

import com.bitc.jeogi.review.dto.MemberDTO;
import com.bitc.jeogi.review.dto.ReviewDTO;
import com.bitc.jeogi.review.service.ReviewService;
import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.PageMaker;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {
	private static final Logger LOGGER = Logger.getLogger(ReviewController.class.getName());
	private final ReviewService reviewService;
	private MemberDTO getAuthenticatedMember(HttpSession session) {
		return (MemberDTO) session.getAttribute("member");
	}
	private String redirectToLoginWithMessage(HttpSession session, String message) {
		session.setAttribute("loginMessage", message);
		return "redirect:/member/login";
	}
	@GetMapping("/createReview")
	public String showReviewForm(Integer accommodationId, Integer userId, Model model, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		if (member == null) {
			return redirectToLoginWithMessage(session, "로그인이 필요합니다.");
		}
		 model.addAttribute("member", member);
		    model.addAttribute("accommodationId", accommodationId);
		    model.addAttribute("userId", userId);                  
		    return "review/createReview";
	}
	@PostMapping("/createReview")
	public String createReview(Integer rating, String content, Integer accommodationId, Integer userId, String images,
			HttpSession session) {
		MemberDTO member = getAuthenticatedMember(session);
		if (member == null) {
			return redirectToLoginWithMessage(session, "로그인이 필요합니다.");
		}

		if (accommodationId == null || userId == null) {
			LOGGER.warning(String.format("에러: 숙소 ID 또는 사용자 ID가 없습니다. accommodationId: %d, userId: %d", accommodationId, userId));
			return "redirect:/review/createReview?error=missingId";
		}

		ReviewDTO review = new ReviewDTO();
		review.setAccommodationId(accommodationId);
		review.setUserId(userId);
		review.setRating(Optional.ofNullable(rating).orElse(0));
		review.setContent(content);
		review.setImages(images);

		reviewService.createReview(review);

		return "redirect:/review/reviewList?accommodationId=" + accommodationId;
	}

	@GetMapping("/reviewList")
	public String listReviews(Integer accommodationId, Integer pageNumber, HttpSession session, Model model) {
		if (accommodationId == null || accommodationId <= 0) {
			System.out.println("에러: 유효하지 않은 숙소 ID입니다. accommodationId: " + accommodationId);
			return "redirect:/review/reviewList?error=invalidAccommodationId";
		}

		Criteria criteria = new Criteria(Optional.ofNullable(pageNumber).orElse(1), 10);
		int totalCount = reviewService.getReviewCountByAccommodationId(accommodationId);
		PageMaker pageMaker = new PageMaker(criteria, totalCount);

		List<ReviewDTO> reviews = reviewService.getReviewsByAccommodationId(accommodationId, criteria);
		MemberDTO member = getAuthenticatedMember(session);
		if (member != null) {
			model.addAttribute("member", member);
		}


		model.addAttribute("reviews", reviews);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("accommodationId", accommodationId);
		return "review/reviewList";
	}
	@GetMapping("/reviewDetail")
	public String reviewDetail(Integer reviewId, HttpSession session, Model model) {
		if (reviewId == null || reviewId <= 0) {
			LOGGER.warning("에러: 유효하지 않은 리뷰 ID입니다. reviewId: " + reviewId);
			return "redirect:/review/reviewList?error=invalidReviewId";
		}
		ReviewDTO review = reviewService.getReviewById(reviewId);
		MemberDTO member = getAuthenticatedMember(session);
		if (member != null) {
			model.addAttribute("member", member);
		}

		model.addAttribute("review", review);
		return "review/reviewDetail";
	}
	@GetMapping("/review")
	public String showReviewPage(Integer accommodationId, Integer pageNumber, HttpSession session, Model model) {
		if (accommodationId != null && accommodationId > 0) {
			Criteria criteria = new Criteria(Optional.ofNullable(pageNumber).orElse(1), 10);
			List<ReviewDTO> reviews = reviewService.getReviewsByAccommodationId(accommodationId, criteria);
			int totalReviews = reviewService.getReviewCountByAccommodationId(accommodationId);

			PageMaker pageMaker = new PageMaker(criteria, totalReviews);
			model.addAttribute("reviews", reviews);
			model.addAttribute("pageNumber", pageNumber);
			model.addAttribute("totalPages", pageMaker.getMaxPage());
			model.addAttribute("accommodationId", accommodationId);
		}

		MemberDTO member = getAuthenticatedMember(session);
		if (member != null) {
			model.addAttribute("member", member);
		}
		return "review/review";
	}
}