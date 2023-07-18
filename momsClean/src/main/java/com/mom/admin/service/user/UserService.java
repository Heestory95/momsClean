package com.mom.admin.service.user;

import java.util.List;

import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.User;

public interface UserService {

	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 회원목록 반환
	public List<User> list(PageRequest pageRequest) throws Exception;

	// 회원목록 전체 건수 반환
	public int count() throws Exception;
}
