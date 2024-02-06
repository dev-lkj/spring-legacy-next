package com.spring.recruit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
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
import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.service.RecruitService;
import com.spring.recruit.service.impl.RecruitServiceImpl;
import com.spring.recruit.vo.CareerVo;
import com.spring.recruit.vo.CertificateVo;
import com.spring.recruit.vo.EducationVo;
import com.spring.recruit.vo.LoginVo;
import com.spring.recruit.vo.MainVo;
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
			 System.out.println("로그인 실패 회원가입 시작::");
			int join = recruitService.recruitJoin(recruitVo);
			if(join>0) {
				loginvo = recruitService.recruitLogin(recruitVo);
				session.setAttribute("login", loginvo);
				returnURL = "redirect:/recruit/main";
			}else {
				System.out.println("join 0 check::");
			}
			
			
			returnURL = "redirect:/recruit/login";
		}

		return returnURL;
	}
	
	
	

	
	 @RequestMapping(value = "/recruit/main", method = RequestMethod.GET)
	 public String recruitMain(Locale locale, 
			 HttpSession session,
			 Model model ) throws Exception{
		 
		 RecruitVo loginVo = (RecruitVo) session.getAttribute("login");
		 String submitCheck = loginVo.getSubmit();
		 System.out.println(":::submitCheck"+ loginVo.getSubmit());
		 System.out.println(":::submitCheck2인지"+ submitCheck.equals("2"));
		 model.addAttribute("recruit", loginVo);
		 
		 if (submitCheck.equals("2")) {
			 EducationVo educationVo = recruitService.selectEducation(loginVo);
			 CareerVo careerVo = recruitService.selectCareer(loginVo);			 
			 CertificateVo certificateVo = recruitService.selectCertificate(loginVo);
			 
			 int educationYear = calculateYears(educationVo.getStartPeriod(),educationVo.getEndPeriod());
			 int careerYear = calculateYears(careerVo.getStartPeriod(), careerVo.getEndPeriod());		 
			 int careerRemainingMonths =calculateRemainingMonths(careerVo.getStartPeriod(), careerVo.getEndPeriod());

			 model.addAttribute("educationYear", educationYear);
			 model.addAttribute("careerYear", careerYear);
			 model.addAttribute("careerRemainingMonths", careerRemainingMonths);
			 
			 
			 model.addAttribute("education", educationVo);
			 model.addAttribute("career", careerVo);
			 model.addAttribute("certificate", certificateVo);
			 
			 return "recruit/recruitMainSubmit"; 
		 } else if(submitCheck.equals("1")) {
			 EducationVo educationVo = recruitService.selectEducation(loginVo);
			 CareerVo careerVo = recruitService.selectCareer(loginVo);			 
			 CertificateVo certificateVo = recruitService.selectCertificate(loginVo);
			 
			 int educationYear = calculateYears(educationVo.getStartPeriod(),educationVo.getEndPeriod());
			 int careerYear = calculateYears(careerVo.getStartPeriod(), careerVo.getEndPeriod());		 
			 int careerRemainingMonths =calculateRemainingMonths(careerVo.getStartPeriod(), careerVo.getEndPeriod());

			 model.addAttribute("educationYear", educationYear);
			 model.addAttribute("careerYear", careerYear);
			 model.addAttribute("careerRemainingMonths", careerRemainingMonths);
			 
			 
			 model.addAttribute("education", educationVo);
			 model.addAttribute("career", careerVo);
			 model.addAttribute("certificate", certificateVo);
			 
			 return "recruit/recruitMainSave";
		 } else {
			 
			 return "recruit/recruitMain";			 
		 }

	  
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
		 	
		
		 model.addAttribute("recruit", recruitVo);
		 model.addAttribute("education", educationVo);
		 model.addAttribute("career", careerVo);
		 model.addAttribute("certificate", certificateVo);
	  
	  return "recruit/recruitMain"; 
	  
	 }
	 
	 @RequestMapping(value = "/recruit/main/save", method = RequestMethod.POST)
	 public String recruitMainSave(Locale locale, 
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
		 	

		 
		 int recruitResult = recruitService.recruitUpdate(recruitVo);
		 System.out.println("recruitResult::" + recruitResult);
		 int educationResult = recruitService.educationInsert(educationVo, recruitVo);
		 System.out.println("educationResult::" +educationResult);
		 int careerResult = recruitService.careerInsert(careerVo, recruitVo);
		 System.out.println("careerResult::" +careerResult);
		 int certificateResult = recruitService.certificateInsert(certificateVo, recruitVo);
		 System.out.println("certificateResult::" +certificateResult);
		 
		 if(recruitResult > 0 && educationResult > 0 && careerResult > 0 && certificateResult > 0) {
			 System.out.println("제출 성공");
			 recruitService.recruitSave(recruitVo);
		 }else {
			 System.out.println("제출 실패");
		 }
	  
	  return "redirect:/recruit/main"; 
	  
	 }
	 
	 @RequestMapping(value = "/recruit/main/update", method = RequestMethod.GET)
	 public String recruitMainUpdate(Locale locale, 
			 HttpSession session,
			 Model model ) throws Exception{
		 
		 RecruitVo loginVo = (RecruitVo) session.getAttribute("login");
		 String submitCheck = loginVo.getSubmit();
		 System.out.println(":::submitCheck"+ loginVo.getSubmit());
		 System.out.println(":::submitCheck2인지"+ submitCheck.equals("2"));
		 model.addAttribute("recruit", loginVo);
		 
		 if(submitCheck.equals("1")) {
			 EducationVo educationVo = recruitService.selectEducation(loginVo);
			 CareerVo careerVo = recruitService.selectCareer(loginVo);			 
			 CertificateVo certificateVo = recruitService.selectCertificate(loginVo);
			 
			 int educationYear = calculateYears(educationVo.getStartPeriod(),educationVo.getEndPeriod());
			 int careerYear = calculateYears(careerVo.getStartPeriod(), careerVo.getEndPeriod());		 
			 int careerRemainingMonths =calculateRemainingMonths(careerVo.getStartPeriod(), careerVo.getEndPeriod());

			 model.addAttribute("educationYear", educationYear);
			 model.addAttribute("careerYear", careerYear);
			 model.addAttribute("careerRemainingMonths", careerRemainingMonths);
			 
			 
			 model.addAttribute("education", educationVo);
			 model.addAttribute("career", careerVo);
			 model.addAttribute("certificate", certificateVo);
			 
			 return "redirect:recruit/main";
		 }else {
			 return "recruit/recruitMain";			 
		 }
	}
	 
	 @RequestMapping(value = "/recruit/main/update", method = RequestMethod.POST)
	 public String recruitMainUpdate(Locale locale, 
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

		 
		 int recruitResult = recruitService.recruitUpdate(recruitVo);
		 System.out.println("recruitResult::" + recruitResult);
		 int educationResult = recruitService.educationUpdate(educationVo);
		 System.out.println("educationResult::" +educationResult);
		 int careerResult = recruitService.careerUpdate(careerVo);
		 System.out.println("careerResult::" +careerResult);
		 int certificateResult = recruitService.certificateUpdate(certificateVo);
		 System.out.println("certificateResult::" +certificateResult);
		 
		 if(recruitResult > 0 && educationResult > 0 && careerResult > 0 && certificateResult > 0) {
			 System.out.println("제출 성공");
			 recruitService.recruitSave(recruitVo);
		 }else {
			 System.out.println("제출 실패");
		 }
	  
	  return "recruit/recruitMainSave"; 
	  
	 }
	 
	 @RequestMapping(value = "/recruit/main/submit", method = RequestMethod.POST)
	 public String recruitMainSubmit(Locale locale, 
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
//		 educationVo.setSeq(recruitVo.getSeq());
		 educationVo.setStartPeriod(educationStartPeriod);
		 educationVo.setEndPeriod(educationEndPeriod);
		 educationVo.setLocation(educationLocation);
//		 careerVo.setSeq(recruitVo.getSeq());
		 careerVo.setStartPeriod(careerStartPeriod);
		 careerVo.setEndPeriod(careerEndPeriod);
		 careerVo.setLocation(careerLocation);
//		 certificateVo.setSeq(recruitVo.getSeq());
		 	

		
//		 int educationYear = calculateYears(educationVo.getStartPeriod(),educationVo.getEndPeriod());
//		 int careerYear = calculateYears(careerVo.getStartPeriod(), careerVo.getEndPeriod());		 
//		 int careerRemainingMonths =calculateRemainingMonths(careerVo.getStartPeriod(), careerVo.getEndPeriod());
//		 
//		 
//		 model.addAttribute("recruit", recruitVo);
//		 model.addAttribute("education", educationVo);
//		 
//		 model.addAttribute("educationYear", educationYear);
//		 model.addAttribute("careerYear", careerYear);
//		 model.addAttribute("careerRemainingMonths", careerRemainingMonths);
//		 
//		 model.addAttribute("career", careerVo);
//		 model.addAttribute("certificate", certificateVo);
//		 
//		 System.out.println("seq::"+recruitVo.getSeq());
//		 System.out.println("seq::"+recruitVo.getName());
//		 System.out.println("seq::"+recruitVo.getPhone());
//		 
		 
		 int recruitResult = recruitService.recruitUpdate(recruitVo);
		 System.out.println("recruitResult::" + recruitResult);
		 int educationResult = recruitService.educationInsert(educationVo, recruitVo);
		 System.out.println("educationResult::" +educationResult);
		 int careerResult = recruitService.careerInsert(careerVo, recruitVo);
		 System.out.println("careerResult::" +careerResult);
		 int certificateResult = recruitService.certificateInsert(certificateVo, recruitVo);
		 System.out.println("certificateResult::" +certificateResult);
		 
		 if(recruitResult > 0 && educationResult > 0 && careerResult > 0 && certificateResult > 0) {
			 System.out.println("제출 성공");
			 recruitService.recruitSubmit(recruitVo);
		 }else {
			 System.out.println("제출 실패");
		 }
	  
	  return "redirect:/recruit/main"; 
	  
	 }
	 
	 public static int calculateYears(String startDateStr, String endDateStr) {
		 	// 날짜 형식 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy.MM.dd");
	        
	        // 입력된 날짜 문자열을 LocalDate 객체로 변환
		 
	        LocalDate startDate = LocalDate.parse(startDateStr,formatter);
	        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

	        // 날짜 간의 차이 계산
	        Period period = Period.between(startDate, endDate);

	        // 차이에서 년수 반환
	        return period.getYears();
	    }
	 
	 public static int calculateRemainingMonths(String startDateStr, String endDateStr) {
		 	// 날짜 형식 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy.MM.dd");
	        
	        // 입력된 날짜 문자열을 LocalDate 객체로 변환
	        LocalDate startDate = LocalDate.parse(startDateStr, formatter);
	        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

	        // 날짜 간의 차이 계산
	        Period period = Period.between(startDate, endDate);

	        // 년수를 제외한 나머지 개월수 반환
	        int remainingMonths = period.getMonths();

	        return remainingMonths;
	    }
	 


}

