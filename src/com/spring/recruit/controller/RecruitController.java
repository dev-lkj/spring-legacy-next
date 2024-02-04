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

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.spring.recruit.service.RecruitService;
import com.spring.recruit.service.impl.RecruitServiceImpl;
import com.spring.recruit.vo.LoginVo;
import com.spring.recruit.vo.MainVo;
import com.spring.recruit.vo.PageVo;
import com.spring.recruit.vo.RecruitVo;
import com.sun.org.glassfish.gmbal.ParameterNames;

@Controller
public class RecruitController {
	
	
	RecruitService recruitService = new RecruitServiceImpl();
	

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping(value = "/recruit/login", method = RequestMethod.GET)
	public String recruitLogin(Locale locale) throws Exception {
		
		return "recruit/recruitLogin";
	}

	@RequestMapping(value = "/recruit/login", method = RequestMethod.POST)
	public String recruitLoginPost(Locale locale, 
				RecruitVo recruitVo, 
				Model model,
				HttpSession session
			) throws Exception {
		System.out.println(":::"+recruitVo.getName());
		System.out.println(":::"+recruitVo.getPhone());
		
		String returnURL = "";
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		
		System.out.println(recruitService.recruitLogin(recruitVo));
		
		int loginvo = recruitService.recruitLogin(recruitVo);
		System.out.println("::::"+loginvo);

		if(loginvo == 1) { // 로그인 성공
			System.out.println("로그인 성공");
			session.setAttribute("login", recruitVo);
			returnURL = "redirect:/recruit/main";
		} else {
			System.out.println("로그인 실패");
			returnURL = "redirect:/recruit/login";
		}

		return returnURL;
	}

	
	 @RequestMapping(value = "/recruit/main", method = RequestMethod.GET)
	 public String recruitMain(Locale locale, 
			 HttpSession session,
			 RecruitVo recruitVo,
			 Model model ) throws
	  Exception{
		RecruitVo loginVo = (RecruitVo) session.getAttribute("login");
	   model.addAttribute("login", loginVo);
	   model.addAttribute("main", recruitVo);
	  
	  return "recruit/recruitMain"; 
	  
	 }
	 

}
