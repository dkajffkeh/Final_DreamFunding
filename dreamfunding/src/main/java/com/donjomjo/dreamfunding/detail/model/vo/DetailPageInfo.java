package com.donjomjo.dreamfunding.detail.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class DetailPageInfo {

	private int listCount; // 게시글 총 갯수 
	private int currentPage; // 요청한 페이지 
	private int startPage; // 시작 페이지 
	private int endPage; // 끝 페이지 
	private int maxPage; // 총 마지막 페이지 
	private int pageLimit; // 페이지 제한 수 
	private int boardLimit; // 한 페이지 당 게시글 제한 수 
	
	
}
