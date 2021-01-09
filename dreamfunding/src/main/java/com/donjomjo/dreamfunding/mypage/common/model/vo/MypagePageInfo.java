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
		private int mypageLimit;
		
		
}
