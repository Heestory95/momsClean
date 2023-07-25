package com.mom.admin.service.reserve;

import java.util.List;

import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Reserve;
import com.mom.admin.domain.User;

public interface ReserveService {

	// 승인요청리스트 페이지
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 승인요청리스트 반환
	public List<Reserve> request(PageRequest pageRequest) throws Exception;

	// 승인요청리스트 전체 건수 반환
	public int count() throws Exception;

	// 승인, 승인취소 페이지
	public Reserve read(String reserveNo) throws Exception;

	// 승인처리
	public void modify(Reserve reserve) throws Exception;
}
