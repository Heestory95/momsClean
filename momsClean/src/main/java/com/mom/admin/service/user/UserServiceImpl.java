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
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 회원리스트 반환
	@Override
	public List<User> list(PageRequest pageRequest) throws Exception{
		return mapper.list(pageRequest);
	}
	
	// 회원리스트 전체 건수 반환
	@Override
	public int count() throws Exception {
		return mapper.count();
	}
	
	// 회원 탈퇴처리 페이지
	@Override
	public User read(int userNo) throws Exception {
		return mapper.read(userNo);
	}
	
	// 탈퇴 처리
		public void modify(User user) throws Exception {
			mapper.update(user);
		}
}
