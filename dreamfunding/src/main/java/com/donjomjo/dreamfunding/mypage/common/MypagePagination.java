package com.donjomjo.dreamfunding.mypage.common;

import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;

public class MypagePagination {
	
	public static MypagePageInfo getMypagePageInfo(int listCount, int currentPage, int pageLimit, int fundingLimit) {
		// * maxPage : listCount, boardLimit 영향을 받는다.
		int maxPage = (int)Math.ceil((double)listCount/fundingLimit);
		// * startPage : currentPage, pageLimit 영향을 받는다 
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		// * endPage : startPage, pageLimit, maxPage
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new MypagePageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, fundingLimit);
		
	}

}
