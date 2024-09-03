package com.bitc.jeogi.review.service;

import com.bitc.jeogi.review.dao.MemberDAO;
import com.bitc.jeogi.review.dao.ReviewDAO;
import com.bitc.jeogi.review.dto.MemberDTO;
import com.bitc.jeogi.review.service.MemberService;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberDAO memberDAO;

 
    @Override
    public MemberDTO login(String id, String password) {
        MemberDTO member = memberDAO.findById(id);
        if (member != null && member.getPassword().equals(password)) {
            return member;
        }
        return null;
    }

    @Override
    public void updateMember(MemberDTO member) {
        memberDAO.updateMember(member);
    }

    @Override
    public MemberDTO getMemberById(int userId) {
        return memberDAO.getMemberById(userId);
    }

    @Override
    public boolean registerMember(MemberDTO member) {
        memberDAO.insertMember(member);
		return false;
    }
}
