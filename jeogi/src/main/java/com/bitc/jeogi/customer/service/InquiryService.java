package com.bitc.jeogi.customer.service;

import java.util.List;

import com.bitc.jeogi.customer.vo.InquiryVO;

public interface InquiryService {
	 // 문의 제출
    void submitInquiry(InquiryVO inquiry);

    // 문의 ID로 조회
    InquiryVO getInquiryById(int inquiry_id);

    // 사용자 ID로 문의 목록 조회
    List<InquiryVO> getInquiriesByUserId(int userId);

    // 모든 문의 목록 조회
    List<InquiryVO> getAllInquiries();

    // 문의 상태 업데이트
    void updateInquiryStatus(int inquiryId, String status);
}