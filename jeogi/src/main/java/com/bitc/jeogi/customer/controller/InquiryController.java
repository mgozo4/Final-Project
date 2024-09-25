package com.bitc.jeogi.customer.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bitc.jeogi.customer.service.InquiryService;
import com.bitc.jeogi.customer.vo.InquiryVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController // ResponseBody가 자동으로 적용됨
@RequestMapping("/inquiries")
public class InquiryController {

    private final InquiryService inquiryService;

    @PostMapping
    public void submitInquiry(@RequestBody InquiryVO inquiry) {
        inquiryService.submitInquiry(inquiry);
    }

    @GetMapping("/viewInquiry/{inquiry_id}")
    public InquiryVO getInquiry(@PathVariable int inquiry_id) {
        return inquiryService.getInquiryById(inquiry_id);
    }

    @GetMapping("/user/{user_id}")
    public List<InquiryVO> getInquiriesByUserId(@PathVariable int user_id) {
        return inquiryService.getInquiriesByUserId(user_id);
    }

    @GetMapping
    public List<InquiryVO> getAllInquiries() {
        return inquiryService.getAllInquiries();
    }

    @PutMapping("/{inquiry_id}/status")
    public void updateInquiryStatus(@PathVariable int inquiry_id, @RequestParam String status) {
        inquiryService.updateInquiryStatus(inquiry_id, status);
    }
    @GetMapping("/list") 
    public List<InquiryVO> getInquiryList() {
        return inquiryService.getAllInquiries();
    }
    @GetMapping("/submitOneOnOneInquiry")
    public String showSubmitOneOnOneInquiryPage() {
        return "submitOneOnOneInquiry"; 
    }
    @PostMapping("/one-on-one")
    public void submitOneOnOneInquiry(@RequestBody InquiryVO inquiry) {
        inquiryService.submitInquiry(inquiry);
    }
}
