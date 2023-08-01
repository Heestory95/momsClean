package com.mom.admin.service.home;

import java.util.List;

import com.mom.admin.domain.Home;
import com.mom.admin.domain.PageRequest;


public interface HomeService {

	public List<Home> list(PageRequest pageRequest) throws Exception;

	public Home read(Integer referenceNo) throws Exception;
	
	// 문의 게시글 전체 건수 반환
	public int count(PageRequest pageRequest) throws Exception;
}
