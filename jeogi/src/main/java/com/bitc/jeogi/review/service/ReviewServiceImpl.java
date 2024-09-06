package com.bitc.jeogi.review.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.review.dao.ReviewDAO;
import com.bitc.jeogi.vo.ReviewVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    private final ReviewDAO reviewDAO;
    @Transactional
    @Override
    public void write(ReviewVO review) throws Exception {
        reviewDAO.insert(review);
    }
    @Override
    public ReviewVO detail(int review_id) throws Exception {
        return reviewDAO.selectById(review_id);
    }

    @Override
    public String update(ReviewVO review) throws Exception {
        reviewDAO.update(review);
        return "리뷰가 성공적으로 수정되었습니다.";
    }

    @Override
    public String delete(int review_id) throws Exception {
        reviewDAO.delete(review_id);
        return "리뷰가 성공적으로 삭제되었습니다.";
    }

    @Override
    public List<ReviewVO> listCriteria(int accommodation_id, Criteria cri) throws Exception {
        return reviewDAO.selectList(accommodation_id, cri);
    }

    @Override
    public PageMaker getPageMaker(Criteria cri, int totalCount) throws Exception {
        return new PageMaker(cri, totalCount);
    }

    @Override
    public int countByAccommodationId(int accommodation_id) throws Exception {
        return reviewDAO.countByAccommodationId(accommodation_id);
    }
}