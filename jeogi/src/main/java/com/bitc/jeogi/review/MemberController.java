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
    public String login(String id, String password, HttpSession session) {
        MemberDTO member = memberService.login(id, password);
        if (member != null) {
            session.setAttribute("member", member);
            return "redirect:/member/home"; // 로그인 성공 후 홈 페이지로 리디렉션
        } else {
            try {
                // 로그인 실패 메시지를 URL 인코딩
                String encodedMessage = URLEncoder.encode("로그인 실패", StandardCharsets.UTF_8.toString());
                return "redirect:/member/login?msg=" + encodedMessage;
            } catch (UnsupportedEncodingException e) {
                // URL 인코딩 실패 처리
                e.printStackTrace();
                return "redirect:/member/login";
            }
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
            model.addAttribute("msg", "회원가입 성공!"); // 회원가입 성공 메시지 추가
            return "redirect:/member/login"; // 회원가입 성공 시 로그인 페이지로 리디렉션
        } else {
            model.addAttribute("msg", "회원가입 실패!"); // 회원가입 실패 메시지 추가
            return "member/register"; // 회원가입 실패 시 회원가입 페이지로 이동
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
        session.setAttribute("member", memberService.getMemberById(member.getUserId()));
        return "redirect:/member/profile"; // 업데이트 후 프로필 페이지로 리디렉션
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