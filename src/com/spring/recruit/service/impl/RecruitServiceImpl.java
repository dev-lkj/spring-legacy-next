package com.spring.recruit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.dao.impl.RecruitDaoImpl;
import com.spring.recruit.service.RecruitService;
import com.spring.recruit.vo.CareerVo;
import com.spring.recruit.vo.CertificateVo;
import com.spring.recruit.vo.EducationVo;
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
	
	@Override
	public EducationVo selectEducation(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return recruitDao.selectEducation(recruitVo);
	}

	@Override
	public CareerVo selectCareer(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return recruitDao.selectCareer(recruitVo);
	}

	@Override
	public CertificateVo selectCertificate(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return recruitDao.selectCertificate(recruitVo);
	}
	
	@Override
	public int recruitSave(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return recruitDao.recruitSave(recruitVo);
	}
	
	@Override
	public int recruitSubmit(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return recruitDao.recruitSubmit(recruitVo);
	}
	
	
	@Override
	public int recruitJoin(RecruitVo recruitVo) throws Exception{
		return recruitDao.recruitJoin(recruitVo);
	}
	
	@Override
	public int recruitUpdate(RecruitVo recruitVo) throws Exception{
		return recruitDao.recruitUpdate(recruitVo);
	}
	
	@Override
	public int educationUpdate(EducationVo educationVo) throws Exception{
		return recruitDao.educationUpdate(educationVo);
	}
	
	@Override
	public int careerUpdate(CareerVo careerVo) throws Exception{
		return recruitDao.careerUpdate(careerVo);
	}
	
	@Override
	public int certificateUpdate(CertificateVo certificateVo) throws Exception{
		return recruitDao.certificateUpdate(certificateVo);
	}
	

	@Override
	public int educationInsert(EducationVo educationVo, RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return recruitDao.educationInsert(educationVo, recruitVo);
	}

	@Override
	public int careerInsert(CareerVo careerVo, RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return recruitDao.careerInsert(careerVo, recruitVo);
	}

	@Override
	public int certificateInsert(CertificateVo certificateVo, RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return recruitDao.certificateInsert(certificateVo, recruitVo);
	}
	
	@Override
	public int educationDelete(EducationVo educationVo) throws Exception{
		return recruitDao.educationDelete(educationVo);
	}
	
	@Override
	public int careerDelete(CareerVo careerVo) throws Exception{
		return recruitDao.careerDelete(careerVo);
	}
	
	@Override
	public int certificateDelete(CertificateVo certificateVo) throws Exception{
		return recruitDao.certificateDelete(certificateVo);
	}

	
	
	

	
	
}

