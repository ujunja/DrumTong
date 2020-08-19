package com.drumtong.customer.dao;

import org.springframework.stereotype.Repository;

import com.drumtong.customer.vo.CPrivateDataVO;

public interface CPrivateDataDAO {

	// 고객 회원가입
	int insertSignUp(CPrivateDataVO vo);
	
	// 아이디, 비밀번호 체크
	CPrivateDataVO selectUser(String securePassword);

	String selectID(String memberID);

	
//	=========================================== REST ================================================================
//	(REST) 아이디 중복 검사 
	int useridDupl(String id);
	
}
