package com.mom.admin.controller.home;

import java.text.DateFormat;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;



import com.mom.admin.domain.PageRequest;

import com.mom.admin.domain.Home;
import com.mom.admin.service.home.HomeService;

@Controller

public class HomeController {

	@Autowired
	private HomeService service;

	

	@GetMapping("/")
	public String list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		PageRequest mainPageRequest = new PageRequest();
		mainPageRequest.setSizePerPage(5);
		 List<Home> references = service.list(mainPageRequest);
		model.addAttribute("list", references);
		model.addAttribute("request", service.request(mainPageRequest));
		model.addAttribute("review", service.review(mainPageRequest));
		
		return "home";

	}

}
