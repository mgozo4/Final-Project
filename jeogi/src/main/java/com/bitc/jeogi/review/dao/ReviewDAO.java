package com.bitc.jeogi.review.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.bitc.jeogi.review.dto.ReviewDTO;

import java.util.List;

@Repository
public interface ReviewDAO {

    @Insert("INSERT INTO review (user_id, accommodation_id, rating, content) VALUES (#{userId}, #{accommodationId}, #{rating}, #{content})")
    void insertReview(ReviewDTO review);

    @Select("SELECT r.review_id as reviewId, r.rating as rating, r.content as content, r.created_at as createdAt, u.name as userName " +
            "FROM review r " +
            "JOIN user u ON r.user_id = u.user_id " +
            "WHERE r.accommodation_id = #{accommodationId}")
    List<ReviewDTO> selectReviewsByAccommodationId(int accommodationId);

    @Select("SELECT r.review_id as reviewId, r.rating as rating, r.content as content, r.created_at as createdAt, u.name as userName " +
            "FROM review r " +
            "JOIN user u ON r.user_id = u.user_id " +
            "WHERE r.review_id = #{reviewId}")
    ReviewDTO selectReviewById(int reviewId);
}
