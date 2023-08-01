package com.mom.admin.service.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.admin.domain.Home;
import com.mom.admin.domain.PageRequest;
import com.mom.admin.mapper.home.HomeMapper;

@Service
public class HomeServiceImpl implements HomeService {

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

	// 총 예약완료, 예약취소 전체 건수 반환
	@Override
	public int reserveCount(Home home) throws Exception {
		return mapper.reserveCount(home);
	}
	
	@Override
	public int cancelCount(Home home) throws Exception {
		return mapper.cancelCount(home);
	}
	
	// 상품판매율 통계에 필요한 총 상품 판매율 전체 건수 반환
	// 1번부터 순서대로 A세트~F세트
	public int itemCount1(Home home) throws Exception {
		return mapper.itemCount1(home);
	}
	public int itemCount2(Home home) throws Exception {
		return mapper.itemCount2(home);
	}
	public int itemCount3(Home home) throws Exception {
		return mapper.itemCount3(home);
	}
	public int itemCount4(Home home) throws Exception {
		return mapper.itemCount4(home);
	}
	public int itemCount5(Home home) throws Exception {
		return mapper.itemCount5(home);
	}
	public int itemCount6(Home home) throws Exception {
		return mapper.itemCount6(home);
	}
}
