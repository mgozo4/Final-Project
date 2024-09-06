package com.bitc.jeogi.review.service;

import com.bitc.jeogi.review.dto.MemberDTO;

public interface MemberService {
    MemberDTO login(String id, String password);
    void updateMember(MemberDTO member);
    MemberDTO getMemberById(int user_id);
    boolean registerMember(MemberDTO member);
}
