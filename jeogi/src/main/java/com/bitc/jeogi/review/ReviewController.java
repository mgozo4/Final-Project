package com.bitc.jeogi.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.review.service.ReviewService;
import com.bitc.jeogi.vo.ReviewVO;
import com.bitc.jeogi.review.dto.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("review/")
@Slf4j
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    /**
     * 페이징 처리 된 리뷰 목록 페이지
     */
    @GetMapping("list")
    public void listPage(Integer accommodation_id, Criteria cri, Model model) throws Exception {
        log.info("리뷰 목록 페이지 요청됨");
        if (accommodation_id == null) {
            log.warn("Accommodation ID가 제공되지 않았습니다.");
            return;
        }

        List<ReviewVO> reviews = reviewService.listCriteria(accommodation_id, cri);
        model.addAttribute("list", reviews);
        int totalCount = reviewService.countByAccommodationId(accommodation_id);
        PageMaker pageMaker = reviewService.getPageMaker(cri, totalCount);
        model.addAttribute("pageMaker", pageMaker);
    }
    @GetMapping("write")
    public void write() throws Exception {
        log.info("리뷰작성 페이지 요청됨");
    }

    /**
     * 리뷰 등록 요청 처리
     */
    @PostMapping("write")
    public String write(ReviewVO review, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member == null) {
            redirectAttributes.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/member/login";
        }
        review.setUser_id(member.getUser_id()); 
        try {
            reviewService.write(review);
            redirectAttributes.addFlashAttribute("msg", "리뷰가 성공적으로 등록되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("msg", "리뷰 등록 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return "redirect:/review/list?accommodation_id=" + review.getAccommodation_id(); 
    }
    /**
     * 리뷰 상세보기 페이지
     */
    @GetMapping("detail")
    public String detail(int review_id, Model model) throws Exception {
        log.info("리뷰 상세보기 페이지 요청됨: review_id = {}", review_id);

        // 리뷰 상세 조회
        ReviewVO vo = reviewService.detail(review_id);
        model.addAttribute("review", vo);
        return "review/detail";
    }

    /**
     * 리뷰 수정 페이지 요청 - 리뷰 수정 화면 출력
     */
    @GetMapping("update")
    public String update(int review_id, Model model) throws Exception {
        log.info("리뷰 수정 페이지 요청됨: review_id = {}", review_id);

        // 리뷰 상세 조회
        ReviewVO vo = reviewService.detail(review_id);
        model.addAttribute("review", vo);
        return "review/update";
    }

    /**
     * 리뷰 수정 처리 요청
     */
    @PostMapping("update")
    public String update(ReviewVO vo, RedirectAttributes rttr) throws Exception {
        log.info("리뷰 수정 요청됨: ReviewVO = {}", vo);

        // 리뷰 수정 처리
        String result = reviewService.update(vo);
        rttr.addAttribute("review_id", vo.getReview_id());
        rttr.addFlashAttribute("msg", result);
        return "redirect:/review/detail";
    }

    /**
     * 리뷰 삭제 처리
     */
    @GetMapping("delete")
    public String remove(int review_id, RedirectAttributes rttr) throws Exception {
        log.info("리뷰 삭제 요청됨: review_id = {}", review_id);

        // 리뷰 삭제 처리
        String msg = reviewService.delete(review_id);
        rttr.addFlashAttribute("msg", msg);
        return "redirect:/review/list";
    }
}
