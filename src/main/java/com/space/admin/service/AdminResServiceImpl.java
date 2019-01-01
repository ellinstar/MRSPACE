package com.space.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.space.admin.dao.AdminResDAO;
import com.space.admin.page.Criteria;
import com.space.comp.vo.CompVO;
import com.space.mem.vo.MemVO;
import com.space.reserv.vo.ReservVO;
import com.space.space.vo.SpaceVO;
@Service
public class AdminResServiceImpl implements AdminResService {
	
	@Autowired
	public AdminResDAO adResDAO;

	@Override
	public List<ReservVO> getNewList(Criteria cri) {
		// TODO Auto-generated method stub
		List<ReservVO> list = adResDAO.newResList(cri);
		return list;
	}
	@Override
	public int resCnt(Criteria cri) {
		// TODO Auto-generated method stub
		
		return adResDAO.resCnt(cri);
	}

	@Override
	public ReservVO resDetail(int res_Num) {
		// TODO Auto-generated method stub
		return adResDAO.resDetail(res_Num);
	}

	@Override
	public MemVO resMem(String mem_Id) {
		// TODO Auto-generated method stub
		return adResDAO.resMem(mem_Id);
	}

	@Override
	public SpaceVO resSp(int sp_Num) {
		// TODO Auto-generated method stub
		return adResDAO.resSp(sp_Num);
	}
	@Override
	public List<CompVO> optionCp() {
		// TODO Auto-generated method stub
		return adResDAO.optionCp();
	}
	@Override
	public List<ReservVO> cpResList(Criteria cri) {
		// TODO Auto-generated method stub
		return adResDAO.cpResList(cri);
	}

	

}
