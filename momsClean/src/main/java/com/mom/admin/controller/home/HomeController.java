package com.mom.admin.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mom.admin.domain.Home;
import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Reserve;
import com.mom.admin.service.home.HomeService;

@Controller

public class HomeController {

	@Autowired
	private HomeService service;

	@GetMapping("/")
	public String list(Home home, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		List<Home> references = service.list(pageRequest);
		model.addAttribute("list", references);
		int reserveCount = service.reserveCount(home);
		int cancelCount = service.cancelCount(home);
		int itemCount1 = service.itemCount1(home);
		int itemCount2 = service.itemCount2(home);
		int itemCount3 = service.itemCount3(home);
		int itemCount4 = service.itemCount4(home);
		int itemCount5 = service.itemCount5(home);
		int itemCount6 = service.itemCount6(home);
		model.addAttribute("reserveCount", reserveCount);
		model.addAttribute("cancelCount", cancelCount);
		model.addAttribute("itemCount1", itemCount1);
		model.addAttribute("itemCount2", itemCount2);
		model.addAttribute("itemCount3", itemCount3);
		model.addAttribute("itemCount4", itemCount4);
		model.addAttribute("itemCount5", itemCount5);
		model.addAttribute("itemCount6", itemCount6);
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
