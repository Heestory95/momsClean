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
	
	// 예약취소율 통계 카운트
	private int reserveCount;
	private int cancelCount;
	
	// 상품 및 옵션 선택 통계 카운트
	private int itemCount1;
	private int itemCount2;
	private int itemCount3;
	private int itemCount4;
	private int itemCount5;
	private int itemCount6;
}
