package com.bitc.jeogi.review.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

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
    public String loginPage( String msg, Model model) {
    	try {
            if (msg != null) {
                model.addAttribute("msg", msg);
            }
            return "member/login";
        } catch (Exception e) {
            System.out.println("예외 발생 (loginPage): " + e.getMessage());
            return "member/login";
        }
    }
    /**
     * 로그인 요청을 처리합니다.
     */
    @PostMapping("/login")
    public String login(String id, String password, HttpSession session, RedirectAttributes redirectAttributes) {
        MemberDTO member = memberService.login(id, password);
        if (member != null) {
            session.setAttribute("member", member);
            return "redirect:/";
        } else {
            redirectAttributes.addFlashAttribute("msg", "로그인 실패");
            return "redirect:/member/login";
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
    public String registerMember(MemberDTO member, Model model) {
    	boolean isJoin = memberService.registerMember(member);
        if (isJoin) {
            model.addAttribute("msg", "회원가입 성공!");
            return "redirect:/member/login"; 
        } else {
            model.addAttribute("msg", "회원가입 실패!"); 
            return "member/register";
        }
    }

    /**
     * 프로필 페이지를 반환합니다.
     */
    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member != null) {
            model.addAttribute("member", member);
            return "member/updateProfile";
        } else {
            return "redirect:/member/login"; 
        }
    }

    /**
     * 프로필 수정 페이지를 반환합니다.
     */
    @GetMapping("/update")
    public String showUpdateForm(HttpSession session, Model model) {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member != null) {
            model.addAttribute("member", member);
            return "member/updateProfile"; 
        } else {
            return "redirect:/member/login";
        }
    }
    /**
     * 프로필 업데이트 요청을 처리합니다.
     */
    @PostMapping("/updateProfile")
    public String updateMember(MemberDTO member, HttpSession session) {
        memberService.updateMember(member);
        int memberId = Integer.parseInt(member.getId()); 
        session.setAttribute("member", memberService.getMemberById(memberId));
        return "redirect:/member/profile";
    }


@GetMapping("/home")
public String homePage(HttpSession session, Model model) {
    MemberDTO member = (MemberDTO) session.getAttribute("member");
    if (member != null) {
        model.addAttribute("member", member); 
        return "member/home";
    } else {
        return "redirect:/member/login";
    }
}
    /**
     * 로그아웃 요청을 처리합니다.
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); 
        return "redirect:/member/login"; 
    }
}