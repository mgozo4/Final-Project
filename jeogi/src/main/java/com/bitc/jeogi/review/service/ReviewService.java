package com.bitc.jeogi.review.service;

import java.util.List;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.vo.ReviewVO;

public interface ReviewService {
	void write(ReviewVO review) throws Exception;
    ReviewVO detail(int review_id) throws Exception;
    String update(ReviewVO review) throws Exception;
    String delete(int review_id) throws Exception;
    List<ReviewVO> listCriteria(Criteria cri) throws Exception;
    PageMaker getPageMaker(Criteria cri, int totalCount) throws Exception;
    int countByAccommodationId() throws Exception;
	List<ReviewVO> getAllList();
	ReviewVO findMemberId(int review_id);
	ReviewVO getById(int review_id);
	int getTotalCount();
	List<ReviewVO> getPageReview(Criteria cri); 
}