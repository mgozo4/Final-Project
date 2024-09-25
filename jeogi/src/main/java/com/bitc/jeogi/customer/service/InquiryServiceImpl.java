package com.bitc.jeogi.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.jeogi.customer.dao.InquiryDAO;
import com.bitc.jeogi.customer.vo.InquiryVO;

@Service
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    private InquiryDAO inquiryDAO;
    // 문의 제출
    @Override
    public void submitInquiry(InquiryVO inquiry) {
        inquiryDAO.insertInquiry(inquiry);
    }

    // 문의 ID로 조회
    @Override
    public InquiryVO getInquiryById(int inquiry_id) {
        return inquiryDAO.selectInquiryById(inquiry_id);
    }

    // 사용자 ID로 문의 목록 조회
    @Override
    public List<InquiryVO> getInquiriesByUserId(int user_id) {
        return inquiryDAO.selectInquiriesByUserId(user_id);
    }

    // 모든 문의 목록 조회
    @Override
    public List<InquiryVO> getAllInquiries() {
        return inquiryDAO.selectAllInquiries();
    }

    // 문의 상태 업데이트
    @Override
    public void updateInquiryStatus(int inquiry_id, String status) {
        inquiryDAO.updateInquiryStatus(inquiry_id, status);
    }
}