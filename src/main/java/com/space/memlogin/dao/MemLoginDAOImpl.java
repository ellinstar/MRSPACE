package com.space.memlogin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.memlogin.vo.LoginVO;

@Repository
public class MemLoginDAOImpl implements MemLoginDAO {
	@Autowired
	private SqlSession session;

	@Override
	public LoginVO mem_IdSelect(String mem_Id) {
		return (LoginVO) session.selectOne("mem_IdSelect", mem_Id);
	}

	@Override
	public LoginVO loginSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("loginSelect", lvo);
	}
	
	@Override
	public LoginVO loginSelect2(LoginVO lvo) {
		return (LoginVO) session.selectOne("loginSelect2", lvo);
	}

	@Override
	public int loginHistoryInsert(LoginVO lvo) {
		return session.insert("loginHistoryInsert", lvo);
	}

	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return session.update("loginHistoryUpdate", lvo);
	}

	@Override
	public LoginVO loginHistorySelect(String mem_Id) {
		return (LoginVO) session.selectOne("loginHistorySelect", mem_Id);
	}

}
