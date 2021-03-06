package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BPaymentVO;

public interface BImageDAO {
	List<BImageVO> selectImageList(String estid);

	// 매장사진 테이블에  {저장이미지}를 업데이트 시켜준다.
	int insertConstract(BImageVO bImageVO);

	int confirm(String SerialUUID);

}
