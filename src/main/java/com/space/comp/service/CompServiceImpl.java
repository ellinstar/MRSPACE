package com.space.comp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.common.util.OpenCrypt;
import com.space.common.util.Util;
import com.space.comp.dao.CompDAOImpl;
import com.space.comp.vo.CompSecurity;
import com.space.comp.vo.CompVO;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class CompServiceImpl implements CompService {

	@Autowired
	private CompDAOImpl compDao;

	@Override
	public int compInsert(CompVO cvo) {
		int sCode = 2;
		if (compDao.compSelect(cvo.getCp_Id()) != null) {
			return 1;
		} else {
			try {
				CompSecurity sec = new CompSecurity();
				sec.setCp_Id(cvo.getCp_Id());
				sec.setSalt(Util.getRandomString());
				sCode = compDao.compsecurityInsert(sec);

				if (sCode == 1) {
					cvo.setCp_Pw(new String(OpenCrypt.getSHA256(cvo.getCp_Pw(), sec.getSalt())));
					compDao.compInsert(cvo);
					return 3;
				} else {
					return 2;
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				return 2;
			}
		}
		/*
		 * int result = compDao.compInsert(cvo); return result;
		 */
	}

	@Override
	public CompVO compSelect(String cp_Id) {
		CompVO cvo = compDao.compSelect(cp_Id);
		return cvo;
	}

	@Override
	public CompVO compSelect2(String cp_Bnum) {
		CompVO cvo = compDao.compSelect2(cp_Bnum);
		return cvo;
	}

	@Override
	public int cp_idConfirm(String cp_id) {
		int result = 0;
		CompVO cvo = compDao.compSelect(cp_id);
		if (cvo != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public int cp_BnumConfirm(String cp_Bnum) {
		int result = 0;
		CompVO cvo = compDao.compSelect2(cp_Bnum);
		if (cvo != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public boolean compUpdate(CompVO cvo) {
		// TODO Auto-generated method stub
		return false;
	}

	// 아이디 찾기
	@Override
	public CompVO findComp(CompVO cvo) {
		System.out.println("CompServiceImpl클래스 findComp 메소드 호출");
		CompVO vo = compDao.findComp(cvo);
		return vo;
	}

	// 비밀번호 변경할 회원정보 확인
	@Override
	public CompVO compPwChange(CompVO cvo) {
		System.out.println("CompServiceImpl클래스 compPwChange 메소드 호출");
		CompVO vo = compDao.compPwChange(cvo);
		return vo;
	}

	@Override
	public int compPwChange2(CompVO cvo) {
		System.out.println("CompServiceImpl클래스 compPwChange2 메소드 호출");
		CompSecurity sec = new CompSecurity();
		sec.setCp_Id(cvo.getCp_Id());
		sec.setSalt(Util.getRandomString());
		compDao.compSecurityUpdate(sec);
		cvo.setCp_Pw(new String(OpenCrypt.getSHA256(cvo.getCp_Pw(), sec.getSalt())));
		int result = compDao.compPwChange2(cvo);
		System.out.println("서비스 : " + result);
		return result;
	}

}
