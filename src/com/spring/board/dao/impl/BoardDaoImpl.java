package com.spring.board.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComcodeVo;
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
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("pageVo", pageVo);
		map.put("boardTypes", boardType);	

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
	public List<ComcodeVo> selectComcode() throws Exception {
		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<>();
//		map.put("boardTypes", boardTypes);
//		List<ComcodeVo> comodeVoList = new ArrayList<>();
//		for (BoardVo listBoardVo2 : listBoardVo) {
//			System.out.println("::::"+listBoardVo2.getBoardType());
//			comodeVoList.addAll(sqlSession.selectList("board.comCode", listBoardVo));
//		}
		return sqlSession.selectList("board.comCode");
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
