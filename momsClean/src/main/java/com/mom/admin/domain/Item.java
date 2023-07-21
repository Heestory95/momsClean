package com.mom.admin.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Item {
	
	private String itemNo;
	private String itemName;
	private Integer itemPrice;
	private Integer i_no;
	private MultipartFile picture;
	private String pictureUrl;
	private MultipartFile thumb;
	private String thumbUrl;
	private MultipartFile option;
	private String optionUrl;
	private MultipartFile faq;
	private String faqUrl;
	
	
}
