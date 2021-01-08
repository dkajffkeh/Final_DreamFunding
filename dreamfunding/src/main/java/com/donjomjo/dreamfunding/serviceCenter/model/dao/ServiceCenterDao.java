package com.donjomjo.dreamfunding.serviceCenter.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.serviceCenter.model.vo.Council;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Faq;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.Notice;
import com.donjomjo.dreamfunding.serviceCenter.model.vo.PageInfo;

@Repository
public class ServiceCenterDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serviceCenterMapper.selectListCount");
	}
	
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		  ArrayList<Notice> list = (ArrayList)sqlSession.selectList("serviceCenterMapper.selectNoticeList", null, rowBounds);
		  				  
		  return list;
		
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("serviceCenterMapper.increaseCount", nno);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.selectOne("serviceCenterMapper.selectNotice", nno);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("serviceCenterMapper.insertNotice", n);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n ) {
		return sqlSession.update("serviceCenterMapper.updateNotice", n);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("serviceCenterMapper.deleteNotice", nno);
	}
	
	public int selectFaqListCount(SqlSessionTemplate sqlSession, int ctno) {
		return sqlSession.selectOne("serviceCenterMapper.selectFaqListCount", ctno);
	}
	
	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi, int ctno){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceCenterMapper.selectFaqList", ctno, rowBounds);
		
	}
	
	public int insertFaq(SqlSessionTemplate sqlSession, Faq fq) {
		return sqlSession.insert("serviceCenterMapper.insertFaq", fq);
	}
	
	public Faq selectFaq(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.selectOne("serviceCenterMapper.selectFaq", fno);
	}
	
	public int updateFaq(SqlSessionTemplate sqlSession, Faq fq) {
		return sqlSession.update("serviceCenterMapper.updateFaq", fq);
	}
	
	public int deleteFaq(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.update("serviceCenterMapper.deleteFaq", fno);
	}
	
	public int selectStatus(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("serviceCenterMapper.selectStatus", mno);
	}
	
	public int selectCouncilCount(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("serviceCenterMapper.selectCouncilCount", mno);
	}
	
	public int selectCouncilCountAd(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serviceCenterMapper.selectCouncilCountAd");
	}
	
	public ArrayList<Council> selectCouncilList(SqlSessionTemplate sqlSession, PageInfo pi, int mno){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceCenterMapper.selectCouncilList", mno, rowBounds);
	}
	
	public ArrayList<Council> selectCouncilListAd(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceCenterMapper.selectCouncilListAd", null, rowBounds);
	}
	
	public Council selectCouncil(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.selectOne("serviceCenterMapper.selectCouncil", cno);
	}
	
	public int insertCouncil(SqlSessionTemplate sqlSession, Council co) {
		return sqlSession.insert("serviceCenterMapper.insertCouncil", co);
	}
	
	public int updateCouncil(SqlSessionTemplate sqlSession, Council co) {
		return sqlSession.update("serviceCenterMapper.updateCouncil", co);
	}
	
	public int deleteCouncil(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.update("serviceCenterMapper.deleteCouncil", cno);
	}
	public int insertCouncilAns(SqlSessionTemplate sqlSession, Council co) {
		return sqlSession.update("serviceCenterMapper.insertCouncilAns", co);
	}
	
	public int deleteCouncilAns(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.delete("serviceCenterMapper.deleteCouncilAns", cno);
	}
	
	public int searchNoticeCount(SqlSessionTemplate sqlSession, String cate, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("cate", cate);
		map.put("keyword", keyword);
		return sqlSession.selectOne("serviceCenterMapper.searchNoticeCount", map);
	}
	
	public ArrayList<Notice> searchNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, String cate, String keyword){
		HashMap<String, String> map = new HashMap<>();
		map.put("cate", cate);
		map.put("keyword", keyword);
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("serviceCenterMapper.searchNoticeList", map, rowBounds);
	}
	
}
