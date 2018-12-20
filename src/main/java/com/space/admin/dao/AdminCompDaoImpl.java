package com.space.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.comp.vo.CompVO;
@Repository("adminCompDAO")
public class AdminCompDaoImpl implements AdminCompDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<CompVO> compList(CompVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList("compList");
	}

	@Override
	public List<CompVO> cpMainList() {
		// TODO Auto-generated method stub
		return session.selectList("cpMainList");
	}
	@Override
	public List<CompVO> cpNewList() {
		// TODO Auto-generated method stub
		return session.selectList("cpNewList");
	}

	@Override
	public CompVO compDetail(int cp_num) {
		// TODO Auto-generated method stub
		return (CompVO)session.selectOne("compDetail", cp_num);
	}

	@Override
	public int compOk(int cp_Num) {
		// TODO Auto-generated method stub
		return session.update("compOk", cp_Num);
	}
	//메일 보내기
	@Override
	public Map<String, Object> cpMail() {
		// TODO Auto-generated method stub
		
		return session.selectMap("cpMail", "key");
	}

}
