package com.mom.admin.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.User;
import com.mom.admin.mapper.user.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 회원목록 반환
	@Override
	public List<User> list(PageRequest pageRequest) throws Exception{
		return mapper.list(pageRequest);
	}
	
	// 회원목록 전체 건수 반환
	@Override
	public int count() throws Exception {
		return mapper.count();
	}
}
