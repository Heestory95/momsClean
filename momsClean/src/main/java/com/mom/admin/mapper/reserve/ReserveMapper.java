package com.mom.admin.mapper.reserve;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Reserve;

@Mapper
public interface ReserveMapper {

	// 승인요청리스트 페이지
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 승인요청리스트 반환
	public List<Reserve> request(PageRequest pageRequest) throws Exception;

	// 승인요청리스트 전체 건수 반환
	public int count() throws Exception;

}
