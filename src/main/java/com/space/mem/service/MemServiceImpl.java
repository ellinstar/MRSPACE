package com.space.mem.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.client.util.OpenCrypt;
import com.space.client.util.Util;
import com.space.mem.dao.MemDAO;
import com.space.mem.vo.MemSecurity;
import com.space.mem.vo.MemVO;
import com.space.reserv.vo.ReservVO;

@Service
@Transactional
public class MemServiceImpl implements MemService {

	@Resource(name = "memDAO")
	private MemDAO memDAO;

	// 아이디 중복확인
	@Override
	public int memIdConfirm(String mem_Id) {
		System.out.println("MemServiceImpl클래스  memIdConfirm메소드 호출 - mem_Id : " + mem_Id);

		int result;
		if (memDAO.memSelect(mem_Id) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public MemVO memSelect(String mem_Id) {

		MemVO vo = memDAO.memSelect(mem_Id);
		return vo;
	}

	// 회원 가입
	@Override
	public int memInsert(MemVO mvo) {
		System.out.println("MemServiceImpl클래스 memInsert메소드 호출");
		int sCode = 2;
		if (memDAO.memSelect(mvo.getMem_Id()) != null) {
			return 1;
		} else {
			try {
				MemSecurity sec = new MemSecurity();
				sec.setMem_Id(mvo.getMem_Id());
				sec.setSalt(Util.getRandomString());
				sCode = memDAO.securityInsert(sec);

				if (sCode == 1) {
					mvo.setMem_Pw(new String(OpenCrypt.getSHA256(mvo.getMem_Pw(), sec.getSalt())));
					memDAO.memInsert(mvo);
					return 3;
				} else {
					return 2;
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				return 2;
			}
		}

	}

	// 회원 수정
	@Override
	public boolean memUpdate(MemVO mvo) {
		try {
			if (!mvo.getMem_Pw().isEmpty()) {
				MemSecurity sec = memDAO.securitySelect(mvo.getMem_Id());
				mvo.setMem_Pw(new String(OpenCrypt.getSHA256(mvo.getMem_Pw(), sec.getSalt())));
			}
			memDAO.memUpdate(mvo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	// 회원 탈퇴
	@Override
	public int memDelete(String mem_Id) {
		int mCode, isSucessCode = 2;
		try {
			mCode = memDAO.memDelete(mem_Id);
			if (mCode == 1) {
				isSucessCode = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			isSucessCode = 2;
		}
		return isSucessCode;
	}

	// 아이디 찾기
	@Override
	public MemVO findMember(MemVO mvo) {
		System.out.println("MemServiceImpl클래스 findMember메소드 호출");
		MemVO vo = memDAO.findMember(mvo);

		return vo;
	}
	// 비밀번호 찾기에서 맴버 확인
	@Override
	public MemVO pwChange(MemVO mvo) {
		System.out.println("MemServiceImpl클래스 pwChange메소드 호출");
		MemVO vo = memDAO.pwChange(mvo);

		return vo;
	}
	// 비밀번호 변경
	@Override
	public int pwChange2(MemVO mvo) {
		System.out.println("MemServiceImpl클래스 pwChange2메소드 호출");
		MemSecurity sec = new MemSecurity();
		sec.setMem_Id(mvo.getMem_Id());
		sec.setSalt(Util.getRandomString());
		memDAO.securityUpdate(sec);
		mvo.setMem_Pw(new String(OpenCrypt.getSHA256(mvo.getMem_Pw(), sec.getSalt())));
		int result = memDAO.pwChange2(mvo);
		return result;
	}

	// 예약 리스트 구현
	@Override
	public List<ReservVO> reservList(MemVO mvo) {
		List<ReservVO> reservList = null;
		reservList = memDAO.reservList(mvo);
		return reservList;
	}

	@Override
	public void updateState() {
		memDAO.updateState();
	}
	
}