package com.mom;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

// Spring Boot 애플리케이션을 외부 서블릿 컨테이너에서 실행하기 위한 초기화 설정
public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(MomsCleanApplication.class);
	}

}
