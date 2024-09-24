package com.bitc.jeogi.customer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.jeogi.customer.vo.InquiryVO;

public interface InquiryDAO {

    @Insert("INSERT INTO inquiry (user_id, title, content, status) VALUES (#{userId}, #{title}, #{content}, #{status})")
    @Options(useGeneratedKeys = true, keyProperty = "inquiryId")
    void insertInquiry(InquiryVO inquiry);
    @Select("SELECT * FROM inquiry WHERE user_id = #{userId}")
    List<InquiryVO> getInquiriesByUserId(int userId);
    @Select("SELECT * FROM inquiry WHERE inquiry_id = #{inquiryId}")
    InquiryVO getInquiryById(int inquiryId);
    @Update("UPDATE inquiry SET status = #{status} WHERE inquiry_id = #{inquiryId}")
    void updateInquiryStatus(@Param("inquiryId") int inquiryId, @Param("status") String status);
}
