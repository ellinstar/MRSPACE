package com.space.mem.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.space.mem.vo.MemSecurity;
import com.space.mem.vo.MemVO;

@Repository
public class MemDAOImpl implements MemDAO {
	@Autowired
	private SqlSession session;

	@Override
	public int securityInsert(MemSecurity set) {
		System.out.println("MemDAOImpl - securityInsert 메소드 호출");
		return session.insert("securityInsert", set);
	}

	@Override
	public MemSecurity securitySelect(String mem_Id) {
		System.out.println("MemDAOImpl - securitySelect 메소드 호출 - mem_Id : " + mem_Id);
		return (MemSecurity) session.selectOne("securitySelect", mem_Id);
	}

	@Override
	public int securityDelete(String mem_Id) {
		return session.delete("securityDelete", mem_Id);
	}

	@Override
	public MemVO memSelect(String mem_Id) {
		System.out.println("MemDAOImpl클래스 memSelect메소드 호출 - mem_Id : " + mem_Id);
		return (MemVO) session.selectOne("memSelect", mem_Id);
	}

	@Override
	public int memInsert(MemVO mvo) {
		System.out.println("MemDAOImpl클래스 memInsert메소드 호출");
		return session.insert("memInsert", mvo);
	}

	@Override
	public int memUpdate(MemVO mvo) {
		return session.update("memUpdate", mvo);
	}

	@Override
	public int memDelete(String mem_Id) {
		return session.delete("memDelete", mem_Id);
	}

	@Override
	public MemVO findMember(MemVO mvo) {
		return session.selectOne("findMember", mvo);
	}

	@Override
	public MemVO pwChange(MemVO mvo) {
		return session.selectOne("pwChange", mvo);

	}

	@Override
	public int pwChange2(MemVO mvo) {
		return session.update("pwChange2", mvo);
	}

	@Override
	public int securityUpdate(MemSecurity set) {
		System.out.println("MemDAOImpl - securityUpdate 메소드 호출");
        return session.update("securityUpdate",set);
	}

}