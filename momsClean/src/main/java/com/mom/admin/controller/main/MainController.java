/*
 * package com.mom.admin.controller.main;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod;
 * 
 * import com.mom.admin.service.main.MainService;
 * 
 * @Controller
 * 
 * @RequestMapping public class MainController {
 * 
 * @Autowired private MainService service;
 * 
 * // 회원 목록 페이지, 관리자 권한을 가진 사용자만 접근이 가능
 * 
 * @RequestMapping(value = "/list", method = RequestMethod.GET) public void
 * list(Model model) throws Exception { model.addAttribute("list",
 * service.list()); } }
 */
