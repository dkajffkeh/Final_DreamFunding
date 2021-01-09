package com.donjomjo.dreamfunding.serviceCenter.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donjomjo.dreamfunding.detail.model.vo.Detail;
import com.donjomjo.dreamfunding.serviceCenter.model.dao.ServiceCenterDao;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Council;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Faq;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Notice;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.PageInfo;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ServiceCenterDao scDao;
	
	@Override
	public int selectListCount() {
		return scDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		
		ArrayList<Notice> list = scDao.selectNoticeList(sqlSession, pi);			
	
		
		return list;
	}


	@Override
	public int increaseCount(int nno) {
		return scDao.increaseCount(sqlSession, nno);
	}


	@Override
	public Notice selectNotice(int nno) {
	
		return scDao.selectNotice(sqlSession, nno);
	}
	
	@Override
	public int insertNotice(Notice n) {
		
		return scDao.insertNotice(sqlSession, n);
	}


	@Override
	public int updateNotice(Notice n) {
	
		return scDao.updateNotice(sqlSession, n);
	}


	@Override
	public int deleteNotice(int nno) {
		
		return scDao.deleteNotice(sqlSession, nno);
	}

	@Override
	public int selectFaqListCount(int ctno) {
		return scDao.selectFaqListCount(sqlSession, ctno);
	}
	@Override
	public ArrayList<Faq> selectFaqList(PageInfo pi, int ctno) {
		
		return scDao.selectFaqList(sqlSession, pi, ctno);
	}


	@Override
	public int insertFaq(Faq fq) {
		
		return scDao.insertFaq(sqlSession, fq);
	}
	@Override
	public Faq selectFaq(int fno) {
		
		return scDao.selectFaq(sqlSession, fno);
	}

	@Override
	public int updateFaq(Faq fq) {
		
		return scDao.updateFaq(sqlSession, fq);
	}


	@Override
	public int deleteFaq(int fno) {
		
		return scDao.deleteFaq(sqlSession, fno);
	}


	@Override
	public int selectStatus(int mno) {
		
		return scDao.selectStatus(sqlSession, mno);
	}


	@Override
	public int selectCouncilCountAd() {
	
		return scDao.selectCouncilCountAd(sqlSession);
	}


	@Override
	public int selectCouncilCount(int mno) {
		
		return scDao.selectCouncilCount(sqlSession, mno);
	}


	@Override
	public ArrayList<Council> selectCouncilList(PageInfo pi, int mno) {
		
		return scDao.selectCouncilList(sqlSession, pi, mno);
	}


	@Override
	public ArrayList<Council> selectCouncilListAd(PageInfo pi) {
		
		return scDao.selectCouncilListAd(sqlSession, pi);
	}


	@Override
	public Council selectCouncil(int cno) {
		
		return scDao.selectCouncil(sqlSession, cno);
	}


	@Override
	public int insertCouncil(Council co) {
		
		return scDao.insertCouncil(sqlSession, co);
	}


	@Override
	public int updateCouncil(Council co) {
		
		return scDao.updateCouncil(sqlSession, co);
	}


	@Override
	public int deleteCouncil(int cno) {
		
		return scDao.deleteCouncil(sqlSession, cno);
	}


	@Override
	public int insertCouncilAns(Council co) {
		
		return scDao.insertCouncilAns(sqlSession, co);
	}


	@Override
	public int updateCouncilAns(Council co) {
		
		return scDao.insertCouncilAns(sqlSession, co);
	}


	@Override
	public int deleteCouncilAns(int cno) {
		
		return scDao.deleteCouncilAns(sqlSession, cno);
	}


	@Override
	public int searchNoticeCount(String cate, String keyword) {
		
		return scDao.searchNoticeCount(sqlSession, cate, keyword);
	}


	@Override
	public ArrayList<Notice> searchNoticeList(PageInfo pi, String cate, String keyword) {
		
		return scDao.searchNoticeList(sqlSession, pi, cate, keyword);
	}


	@Override
	public ArrayList<Detail> selectProjectAdmin() {
		
		return scDao.selectProjectAdmin(sqlSession);
	}


	@Override
	public int approvalProject(int pno) {
		
		return scDao.approvalProject(sqlSession, pno);
	}


	@Override
	public int rejectedProject(int pno, String reason) {
		
		return scDao.rejectedProject(sqlSession, pno, reason);
	}


	


	




	
}
