package com.space.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.admin.page.Criteria;
import com.space.comp.vo.CompVO;
import com.space.mem.vo.MemVO;
import com.space.reserv.vo.ReservVO;
import com.space.space.vo.SpaceVO;
@Repository
public class AdminResDAO {
	@Autowired
	public SqlSession session;
	
	//메인 오늘 예약건
	public List<ReservVO> newResList(Criteria cri){
		return session.selectList("rsNewlist", cri);
	}
	//메인 오늘 예약건 페이징
	public int resCnt(Criteria cri) {
		return (Integer)session.selectOne("resCount");
	}
	//상세보기
	public ReservVO resDetail(int res_Num) {
		return session.selectOne("resDetail", res_Num);
	}
	//상세보기
	public MemVO resMem(String mem_Id) {
		return session.selectOne("resMem", mem_Id);
	}
	//상세보기
	public SpaceVO resSp(int sp_Num) {
		return session.selectOne("resSp", sp_Num);
	}
	// 업체별 옵션 불러오기
	public List<CompVO> optionCp() {
		return session.selectList("compName");
	}
	//업체별 리스트
	public List<ReservVO> cpResList(Criteria cri) {
		return session.selectList("rescplist", cri);
	}
	
	//그래프 업체별 예약수
	public List<ReservVO> graphCp(){
		return session.selectList("graphcp");
	}
}
