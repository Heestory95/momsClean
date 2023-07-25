package com.mom.admin.service.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Reserve;
import com.mom.admin.mapper.reserve.ReserveMapper;

@Service
public class ReserveServiceImpl implements ReserveService {
	@Autowired
	private ReserveMapper mapper;

	// 승인요청리스트 페이지
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 승인요청리스트 반환
	@Override
	public List<Reserve> request(PageRequest pageRequest) throws Exception {

		/*
		 * List<Reserve> reserves = mapper.request(pageRequest);
		 * 
		 * for (Reserve reserve : reserves) {
		 * 
		 * 
		 * Integer optionPrice = reserve.getReserveOptionPrice(); Integer totalPrice =
		 * optionPrice != null ? optionPrice : 0;
		 * 
		 * reserve.setReserveOptionPrice(totalPrice); }
		 * 
		 * return reserves;
		 */
		return mapper.request(pageRequest);
	}

	// 승인요청리스트 전체 건수 반환
	@Override
	public int count() throws Exception {
		return mapper.count();
	}
	
	// 승인, 승인취소 페이지
	public Reserve read(String reserveNo) throws Exception {
		return mapper.read(reserveNo);
	}
	
	// 승인처리
	public void modify(Reserve reserve) throws Exception {
		mapper.update(reserve);
	}
}
