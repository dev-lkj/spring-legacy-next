package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

public interface BoardDao {

	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception;
	
	List<BoardVo> selectBoardListByType(PageVo pageVo, String[] boardType) throws Exception;

	public BoardVo selectBoard(BoardVo boardVo) throws Exception;
	
	public List<ComcodeVo> selectComcode(List<BoardVo> listBoardVo) throws Exception;

	public int selectBoardCnt() throws Exception;
	
	public int selectBoardTypeCnt(PageVo pageVo, String[] boardType) throws Exception;
	
	
	

	public int boardInsert(BoardVo boardVo) throws Exception;
	
	public int boardUpdate(BoardVo boardVo) throws Exception;
	
	public int boardDelete(BoardVo boardVo) throws Exception;
	
	
	

}
