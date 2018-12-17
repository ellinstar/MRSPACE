package com.space.space.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.space.dao.SpaceDAO;
import com.space.space.vo.SpaceVO;


@Service
@Transactional
public class SpaceServiceImpl implements SpaceService{

	@Autowired
	private SpaceDAO spaceDao;
	
	
	//공간 등록 구현
	@Override
	public int spaceInsert(SpaceVO svo) {
		int result = 0;
		System.out.println("spaceService : " + svo.getSp_Name());
		try{
			result = spaceDao.spaceInsert(svo);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
