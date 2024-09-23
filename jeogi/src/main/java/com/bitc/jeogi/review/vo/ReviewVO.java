package com.bitc.jeogi.review.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
    private int review_id;          // 리뷰 ID
    private int user_id;            // 사용자 ID (정수형)
    private int accommodation_id;  // 숙소 ID (정수형)
    private int rating;            // 평점
    private String content;        // 내용
    private String images;         // 이미지
    private String created_at;     // 생성일
}
