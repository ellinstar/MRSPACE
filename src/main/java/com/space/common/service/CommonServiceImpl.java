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

	// 메인 공간 리스트 구현
	@Override
	public List<SpaceVO> mainlayoutList(SpaceVO svo) {
		List<SpaceVO> main_List = null;

		main_List = commonDao.mainlayoutList(svo);
		return main_List;
	}

	// 공간 리스트 구현
	@Override
	public List<SpaceVO> commonList(SpaceVO svo) {
		List<SpaceVO> sp_List = null;

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

	// 공간 상세 구현 리스트
	@Override
	public List<SpaceVO> dtcommonList(SpaceVO svo) {
		List<SpaceVO> cm_List = null;
		cm_List = commonDao.dtcommonList(svo);
		return cm_List;
	}

	// 업체 번호 셀렉트
	@Override
	public int cpnum(SpaceVO svo) {
		int cpnum;
		cpnum = commonDao.cpnum(svo);
		return cpnum;
	}

}
