package com.donjomjo.dreamfunding.detail.model.dao;

import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.detail.model.vo.Detail;
import com.donjomjo.dreamfunding.detail.model.vo.DetailPageInfo;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReport;
import com.donjomjo.dreamfunding.detail.model.vo.DetailReward;
import com.donjomjo.dreamfunding.detail.model.vo.DetailRewardOpt;
import com.donjomjo.dreamfunding.detail.model.vo.Like;
import com.donjomjo.dreamfunding.detail.model.vo.Reply;
import com.donjomjo.dreamfunding.detail.model.vo.SubReply;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class DetailDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectDetailMapper.selectListCount");
	}
	
	// 리스트 조회(test)
	public ArrayList<Detail> selectDetailList(SqlSessionTemplate sqlSession, DetailPageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("projectDetailMapper.selectDetailList", null, rowBounds);
		
	}
	
	// 프로젝트 글 조회수 증가 
	public int increaseDetailCount(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.update("projectDetailMapper.increaseDetailCount", pno);
	}

	// 프로젝트 번호로 상세 조회 서비스 
	public Detail selectDetailAll(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("projectDetailMapper.selectDetailAll", pno);
	}

	// 현재 프로젝트에 연결된 리워드 조회 서비스 
	public ArrayList<DetailReward> selectDetailReward(SqlSessionTemplate sqlSession, int pno) {
	
			
		ArrayList<DetailReward> rewards = (ArrayList)sqlSession.selectList("projectDetailMapper.selectDetailReward", pno);

		int rno = 0;
		
		for(DetailReward i: rewards) {  
			rno = i.getRewardNo();// 반복문 돌려 rno에 각각의 리워드 번호 담은 후,
			
			ArrayList<DetailRewardOpt> opts = (ArrayList)sqlSession.selectList("projectDetailMapper.selectDetailRewardOpt", rno);
			// rno 이용하여 <DetailRewardOpt>객체 빈 배열 opts에 리워드 옵션 리스트 조회 내역 담기 
			
			i.setDetailRewardOptList(opts);
			
		}
		
		return rewards;
	}
	
	// 프로젝트 신고 등록 
	public int insertReport(SqlSessionTemplate sqlSession, DetailReport rp) {
		return sqlSession.insert("projectDetailMapper.insertReport", rp);
	}

	// 프로젝트 좋아요 생성 
	public int insertLike(SqlSessionTemplate sqlSession, Like lk) {
		return sqlSession.insert("projectDetailMapper.insertDetailLike", lk);
	}

	public int selectLike(SqlSessionTemplate sqlSession, Like lk) {
		return sqlSession.selectOne("projectDetailMapper.selectDetailLike", lk);
	}

	public int deleteLike(SqlSessionTemplate sqlSession, Like lk) {
		return sqlSession.delete("projectDetailMapper.deleteDetailLike", lk);
		
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("projectDetailMapper.selectReply", pno);
	}

	public ArrayList<SubReply> selectSubReply(SqlSessionTemplate sqlSession, int rno) {
		return (ArrayList)sqlSession.selectList("projectDetailMapper.selectSubReply", rno);

	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply rp) {
		return sqlSession.insert("projectDetailMapper.insertReply", rp);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply rp) {
		return sqlSession.update("projectDetailMapper.updateReply", rp);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("projectDetailMapper.deleteReply", rno);
	}


	public int insertSubReply(SqlSessionTemplate sqlSession, Reply rp) {
		return sqlSession.insert("projectDetailMapper.insertSubReply", rp);
	}

	public int updateSubReply(SqlSessionTemplate sqlSession, Reply rp) {
		return sqlSession.update("projectDetailMapper.updateSubReply", rp);
	}

	public int deleteSubReply(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.update("projectDetailMapper.deleteSubReply", sno);
	}

	public ArrayList<SubReply> selectSubReplyOne(SqlSessionTemplate sqlSession, Reply rp) {
		return (ArrayList)sqlSession.selectList("projectDetailMapper.selectSubReplyOne", rp);
	}

	
	
}
