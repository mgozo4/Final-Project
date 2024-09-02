package com.bitc.jeogi.review.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private int userId;       // 사용자 고유 ID
    private String id;        // 사용자 ID
    private String email;      // 사용자 이메일
    private String password;   // 사용자 비밀번호
    private String name;       // 사용자 이름
    private String phone;      // 사용자 전화번호
    private String type;       // 사용자 유형 ('사용자', '관리자')
}
