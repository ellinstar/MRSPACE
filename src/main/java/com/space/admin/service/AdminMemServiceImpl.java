package com.space.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.admin.dao.AdminMemDaoImpl;
import com.space.admin.page.Criteria;
import com.space.mem.vo.MemVO;
import com.space.reserv.vo.ReservVO;

@Service("AdminMemService")
@Transactional
public class AdminMemServiceImpl implements AdminMemService {
	
	@Autowired
	private AdminMemDaoImpl adminMemDao;
	
	@Override
	public List<MemVO> memList(Criteria cri) {
		// TODO Auto-generated method stub
		List<MemVO> memList = null;
		memList = adminMemDao.memList(cri);
		return memList;
	}

	@Override
	public int memCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adminMemDao.memCount(cri);
	}

	 // 멤버상세 구현
    @Override
    public MemVO memDetail(MemVO mvo) {
       MemVO detail = null;
       detail = adminMemDao.memDetail(mvo);
       return detail;
    }

	@Override
	public List<ReservVO> memReserv(String mem_Id) {
		List<ReservVO> res = adminMemDao.memReserv(mem_Id);
		return res;
	}

}
