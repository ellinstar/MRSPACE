package com.space.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.common.dao.CommonDAOImpl;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;
@Log
@Service("CommonService")
@Transactional
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDAOImpl commonDao;

	// 글목록 구현
	@Override
	public List<SpaceVO> commonList(SpaceVO svo) {
		List<SpaceVO> sp_List = null;

		// 정렬에 대한 기본값 설정
		/*
		 * if(svo.getOrder_by()==null) { svo.setOrder_by("sp_Num"); }
		 * if(svo.getOrder_sc()==null) { svo.setOrder_sc("DESC"); }
		 */
		sp_List = commonDao.commonList(svo);
		return sp_List;
	}

	@Override
	public int commonListCnt(SpaceVO svo) {
		return commonDao.commonListCnt(svo);
	}

	// 공간 상세 구현
	@Override
	public SpaceVO commonDetail(SpaceVO svo) {
		log.info("ComServiceImpl 공간상세 호출!");
		SpaceVO detail = null;
		detail = commonDao.commonDetail(svo);
		return detail;
	}
}
