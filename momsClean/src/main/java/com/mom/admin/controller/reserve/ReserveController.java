package com.mom.admin.controller.reserve;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mom.admin.common.CodeLabelValue;
import com.mom.admin.domain.PageRequest;
import com.mom.admin.domain.Pagination;
import com.mom.admin.service.reserve.ReserveService;

@Controller
@RequestMapping("/admin/reserve")
public class ReserveController {
	@Autowired
	private ReserveService service;

	// 승인요청 리스트 페이지
	// 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달
	@GetMapping("/request/list")
	public void request(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		// 뷰에 페이징 처리를 한 승인요청 리스트를 전달한다.
		model.addAttribute("request", service.request(pageRequest));

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);

		// 페이지 네비게이션 정보에 검색 처리된 요청 건수를 저장한다.
		pagination.setTotalCount(service.count());
		model.addAttribute("pagination", pagination);

		// 검색 유형의 코드명과 코드값을 정의한다.
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		searchTypeCodeValueList.add(new CodeLabelValue("ca", "카테고리"));
		searchTypeCodeValueList.add(new CodeLabelValue("no", "회원번호"));
		searchTypeCodeValueList.add(new CodeLabelValue("id", "아이디"));
		searchTypeCodeValueList.add(new CodeLabelValue("na", "이름"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}
}
