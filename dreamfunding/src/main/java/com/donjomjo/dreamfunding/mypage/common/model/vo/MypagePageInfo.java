package com.donjomjo.dreamfunding.mypage.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class MypagePageInfo {
	
	

		
		
	
		private int listCount;
		private int currentPage;
		private int startPage;
		private int endPage;
		private int maxPage;
		private int pageLimit;
		private int fundingLimit;
		
		public MypagePageInfo(int listCount2, int currentPage2, int startPage2, int endPage2, int maxPage2,
				int pageLimit2, int fundingLimit2) {
			// TODO Auto-generated constructor stub
		}
		public int getFundingLimit() {
			// TODO Auto-generated method stub
			return 0;
		}
		public int getCurrentPage() {
			// TODO Auto-generated method stub
			return 0;
		}

	

}
