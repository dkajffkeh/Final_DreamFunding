package com.donjomjo.dreamfunding.index.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.donjomjo.dreamfunding.common.model.vo.PageInfo;
import com.donjomjo.dreamfunding.index.model.vo.Index;
import com.donjomjo.dreamfunding.index.model.vo.Like;

@Repository
public class IndexDao {
	
	// 진행중인 펀딩리스트 조회
	public ArrayList<Index> selectProgressFundingList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectProgressFundingList");
	}
	// 실시간 랭킹 리스트 조회
	public ArrayList<Index> selectRankingList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectRankingList");
	}
	// 종료된 펀딩리스트 조회
	public ArrayList<Index> selectClosedFundingList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectClosedFundingList");
	}
	
	// 진행중인 펀딩(펀딩금액순)조회
	public ArrayList<Index> selectFundingMoney(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectFundingMoneyList"); 
	}
	
	// 진행중인 펀딩(펀딩금액순)조회
	public ArrayList<Index> selectClosed(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectClosedList"); 
	}
	
	// 진행중인 펀딩(펀딩금액순)조회
	public ArrayList<Index> selectNew(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("indexMapper.selectNewList"); 
	}

	public int increaseLike(SqlSessionTemplate sqlSession, Like like) {
	
		return sqlSession.insert("indexMapper.increaseLike", like);
	}
	
	public int likeYN(SqlSessionTemplate sqlSession, Like like) {
		int likeYN = sqlSession.selectOne("indexMapper.likeYN", like);
		
		return likeYN;
	}
	
	public int deleteLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.delete("indexMapper.deleteLike", like);
	}
	
	public ArrayList<Like> likeList(SqlSessionTemplate sqlSession, int mno){
		return (ArrayList)sqlSession.selectList("indexMapper.likeList", mno);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("indexMapper.selectListCount");
	}
	
	public ArrayList<Index> selectProjectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("indexMapper.selectProjectList", null, rowBounds);
		
	}
	
	public ArrayList<Index> selectRankingList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("indexMapper.selectRankingList", null, rowBounds);
		
	}
	
	public ArrayList<Index> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("indexMapper.selectSearchList", keyword, rowBounds);
		
	}
	
	
	public ArrayList<Index> selectMagazineList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("indexMapper.selectMagazineList", null, rowBounds);
		
	}
	
	public ArrayList<Index> selectEssayList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("indexMapper.selectEssayList", null, rowBounds);
		
	}
	public ArrayList<Index> selectArtList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("indexMapper.selectArtList", null, rowBounds);
		
	}
	public ArrayList<Index> selectHobbyList(SqlSessionTemplate sqlSession, PageInfo pi){
	
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
	return (ArrayList)sqlSession.selectList("indexMapper.selectHobbyList", null, rowBounds);
	
	}
	public ArrayList<Index> selectDrawingList(SqlSessionTemplate sqlSession, PageInfo pi){
	
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
	return (ArrayList)sqlSession.selectList("indexMapper.selectDrawingList", null, rowBounds);
	
	}
	public ArrayList<Index> selectEtcList(SqlSessionTemplate sqlSession, PageInfo pi){
	
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
	return (ArrayList)sqlSession.selectList("indexMapper.selectEtcList", null, rowBounds);
	
	}
	
	
	
}
