package com.bitc.jeogi.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.common.util.SearchCriteria;
import com.bitc.jeogi.common.util.SearchPageMaker;
import com.bitc.jeogi.customer.dao.InquiryDAO;
import com.bitc.jeogi.customer.vo.InquiryVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryServiceImpl implements InquiryService {

    private final InquiryDAO inquiryDAO;

    @Override
    public Map<String, Object> list(SearchCriteria cri) throws Exception {
        // 문의 목록
        List<InquiryVO> inquiries = inquiryDAO.list(cri);
        
        // 문의 총 개수 조회
        int total = inquiryDAO.getAllList(cri);

        // 페이지 네이션을 위한 PageMaker 생성
        SearchPageMaker pm = new SearchPageMaker();
        pm.setCri(cri);           // 검색 기준 설정
        pm.setTotalCount(total);   // 총 개수 설정
        
        // 결과를 담을 Map 객체 생성
        Map<String, Object> result = new HashMap<>();
        result.put("list", inquiries);  // 문의 목록
        result.put("pm", pm);           // 페이지 정보 (PageMaker)

        return result;
    }
    @Override
    @Transactional
    public String regist(InquiryVO vo) throws Exception {
        inquiryDAO.regist(vo);
        return "문의가 성공적으로 등록되었습니다.";
    }

    @Override
    public InquiryVO getInquiry(int inquiry_id) throws Exception {
        return inquiryDAO.getInquiry(inquiry_id);
    }

    @Override
    @Transactional
    public String modify(InquiryVO vo) throws Exception {
        inquiryDAO.modify(vo);
        return "문의가 성공적으로 수정되었습니다.";
    }

    @Override
    public void incrementViewCount(int inquiry_id) throws Exception {
        inquiryDAO.incrementViewCount(inquiry_id);
    }

    @Override
    @Transactional
    public String delete(int inquiry_id) throws Exception {
        inquiryDAO.delete(inquiry_id); // DAO에서 삭제 호출
        return "삭제가 완료되었습니다."; // 사용자에게 보여줄 메시지
    }
}