package com.mom.admin.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Pagination;
import com.mom.admin.domain.User;
import com.mom.admin.service.user.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserController {
	@Autowired
	private UserService service;
	
	
	// 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달
	@GetMapping("/list")
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("list", service.list(pageRequest));
		
		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(service.count());
		model.addAttribute("pagination", pagination);
	}
	
	
	// 회원 탈퇴처리 페이지
	@GetMapping("/modify")
	public String modifyForm(int userNo, Model model) throws Exception {
		User user = service.read(userNo);
		model.addAttribute(user);
		return "admin/user/modify";
	}
	
	// 회원 탈퇴 처리
	@PostMapping("/modify")
	public String modify(User user, RedirectAttributes rttr) throws Exception {
		service.modify(user);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/user/list";
	}
}
