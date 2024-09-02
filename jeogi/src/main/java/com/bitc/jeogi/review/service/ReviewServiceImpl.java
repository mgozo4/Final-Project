package com.bitc.jeogi.review.service;

import com.bitc.jeogi.review.dto.ReviewDTO;

import lombok.RequiredArgsConstructor;

import com.bitc.jeogi.review.dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{

    private final ReviewDAO reviewDAO;
    public void createReview(ReviewDTO review) {
        reviewDAO.insertReview(review);
    }

    public List<ReviewDTO> getReviewsByAccommodationId(int accommodationId) {
        return reviewDAO.selectReviewsByAccommodationId(accommodationId);
    }

    public ReviewDTO getReviewById(int reviewId) {
        return reviewDAO.selectReviewById(reviewId);
    }
}
