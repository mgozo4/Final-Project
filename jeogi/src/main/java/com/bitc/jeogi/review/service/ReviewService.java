package com.bitc.jeogi.review.service;

import com.bitc.jeogi.review.dto.ReviewDTO;
import java.util.List;

public interface ReviewService {
    void createReview(ReviewDTO review);
    List<ReviewDTO> getReviewsByAccommodationId(int accommodationId);
    ReviewDTO getReviewById(int reviewId);
}
