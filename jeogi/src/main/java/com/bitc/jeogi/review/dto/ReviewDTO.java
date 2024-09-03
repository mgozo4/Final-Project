package com.bitc.jeogi.review.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class ReviewDTO {
    private int reviewId;
    private int userId;
    private int accommodationId;
    private int rating;
    private String content;
    private LocalDateTime createdAt;
    private String images; 
}