package com.spring.recruit.controller;

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
import com.spring.common.CommonUtil;
import com.spring.recruit.service.impl.RecruitService;
import com.spring.recruit.vo.LoginVo;
import com.spring.recruit.vo.MainVo;
import com.spring.recruit.vo.PageVo;
import com.spring.recruit.vo.RecruitVo;
import com.sun.org.glassfish.gmbal.ParameterNames;

@Controller
public class RecruitController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/recruit/recruitList", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, PageVo pageVo) throws Exception {

		List<RecruitVo> recruitList = new ArrayList<RecruitVo>();

		int page = 1;
		int totalCnt = 0;

		if (pageVo.getPageNo() == 0) {
			pageVo.setPageNo(page);
		}

//		
//		recruitList = recruitService.selectBoardList(pageVo);
//        totalCnt = recruitService.selectBoardCnt();
//       

//
//		model.addAttribute("recruitList", recruitList);
//		model.addAttribute("totalCnt", totalCnt);
//		model.addAttribute("pageNo", page);
//		

		return "recruit/recruitList";
	}

//	@RequestMapping(value = "/recruit/login", method = RequestMethod.GET)
//	public String recruitLogin(Locale locale) throws Exception {
//
//		return "recruit/recruitLogin";
//	}
//
//	@RequestMapping(value = "/recruit/login", method = RequestMethod.POST)
//	public String recruitLoginPost(Locale locale, LoginVo loginVo, Model model) throws Exception {
//
//		model.addAttribute("login", loginVo);
//
//		return "redirect:/recruit/main";
//	}
//
//	
//	 @RequestMapping(value = "/recruit/main", method = RequestMethod.POST)
//	 public String recruitMain(Locale locale, 
//			 LoginVo loginVo,
//			 MainVo mainVo,
//			 Model model ) throws
//	  Exception{
//	  
//	   model.addAttribute("login", loginVo);
//	   model.addAttribute("main", mainVo);
//	  
//	  return "recruit/recruitMain"; 
//	  
//	 }
	 

}
