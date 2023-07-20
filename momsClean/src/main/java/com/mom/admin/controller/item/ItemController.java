package com.mom.admin.controller.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mom.admin.domain.Item;
import com.mom.admin.service.item.ItemService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/item")
public class ItemController {

	@Autowired
	private ItemService ItemService;

	// 상품 등록 페이지
	@RequestMapping(value = "/itemRegister", method = RequestMethod.GET)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String registerForm(Model model) {
		model.addAttribute(new Item());

		return "/admin/item/itemRegister";
	}
	
	// 상품 등록 처리
	@RequestMapping(value = "/itemRegister", method = RequestMethod.POST)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(Item item, RedirectAttributes rttr) throws Exception {

		ItemService.register(item);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/item/list";
	}
	// 옵션 등록 페이지
	@RequestMapping(value = "/optionRegister", method = RequestMethod.GET)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String optionRegisterForm(Model model) {
		model.addAttribute(new Item());

		return "/admin/item/optionRegister";
	}
	// 옵션 등록 처리
	@RequestMapping(value = "/optionRegister", method = RequestMethod.POST)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String optionRegister(Item item, RedirectAttributes rttr) throws Exception {

		ItemService.optionRegister(item);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/item/list";
	}

	
	
	
	
	
	// 상품 목록 페이지
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		List<Item> itemList = ItemService.list();
		List<Item> itemList2 = ItemService.list2();

		model.addAttribute("itemList2", itemList2);
		model.addAttribute("itemList", itemList);
	}

	
	// 상품 수정 페이지
	@RequestMapping(value = "/itemModify", method = RequestMethod.GET)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modifyForm(String itemNo, Model model) throws Exception {
		Item item = ItemService.read(itemNo);

		model.addAttribute(item);

		return "/admin/item/itemModify";
	}
	// 옵션 수정 페이지
	@RequestMapping(value = "/optionModify", method = RequestMethod.GET)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String optionModifyForm(String itemName, Model model) throws Exception {
		Item item = ItemService.optionRead(itemName);

		model.addAttribute(item);

		return "/admin/item/optionModify";
	}

	// 상품 수정 처리
	@RequestMapping(value = "/itemModify", method = RequestMethod.POST)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modify(Item item, RedirectAttributes rttr) throws Exception {
		log.info(item.getItemName());
		log.info(item.getItemNo());

		log.info(Integer.toString(item.getItemPrice()));
		Integer iNo = ItemService.getINo(item.getItemName());
		item.setI_no(iNo);
		log.info(Integer.toString(item.getI_no()));
		ItemService.modify(item);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/item/list";
	}
	// 옵션 수정 처리
	@RequestMapping(value = "/optionModify", method = RequestMethod.POST)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String optionModify(Item item, RedirectAttributes rttr) throws Exception {
		log.info(item.getItemName());
		//log.info(item.getItemNo());

		log.info(Integer.toString(item.getItemPrice()));
		Integer iNo = ItemService.getINo(item.getItemName());
		item.setI_no(iNo);
		log.info(Integer.toString(item.getI_no()));
		ItemService.optionModify(item);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/item/list";
	}

	// 상품 삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(Item item, RedirectAttributes rttr) throws Exception {
		log.info(item.toString());
		ItemService.remove(item.getItemName());
		//ItemService.remove(item.getItemNo());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/item/list";
	}
	
	// 변경 페이지
	@RequestMapping(value = "/itemChange",method = RequestMethod.GET)
	public void read(String itemNo,Model model) throws Exception{
		model.addAttribute(ItemService.read(itemNo));
	}
	
	// 변경 페이지
	@RequestMapping(value = "/optionChange",method = RequestMethod.GET)
	public void optionRead(String itemName,Model model) throws Exception{
		model.addAttribute(ItemService.optionRead(itemName));
	}

}
