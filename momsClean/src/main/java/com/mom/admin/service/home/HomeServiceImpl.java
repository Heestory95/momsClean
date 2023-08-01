package com.mom.admin.service.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Reserve;
import com.mom.admin.domain.Home;
import com.mom.admin.mapper.home.HomeMapper;


@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	private HomeMapper mapper;

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 회원리스트 반환
	@Override
	public List<Home> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	// 상세 페이지
	public Home read(Integer referenceNo) throws Exception {
		return mapper.read(referenceNo);
	}

	// 문의 글 전체 건수 반환
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
		
	
	}
	
	@Override
	public List<Home> request(PageRequest pageRequest) throws Exception {
		return mapper.request(pageRequest);
	}
	
	@Override
	public List<Home> review(PageRequest pageRequest) throws Exception {
		return mapper.review(pageRequest);
	}


}
