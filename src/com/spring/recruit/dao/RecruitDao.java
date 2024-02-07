package com.spring.recruit.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.recruit.vo.CareerVo;
import com.spring.recruit.vo.CertificateVo;
import com.spring.recruit.vo.EducationVo;
import com.spring.recruit.vo.RecruitVo;

public interface RecruitDao {
	
	public RecruitVo recruitLogin(RecruitVo recruitVo) throws Exception;
	
	public EducationVo selectEducation(RecruitVo recruitVo) throws Exception;
	
	public CareerVo selectCareer(RecruitVo recruitVo) throws Exception;
	
	public CertificateVo selectCertificate(RecruitVo recruitVo) throws Exception;
	
	
	public int recruitSave(RecruitVo recruitVo) throws Exception;
	
	public int recruitSubmit(RecruitVo recruitVo) throws Exception;
	
  
	public int recruitJoin(RecruitVo recruitVo) throws Exception;
		
	public int recruitUpdate(RecruitVo recruitVo) throws Exception;
	
	public int educationUpdate(EducationVo educationVo) throws Exception;
	
	public int careerUpdate(CareerVo careerVo) throws Exception;
	
	public int certificateUpdate(CertificateVo certificateVo) throws Exception;
	
	
	
	public int educationInsert(EducationVo educationVo,RecruitVo recruitVo) throws Exception;
	
	public int careerInsert(CareerVo careerVo, RecruitVo recruitVo) throws Exception;
	
	public int certificateInsert(CertificateVo certificateVo, RecruitVo recruitVo) throws Exception;
	
	
	
	public int educationDelete(EducationVo educationVo) throws Exception;
	
	public int careerDelete(CareerVo careerVo) throws Exception;	
	
	public int certificateDelete(CertificateVo certificateVo) throws Exception;
	
}
