package com.donjomjo.dreamfunding.mypage.common;

import com.donjomjo.dreamfunding.mypage.common.model.vo.MypagePageInfo;

public class MypagePagination {
	
	public static MypagePageInfo getMypagePageInfo(int listCount, int currentPage, int pageLimit, int mypageLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount/mypageLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		return new MypagePageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, mypageLimit);
	}
	
}
