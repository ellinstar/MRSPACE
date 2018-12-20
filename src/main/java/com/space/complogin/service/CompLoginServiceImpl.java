package com.space.complogin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.common.util.OpenCrypt;
import com.space.comp.dao.CompDAOImpl;
import com.space.comp.vo.CompSecurity;
import com.space.complogin.dao.CompLoginDAOImpl;
import com.space.complogin.vo.CompLoginVO;

@Service
@Transactional
public class CompLoginServiceImpl implements CompLoginService {
	@Autowired
	private CompLoginDAOImpl lDao;

	@Autowired
	private CompDAOImpl compDao;

	@Override
	public CompLoginVO cp_IdSelect(String cp_Id) {
		return lDao.cp_IdSelect(cp_Id);
	}

	@Override
	public CompLoginVO compLoginSelect(String cp_Id, String cp_Pw) {
		CompLoginVO vo = null;
		CompSecurity sec = compDao.securitySelect(cp_Id);
		System.out.println("compLoginSelect 아이디 : " + cp_Id);
		System.out.println("compLoginSelect 비밀번호 : " + cp_Pw);
		//System.out.println("sec.getSalt() : " + sec.getSalt());
		if (sec != null) {
			cp_Pw = new String(OpenCrypt.getSHA256(cp_Pw, sec.getSalt()));
			CompLoginVO lvo = new CompLoginVO();
			lvo.setCp_Id(cp_Id);
			lvo.setCp_Pw(cp_Pw);
			System.out.println("비밀번호 : " + cp_Pw);

			vo = lDao.compLoginSelect(lvo);
		}
		return vo;
	}

	@Override
	public int compLoginHistoryInsert(CompLoginVO lvo) {
		int result;
		CompLoginVO kvo = new CompLoginVO();
		kvo.setCp_Id(lvo.getCp_Id());
		if (cp_IdSelect(kvo.getCp_Id()) == null) {
			result = 1;
		} else {
			CompLoginVO vo = compLoginHistorySelect(lvo.getCp_Id());
			if (vo == null) {
				
				lDao.compLoginHistoryInsert(lvo);
			}
			result = 2;
		}
		return result;
	}

	@Override
	public int compLoginHistoryUpdate(CompLoginVO lvo) {
		return lDao.compLoginHistoryUpdate(lvo);
	}

	@Override
	public CompLoginVO compLoginHistorySelect(String cp_Id) {
		return lDao.compLoginHistorySelect(cp_Id);
	}

}
