package com.bitc.jeogi.review.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import com.bitc.jeogi.review.dto.ReviewDTO;
import com.bitc.jeogi.common.util.Criteria;

import java.util.List;

@Mapper
public interface ReviewDAO {

    @Insert("INSERT INTO review (user_id, accommodation_id, rating, content, images, created_at) " +
            "VALUES (#{userId}, #{accommodationId}, #{rating}, #{content}, #{images}, NOW())")
    void insertReview(ReviewDTO review);

    @Select("SELECT * FROM review WHERE accommodation_id = #{accommodationId} " +
            "ORDER BY created_at DESC LIMIT #{criteria.startRow}, #{criteria.perPageNum}")
    List<ReviewDTO> selectReviewsByAccommodationId( int accommodationId,Criteria criteria);

    @Select("SELECT * FROM review WHERE review_id = #{reviewId}")
    ReviewDTO selectReviewById(int reviewId);

    @Select("SELECT COUNT(*) FROM review WHERE accommodation_id = #{accommodationId}")
    int countReviewsByAccommodationId(int accommodationId);
}