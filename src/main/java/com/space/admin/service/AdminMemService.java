package com.space.admin.service;

import java.util.List;

import com.space.admin.page.Criteria;
import com.space.mem.vo.MemVO;

public interface AdminMemService {
	public List<MemVO> memList(Criteria cri);
	public int memCount(Criteria cri);
	public MemVO memDetail(MemVO bvo);
}
