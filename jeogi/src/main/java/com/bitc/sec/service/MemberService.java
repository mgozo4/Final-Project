package com.bitc.sec.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bitc.user.dao.UserDAO;
import com.bitc.user.vo.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final UserDAO dao;
	private final PasswordEncoder encoder;
	
	
	public void join(UserVO member) throws Exception{
		// 암호화된 비밀번호 저장
		String u_pw = encoder.encode(member.getU_pw());
		member.setU_pw(u_pw);
		dao.userJoin(member);
	}
	
}












