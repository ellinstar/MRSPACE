package com.space.reserv.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.space.reserv.dao.ReservDAOImpl;
import com.space.reserv.vo.ReservVO;
import com.space.space.vo.SpaceVO;

import lombok.extern.java.Log;

@Service
@Transactional
@Log
public class ReservServiceImpl implements ReservService {

	@Autowired
	private ReservDAOImpl rdao;

	// 예약 실행
	@Override
	public int reservation(ReservVO rvo) {

		SpaceVO svo = rdao.spaceResert(rvo);
		SpaceVO ssvo = svo;
		ssvo.setResUseDate(rvo.getResUseDate());
		if (svo.getSp_Stock() <= 0) {
			return 2;
		} else {
			
			int useSpace = rdao.useSpace(ssvo);
			System.out.println("유즈스페이스 수 : " + useSpace);
			if (useSpace < svo.getSp_Stock()) {
				int success = rdao.reservation(rvo);

				if (success == 1) {
					// 예약 성공
					return 1;
				} else {
					// 예약 실패
					return 0;
				}
			}else {
				return 3;
			}

		}

	}

}
