package com.mom.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Home {
	
	private int referenceNo;
	private String userName;
	private String userPhone;
	private int userNo;
	private String referenceTitle;
	private String referenceContent;
	private Date referenceDate;
	private int rNo;
	private String reserveNo;
	private String userId;
	private String itemNo;
	private String reserveItemName;
	private int reserveItemPrice;
	private String reserveOptionName;
	private int reserveOptionPrice;
	private String reserveState;
	private String reserveAddr;
	private Date reserveDate;
	private Date cleanDate;
	private Date cancelDate;
	private String reserveRequest;
	private String cleanDone;
	
}
