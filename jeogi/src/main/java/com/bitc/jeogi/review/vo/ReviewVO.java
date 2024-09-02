package com.bitc.jeogi.review.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO {
    private int reviewId;           // 리뷰 고유 ID
    private int accommodationId;    // 숙소 ID
    private int userId;             // 작성자 ID
    private int rating;             // 평점
    private String content;         // 리뷰 내용
    private LocalDateTime createdAt; // 리뷰 작성일시
    private String userName;        // 작성자 이름
}
