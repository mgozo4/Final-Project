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

    @Override
    public void addInquiry(InquiryVO inquiry) {
        inquiryDAO.insertInquiry(inquiry);
    }

    @Override
    public List<InquiryVO> getInquiriesByUserId(int userId) {
        return inquiryDAO.getInquiriesByUserId(userId);
    }

    @Override
    public InquiryVO getInquiryById(int inquiryId) {
        return inquiryDAO.getInquiryById(inquiryId);
    }

    @Override
    public void updateInquiryStatus(int inquiryId, String status) {
        inquiryDAO.updateInquiryStatus(inquiryId, status);
    }
}
