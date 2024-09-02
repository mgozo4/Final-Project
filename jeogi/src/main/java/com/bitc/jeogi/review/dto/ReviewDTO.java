package com.bitc.jeogi.review.dto;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class ReviewDTO {
    private int reviewId;
    private int accommodationId; // 숙소 ID
    private int userId; // 사용자 ID
    private int rating; // 평가 점수
    private String content; // 리뷰 내용
    private LocalDateTime createdAt; // 생성 일시
    private String userName; // 사용자 이름
}
