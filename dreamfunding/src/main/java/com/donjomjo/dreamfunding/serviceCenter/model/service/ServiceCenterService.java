package com.donjomjo.dreamfunding.serviceCenter.model.service;

import java.util.ArrayList;

import com.donjomjo.dreamfunding.detail.model.vo.Detail;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Council;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Faq;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Notice;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.PageInfo;

public interface ServiceCenterService {
	
	int selectListCount();
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	int increaseCount(int nno);
	Notice selectNotice(int nno);
	int insertNotice(Notice n);
	int updateNotice(Notice n);
	int deleteNotice(int nno);
	int searchNoticeCount(String cate, String keyword);
	ArrayList<Notice> searchNoticeList(PageInfo pi,String cate, String keyword);
	
	int selectFaqListCount(int ctno);
	ArrayList<Faq> selectFaqList(PageInfo pi, int ctno);
	Faq selectFaq(int fno);
	int insertFaq(Faq fq);
	int updateFaq(Faq fq);
	int deleteFaq(int fno);
	
	int selectStatus(int mno);
	int selectCouncilCountAd();
	int selectCouncilCount(int mno);
	ArrayList<Council> selectCouncilList(PageInfo pi, int mno);
	ArrayList<Council> selectCouncilListAd(PageInfo pi);
	Council selectCouncil(int cno);
	int insertCouncil(Council co);
	int updateCouncil(Council co);
	int deleteCouncil(int cno);
	int insertCouncilAns(Council co);
	int updateCouncilAns(Council co);
	int deleteCouncilAns(int cno);
	ArrayList<Detail> selectProjectAdmin();
	
	int approvalProject(int pno);
	int rejectedProject(int pno, String reason);
	
}
