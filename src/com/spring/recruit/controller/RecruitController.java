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
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.spring.recruit.vo.CareerVo;
import com.spring.recruit.vo.CertificateVo;
import com.spring.recruit.vo.EducationVo;
import com.spring.recruit.vo.LoginVo;
import com.spring.recruit.vo.MainVo;
import com.spring.recruit.vo.PageVo;
import com.spring.recruit.vo.RecruitVo;
import com.sun.org.glassfish.gmbal.ParameterNames;

@Controller
public class RecruitController {
	
	@Autowired
	RecruitService recruitService;
	

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
		
		String returnURL = "";
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		
		
		RecruitVo loginvo = recruitService.recruitLogin(recruitVo);


		if(loginvo != null) { // 로그인 성공
			System.out.println("로그인 성공");
			session.setAttribute("login", loginvo);
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
			 Model model ) throws Exception{
		RecruitVo loginVo = (RecruitVo) session.getAttribute("login");
	   model.addAttribute("recruit", loginVo);
	   
	  return "recruit/recruitMain"; 
	  
	 }
	 
	 @RequestMapping(value = "/recruit/main", method = RequestMethod.POST)
	 public String recruitMainPost(Locale locale, 
			 HttpSession session,
			 RecruitVo recruitVo,
			 EducationVo educationVo,
			 CareerVo careerVo,
			 CertificateVo certificateVo,
			 @RequestParam(value="recruitVo.location",required=false) String recruitLocation,
			 @RequestParam(value="educationVo.startPeriod",required=false) String educationStartPeriod,
			 @RequestParam(value="educationVo.endPeriod",required=false) String educationEndPeriod,
			 @RequestParam(value="educationVo.location",required=false) String educationLocation,
			 @RequestParam(value="careerVo.startPeriod",required=false) String careerStartPeriod,
			 @RequestParam(value="careerVo.endPeriod",required=false) String careerEndPeriod,
			 @RequestParam(value="careerVo.location",required=false) String careerLocation,
			 	
			 Model model ) throws Exception{
		 	
		 //Vo에 안담기는 파라미터 직접 담아주기
		 recruitVo.setLocation(recruitLocation);
		 educationVo.setStartPeriod(educationStartPeriod);
		 educationVo.setEndPeriod(educationEndPeriod);
		 educationVo.setLocation(educationLocation);
		 careerVo.setStartPeriod(careerStartPeriod);
		 careerVo.setEndPeriod(careerEndPeriod);
		 careerVo.setLocation(careerLocation);
		 	
		 System.out.println("::recruitVo "+recruitVo.getName());
		 System.out.println("::recruitVo2 "+recruitVo.getBirth());
		 
		 System.out.println("::educationVo "+educationVo.getGrade());
		 System.out.println("::educationVo "+educationVo.getStartPeriod());
		 System.out.println("::careerVo "+careerVo.getTask());
		 System.out.println("::careerVo "+careerVo.getStartPeriod());
		 System.out.println("::certificateVo "+certificateVo.getOrganizeName());
		
		 
		 model.addAttribute("recruit", recruitVo);
		 model.addAttribute("education", educationVo);
		 model.addAttribute("career", careerVo);
		 model.addAttribute("certificate", certificateVo);
	  
	  return "recruit/recruitMain"; 
	  
	 }
	 

}

