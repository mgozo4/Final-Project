package com.bitc.sec.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bitc.user.vo.UserVO;

public interface MemberDAO {

	// u_id 가 일치하는 사용자의 권한 목록
	@Select("SELECT u_auth FROM security_member_auth WHERE u_id = #{u_id}")
	List<String> getAuthList(String u_id) throws Exception;
	
	// u_id로 회원정보 검색
	@Select("SELECT * FROM security_member WHERE u_id = #{u_id}")
	UserVO getMemberById(String u_id) throws Exception;
	
}












