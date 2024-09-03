package com.bitc.jeogi.review.service;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.review.dto.ReviewDTO;
import java.util.List;
public interface ReviewService {
    
    /**
     * 새로운 리뷰를 작성합니다.
     * @param review 작성할 리뷰 DTO
     */
    void createReview(ReviewDTO review);
    
    /**
     * 숙소 ID를 기준으로 리뷰 목록을 가져옵니다.
     * @param accommodationId 숙소 ID
     * @param offset 페이지 시작 인덱스
     * @param limit 페이지 크기
     * @return 리뷰 목록
     */
    List<ReviewDTO> getReviewsByAccommodationId(int accommodationId, Criteria criteria);
    
    /**
     * 숙소 ID를 기준으로 리뷰 개수를 가져옵니다.
     * @param accommodationId 숙소 ID
     * @return 리뷰 개수
     */
    int getReviewCountByAccommodationId(int accommodationId);
    
    /**
     * 리뷰 ID를 기준으로 리뷰를 가져옵니다.
     * @param reviewId 리뷰 ID
     * @return 리뷰 DTO
     */
    ReviewDTO getReviewById(int reviewId);
}