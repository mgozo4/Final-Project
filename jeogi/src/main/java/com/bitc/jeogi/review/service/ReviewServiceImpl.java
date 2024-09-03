package com.bitc.jeogi.review.service;

import com.bitc.jeogi.review.dao.ReviewDAO;
import com.bitc.jeogi.review.dto.ReviewDTO;

import lombok.RequiredArgsConstructor;

import com.bitc.jeogi.common.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private final ReviewDAO reviewDAO;

    @Override
    public void createReview(ReviewDTO review) {
        reviewDAO.insertReview(review);
    }

    @Override
    public List<ReviewDTO> getReviewsByAccommodationId(int accommodationId, Criteria criteria) {
        return reviewDAO.selectReviewsByAccommodationId(accommodationId, criteria);
    }

    @Override
    public int getReviewCountByAccommodationId(int accommodationId) {
        return reviewDAO.countReviewsByAccommodationId(accommodationId);
    }

    @Override
    public ReviewDTO getReviewById(int reviewId) {
        return reviewDAO.selectReviewById(reviewId);
    }
}