package com.space.space.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.space.dao.SpaceDAOImpl;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class SpaceServiceImpl implements SpaceService {

	@Autowired
	private SpaceDAOImpl spaceDao;

	// 공간 등록 구현
	@Override
	public int spaceInsert(SpaceVO svo) {
		int result = 0;
		try {

			result = spaceDao.spaceInsert(svo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int spaceListCnt(SpaceVO svo) {
		return spaceDao.spaceListCnt(svo);
	}

	// 글목록 구현
	@Override
	public List<SpaceVO> spaceList(SpaceVO svo) {
		List<SpaceVO> sp_List = null;

		// 정렬에 대한 기본값 설정
		if (svo.getOrder_by() == null) {
			svo.setOrder_by("sp_Num");
		}
		if (svo.getOrder_sc() == null) {
			svo.setOrder_sc("DESC");
		}
		sp_List = spaceDao.spaceList(svo);
		return sp_List;
	}

	public void spaceModify(SpaceVO svo) {
		spaceDao.spaceModify(svo);
	}

	


}
