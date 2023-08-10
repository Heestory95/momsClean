package com.mom;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// Spring Boot 기반의 웹 애플리케이션을 구동하기 위한 메인 애플리케이션 클래스
@SpringBootApplication
@MapperScan(basePackages = "com.mom.admin.mapper.*")
public class MomsCleanApplication {

	public static void main(String[] args) {
		SpringApplication.run(MomsCleanApplication.class, args);
	}

}