package com.space.memlogin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.client.util.OpenCrypt;
import com.space.mem.dao.MemDAO;
import com.space.mem.vo.MemSecurity;
import com.space.memlogin.dao.MemLoginDAO;
import com.space.memlogin.vo.LoginVO;

@Service
@Transactional
public class MemLoginServiceImpl implements MemLoginService {
	
	@Resource(name="memLoginDAO")
	private MemLoginDAO lDao;
	
	@Resource(name="memDAO")
	private MemDAO memDao;

	@Override
	public LoginVO mem_IdSelect(String mem_Id) {
		return lDao.mem_IdSelect(mem_Id);
	}

	@Override
	public LoginVO loginSelect(String mem_Id, String mem_Pw) {
		LoginVO vo = null;
		MemSecurity sec = memDao.securitySelect(mem_Id);
		System.out.println("아이디 :"  + mem_Id);
		System.out.println("sec.getSalt() : " + sec.getSalt());
		System.out.println("mem_Pw : " + mem_Pw);
		if (sec != null) {
			System.out.println("sec.getSalt() : " + sec.getSalt());
			mem_Pw = new String(OpenCrypt.getSHA256(mem_Pw, sec.getSalt()));
			System.out.println("sec.getSalt() : " + sec.getSalt());
			LoginVO lvo = new LoginVO();
			lvo.setMem_Id(mem_Id);
			lvo.setMem_Pw(mem_Pw);
			System.out.println("비밀번호" + mem_Pw);

			vo = lDao.loginSelect(lvo);
		}
		return vo;
	}
	
	@Override
	public LoginVO loginSelect2(String mem_Id) {
		LoginVO vo = null;
		MemSecurity sec = memDao.securitySelect(mem_Id);
		if (sec != null) {
			LoginVO lvo = new LoginVO();
			lvo.setMem_Id(mem_Id);

			vo = lDao.loginSelect2(lvo);
		}
		return vo;
	}

	@Override
	public int loginHistoryInsert(LoginVO lvo) {
		int result;
		if (mem_IdSelect(lvo.getMem_Id()) == null) {
			System.out.println("asdasd :"+lvo.getMem_Id());
			result = 1;
		} else {
			LoginVO vo = loginHistorySelect(lvo.getMem_Id());
			System.out.println("asdasd2 : "+lvo.getMem_Id());
			if (vo == null) {
				lDao.loginHistoryInsert(lvo);
			}
			result = 2;
		}
		return result;
	}

	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return lDao.loginHistoryUpdate(lvo);
	}

	@Override
	public LoginVO loginHistorySelect(String mem_Id) {
		return lDao.loginHistorySelect(mem_Id);
	}

}
