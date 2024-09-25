package com.bitc.jeogi.customer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.bitc.jeogi.customer.vo.InquiryVO;


public interface InquiryDAO {

    @Insert(" INSERT INTO inquiries (user_id, title, content, created_at, status) "
    		+ "VALUES (#{user_id}, #{title}, #{content}, NOW(), #{status})")
    // 문의 제출
    void insertInquiry(InquiryVO inquiry);


    @Select("SELECT * FROM inquiries WHERE inquiry_id = #{inquiry_id}")
    // 문의 ID로 조회
    InquiryVO selectInquiryById(int inquiry_id);
    @Select(" SELECT * FROM inquiries WHERE user_id = #{user_id}")
 // 사용자 ID로 문의 목록 조회
    List<InquiryVO> selectInquiriesByUserId(int user_id);
    @Select("SELECT * FROM inquiries")
    // 모든 문의 목록 조회
    List<InquiryVO> selectAllInquiries();
    @Update(" UPDATE inquiries SET status = #{status} WHERE inquiry_id = #{inquiry_id}")
    // 문의 상태 업데이트
    void updateInquiryStatus(int inquiry_id, String status);
}
