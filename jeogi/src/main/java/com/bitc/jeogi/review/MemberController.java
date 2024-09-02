package com.bitc.jeogi.review;

import com.bitc.jeogi.review.dto.MemberDTO;
import com.bitc.jeogi.review.service.MemberService;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
@RequiredArgsConstructor
@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    /**
     * 로그인 페이지를 반환합니다.
     */
    @GetMapping("/login")
    public String loginPage() {
        return "member/login"; //
    }

    /**
     * 로그인 요청을 처리합니다.
     */
    @PostMapping("/login")
    public String login(
    		String id,
             String password,
            HttpSession session) {
        MemberDTO member = memberService.login(id, password);
        if (member != null) {
            session.setAttribute("member", member);
            return "redirect:member/home"; // 로그인 성공 후 홈 페이지로 리디렉션
        } else {
            return "member/login"; // 로그인 실패 시 로그인 페이지로 이동
        }
    }

    /**
     * 회원가입 페이지를 반환합니다.
     */
    @GetMapping("/register")
    public String registerPage() {
        return "member/register";
    }

    /**
     * 회원가입 요청을 처리합니다.
     */
    @PostMapping("/register")
    public String registerMember(MemberDTO member) {
        memberService.registerMember(member);
        return "redirect:member/login";
    }

    /**
     * 프로필 페이지를 반환합니다.
     */
    @GetMapping("/profile")
    public String profile(Model model, HttpSession session) {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member != null) {
            model.addAttribute("member", member);
            return "member/profile";
        } else {
            return "redirect:member/login"; 
        }
    }

    /**
     * 프로필 업데이트 요청을 처리합니다.
     */
    @PostMapping("/update")
    public String updateMember(MemberDTO member, HttpSession session) {
        memberService.updateMember(member);
        session.setAttribute("member", memberService.getMemberById(member.getUserId()));
        return "redirect:member/profile"; // 업데이트 후 프로필 페이지로 리디렉션
    }
}
