package com.spring.recruit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.service.RecruitService;
import com.spring.recruit.vo.RecruitVo;

@Service
public class RecruitServiceImpl implements RecruitService{

	@Autowired
	RecruitDao recruitDao;
	
	
	@Override
	public int recruitLogin(RecruitVo recruitVo) throws Exception {
		System.out.println("recrutServiceImpl");
		System.out.println(recruitDao.recruitLogin(recruitVo));
		return recruitDao.recruitLogin(recruitVo);
	}
	

	
	
}
