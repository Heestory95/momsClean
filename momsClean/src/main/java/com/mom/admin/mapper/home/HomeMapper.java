package com.mom.admin.mapper.home;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mom.admin.domain.Home;
import com.mom.admin.domain.PageRequest;

@Mapper
public interface HomeMapper {

	public List<Home> list(PageRequest pageRequest) throws Exception;

	public Home read(Integer referenceNo) throws Exception;


	// 회원리스트 전체 건수 반환
	public int count(PageRequest pageRequest) throws Exception;

	public List<Home> request(PageRequest pageRequest) throws Exception;

	public List<Home> review(PageRequest pageRequest) throws Exception;

	//총 예약완료, 예약취소 전체 건수 반환
	public int reserveCount(Home home) throws Exception;

	public int cancelCount(Home home) throws Exception;

	// 상품판매율 통계에 필요한 총 상품 판매율 전체 건수 반환
	// 1번부터 순서대로 A세트~F세트
	public int itemCount1(Home home) throws Exception;
	public int itemCount2(Home home) throws Exception;
	public int itemCount3(Home home) throws Exception;
	public int itemCount4(Home home) throws Exception;
	public int itemCount5(Home home) throws Exception;
	public int itemCount6(Home home) throws Exception;

}
