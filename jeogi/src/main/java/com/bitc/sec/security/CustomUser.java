package com.bitc.sec.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.bitc.user.vo.UserVO;

import lombok.Getter;

public class CustomUser extends User{

	@Getter
	private UserVO member;

	public CustomUser(UserVO member) {
		super(member.getU_id(), member.getU_pw(), authorities(member.getAuthList()));
		this.member = member;
	}
	
	public static Collection<? extends GrantedAuthority> authorities(List<String> authList){
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(String s : authList) {
			authorities.add(new SimpleGrantedAuthority(s));
		}
		return authorities;
	}
	

}










