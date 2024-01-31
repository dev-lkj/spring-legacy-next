package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}

	
	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",pageVo);
	}
	@Override
	public List<BoardVo> selectBoardListByType(PageVo pageVo, String[] boardType) throws Exception {
//		System.out.println("boardVo들어가기전::"+boardVo);
//		System.out.println("boardVo들어가기전::"+boardVo.getBoardType());
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("pageVo", pageVo);
//		map.put("boardVo", boardVo);
		map.put("boardTypes", boardType);
		
		System.out.println("map pageVo Check::"+map.get("pageVo"));
		System.out.println("map pageVo Check::"+pageVo.getPageNo());
		System.out.println("map boardType Check::"+map.get("boardTypes"));
		for(String boardTyp: boardType) {
			System.out.println("boardTypeTest::"+boardTyp);
		}
//		System.out.println("map Check::"+map.get("boardVo"));
		return sqlSession.selectList("board.boardListByType",map);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardTotal");
	}
	
	@Override
	public int selectBoardTypeCnt(PageVo pageVo,String[] boardType) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("pageVo", pageVo);
		map.put("boardTypes", boardType);
		
		return sqlSession.selectOne("board.boardTypeTotal", map);
	}
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("board.boardUpdate", boardVo);
	}
	@Override
	public int boardDelete(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.boardDelete", boardVo);
	}


	
	
	
	
	
	
}
