package com.space.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.admin.dao.AdminCompDAO;
import com.space.comp.vo.CompVO;

@Service("AdminCompService")
@Transactional
public class AdminCompServiceImpl implements AdminCompService {
	
	@Resource(name="adminCompDAO")
	private AdminCompDAO adminCompDao;

	@Override
	public List<CompVO> compList(CompVO cvo) {
		// TODO Auto-generated method stub
		List<CompVO> compList = null;
		compList = adminCompDao.compList(cvo);
		return compList;
	}

	@Override
	public List<CompVO> cpMainList() {
		// TODO Auto-generated method stub
		List<CompVO> cpMainList = adminCompDao.cpMainList();
		return cpMainList;
	}

	@Override
	public CompVO compDetail(int cp_num) {
		// TODO Auto-generated method stub
		CompVO detail = adminCompDao.compDetail(cp_num);
		return detail;
	}

}
