package com.mom.admin.controller.home;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mom.admin.common.CodeLabelValue;
import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Pagination;
import com.mom.admin.domain.Home;
import com.mom.admin.service.home.HomeService;

@Controller

public class HomeController {

	@Autowired
	private HomeService service;

	

	@GetMapping("/")
	public String list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		 List<Home> references = service.list(pageRequest);
		model.addAttribute("list", references);

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);
		model.addAttribute("pagination", pagination);
		
		return "home";

	}

	/*
	 * // 상세 페이지
	 * 
	 * @RequestMapping(value = "/read", method = RequestMethod.GET) public void
	 * read(int referenceNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model
	 * model) throws Exception { Home home = service.read(referenceNo);
	 * 
	 * model.addAttribute(home); }
	 */
}
