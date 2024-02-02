package com.spring.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;
import com.sun.org.glassfish.gmbal.ParameterNames;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, 
			Model model, 
			PageVo pageVo) throws Exception{
	
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		
        boardList = boardService.selectBoardList(pageVo);
        totalCnt = boardService.selectBoardCnt();
        List<ComcodeVo> comcodeList = boardService.selectComcode();
        
        int currentPage = (pageVo.getPageNo() != 0) ? pageVo.getPageNo() : 1;
        int totalPosts = totalCnt; // 전체 게시물 수 (예시용으로 100으로 설정)
        int postsPerPage = 10;
        int totalPages = (int) Math.ceil((double) totalPosts / postsPerPage);
        int visiblePages = 10; // 보여줄 페이지 링크 개수
        int pageGroup = (int) Math.ceil((double) currentPage / visiblePages);
        int startPage = (pageGroup - 1) * visiblePages + 1;
        int endPage = Math.min(startPage + visiblePages - 1, totalPages);
        
        
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        
        
        model.addAttribute("comcodeList", comcodeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		

		
		return "board/boardList";
	}
	
	
	@RequestMapping(value = "/board/boardTypeList.do", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String boardTypeList(Locale locale, 
			Model model, 
			@RequestParam(value = "boardType", required = false, defaultValue = "") String[] boardTypes,
			PageVo pageVo
			) throws Exception{
	
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		Map<String, Object> result = new HashMap<>();		
		CommonUtil commonUtil = new CommonUtil();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}	
		
		boardList = boardService.selectBoardListByType(pageVo, boardTypes);
	    totalCnt = boardService.selectBoardTypeCnt(pageVo, boardTypes);
		
	    result.put("success", (boardList.size() > 0)?"Y":"N");
	    result.put("boardList", boardList);
	    result.put("totalCnt", totalCnt);
	    result.put("pageNo", pageVo.getPageNo());

	    
	    String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		

	    
		
	    return callbackMsg;
		
		
	
	}
	
	
	
	@RequestMapping(value = "/board/boardTypeList2.do", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public String boardTypeLis2(Locale locale, 
			Model model, 
			@RequestParam(value = "boardType", required = false, defaultValue = "") String[] boardTypes,
			PageVo pageVo
			) throws Exception{
	
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}	
		
		boardList = boardService.selectBoardListByType(pageVo, boardTypes);
		totalCnt = boardService.selectBoardTypeCnt(pageVo, boardTypes);
		List<ComcodeVo> comcodeList = boardService.selectComcode();
		
		int currentPage = (pageVo.getPageNo() != 0) ? pageVo.getPageNo() : 1;
	    int totalPosts = totalCnt; // 전체 게시물 수 (예시용으로 100으로 설정)
	    int postsPerPage = 10;
	    int totalPages = (int) Math.ceil((double) totalPosts / postsPerPage);
	    int visiblePages = 10; // 보여줄 페이지 링크 개수
	    int pageGroup = (int) Math.ceil((double) currentPage / visiblePages);
	    int startPage = (pageGroup - 1) * visiblePages + 1;
	    int endPage = Math.min(startPage + visiblePages - 1, totalPages);
	        
	        
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
        
		
        model.addAttribute("comcodeList", comcodeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", pageVo.getPageNo());
		
		
		
		return "board/boardList2";
	}
	
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, PageVo pageVo) throws Exception{
		
		List<ComcodeVo> comcodeList = boardService.selectComcode();
		
		model.addAttribute("comCode", comcodeList);		
		model.addAttribute("pageNo", pageVo.getPageNo());
		
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	
	// 수정 시도
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardEdit.do", method = RequestMethod.GET)
	public String boardEdit(
			Locale locale, 
			BoardVo boardVo,
			PageVo pageVo,
			Model model
			) throws Exception{


		boardVo = boardService.selectBoard(boardVo.getBoardType(),boardVo.getBoardNum());
		
		model.addAttribute("boardType", boardVo.getBoardType());
		model.addAttribute("boardNum", boardVo.getBoardNum());
		model.addAttribute("board", boardVo);
		model.addAttribute("pageNo",pageVo.getPageNo());

		return "board/boardEdit";
	}
	
	// 수정 시도
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardEdit.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardEdit(Locale locale, Model model,
			BoardVo boardVo
			) throws Exception{
		
		System.out.println("test check::");
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
	
		int resultCnt = boardService.boardUpdate(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	// 삭제 시도
//	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardDelete.do", method = RequestMethod.GET)
//	public String boardDelete(Locale locale, BoardVo boardVo,PageVo pageVo, Model model) throws Exception{
//		System.out.println("delete check::");
//		
//		int resultCnt = boardService.boardDelete(boardVo);
//		
//		
//		model.addAttribute("pageNo", pageVo.getPageNo());
//
//		return "redirect:/board/boardList.do";
//	}
	
	// 삭제 시도2
		@RequestMapping(value = "/board/{boardType}/{boardNum}/boardDelete.do", method = RequestMethod.GET)
		@ResponseBody
		public String boardDelete2(Locale locale, BoardVo boardVo,PageVo pageVo, Model model) throws Exception{
			System.out.println("delete check::");
			
			HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();
			
			int resultCnt = boardService.boardDelete(boardVo);
			
			result.put("success", (resultCnt > 0)?"Y":"N");
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			
			model.addAttribute("pageNo", pageVo.getPageNo());

			return callbackMsg;
		}
	
	
}

