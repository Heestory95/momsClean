package com.mom.admin.mapper.home;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Home;

@Mapper
public interface HomeMapper {
	
public List<Home> list(PageRequest pageRequest) throws Exception;

public Home read(Integer referenceNo) throws Exception;

// 회원리스트 전체 건수 반환
public int count(PageRequest pageRequest) throws Exception;

public List<Home> request(PageRequest pageRequest) throws Exception;

public List<Home> review(PageRequest pageRequest) throws Exception;
}
