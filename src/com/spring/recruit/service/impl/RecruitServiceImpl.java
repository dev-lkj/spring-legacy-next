package com.spring.recruit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.dao.impl.RecruitDaoImpl;
import com.spring.recruit.service.RecruitService;
import com.spring.recruit.vo.RecruitVo;

@Service
public class RecruitServiceImpl implements RecruitService{

	@Autowired
	RecruitDao recruitDao;
	
	
	@Override
	public RecruitVo recruitLogin(RecruitVo recruitVo) throws Exception {
		System.out.println("recrutServiceImpl");
		System.out.println(recruitDao.recruitLogin(recruitVo));
		return recruitDao.recruitLogin(recruitVo);
	}
	

	
	
}
