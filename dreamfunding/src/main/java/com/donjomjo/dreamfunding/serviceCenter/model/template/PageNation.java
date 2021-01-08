package com.donjomjo.dreamfunding.serviceCenter.model.template;

import com.donjomjo.dreamfunding.serviceCenter.model.vo.PageInfo;

public class PageNation {

	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage =(int)Math.ceil((double)listCount/boardLimit);
		
		int startPage = (currentPage -1) / pageLimit * pageLimit +1;
		
		int endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		
	}
}
