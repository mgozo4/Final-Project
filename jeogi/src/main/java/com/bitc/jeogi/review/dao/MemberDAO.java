package com.bitc.jeogi.review.dao;

import com.bitc.jeogi.review.dto.MemberDTO;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MemberDAO {

    @Select("SELECT * FROM user WHERE id = #{id}")
    MemberDTO findById(@Param("id") String id);

    @Select("SELECT * FROM user WHERE email = #{email}")
    MemberDTO findByEmail(@Param("email") String email);

    @Select("SELECT * FROM user WHERE user_id = #{userId}")
    MemberDTO getMemberById(@Param("userId") int userId);

    @Insert("INSERT INTO user (id, email, password, name, phone, type) " +
            "VALUES (#{id}, #{email}, #{password}, #{name}, #{phone}, #{type})")
    @Options(useGeneratedKeys = true, keyProperty = "userId")
    int insertMember(MemberDTO member);

    @Update("UPDATE user SET email=#{email}, password=#{password}, name=#{name}, " +
            "phone=#{phone}, type=#{type} WHERE user_id = #{userId}")
    int updateMember(MemberDTO member);
}
