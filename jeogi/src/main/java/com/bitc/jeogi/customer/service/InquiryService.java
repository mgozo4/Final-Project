package com.bitc.jeogi.customer.service;


import java.util.List;

import com.bitc.jeogi.customer.vo.InquiryVO;

public interface InquiryService {
    void addInquiry(InquiryVO inquiry);
    List<InquiryVO> getInquiriesByUserId(int userId);
    InquiryVO getInquiryById(int inquiryId);
    void updateInquiryStatus(int inquiryId, String status);
}
