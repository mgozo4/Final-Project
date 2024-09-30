package com.bitc.sec.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.bitc.sec.dao.MemberDAO;
import com.bitc.user.vo.UserVO;

public class CustomUserDetailService implements UserDetailsService{
	
	@Autowired
	private MemberDAO dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO vo = null;
		try {
			vo = dao.getMemberById(username);
			if(vo != null) {
				vo.setAuthList(dao.getAuthList(username));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo == null ? null : new CustomUser(vo);
	}

}
















