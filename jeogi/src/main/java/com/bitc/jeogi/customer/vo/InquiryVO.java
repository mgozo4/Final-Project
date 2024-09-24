package com.bitc.jeogi.customer.vo;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class InquiryVO {
    private int inquiryId;    // 문의 고유 ID
    private int userId;       // 고객 ID (외래키)
    private String title;     // 문의 제목
    private String content;   // 문의 내용
    private LocalDateTime createdAt; // 문의 작성 일시
    private String status;    // 문의 상태 (답변 대기, 답변 완료 등)
}
