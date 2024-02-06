package com.spring.recruit.dao.impl;


import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.vo.CareerVo;
import com.spring.recruit.vo.CertificateVo;
import com.spring.recruit.vo.EducationVo;
import com.spring.recruit.vo.RecruitVo;


@Repository
public class RecruitDaoImpl implements RecruitDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public RecruitVo recruitLogin(RecruitVo recruitVo) throws Exception {
		System.out.println("RecruitDaoImpl");

		System.out.println("dao내부 sql체크:::"+sqlSession.selectOne("recruit.selectLogin", recruitVo));
		return sqlSession.selectOne("recruit.selectLogin",recruitVo);
	}
	

	@Override
	public EducationVo selectEducation(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recruit.selectEducation",recruitVo);
	}



	@Override
	public CareerVo selectCareer(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recruit.selectCareer",recruitVo);
	}



	@Override
	public CertificateVo selectCertificate(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("recruit.selectCertificate",recruitVo);
	}
	
	@Override
	public int recruitSave(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("recruit.recruitSave", recruitVo);
	}

	@Override
	public int recruitSubmit(RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("recruit.recruitSubmit", recruitVo);
	}
	
	
	
	@Override
	public int recruitJoin(RecruitVo recruitVo) throws Exception {
		System.out.println("recruitJoinDaoImpl");
		return sqlSession.insert("recruit.recruitJoin", recruitVo);
	}
	
	@Override
	public int recruitUpdate(RecruitVo recruitVo) throws Exception {
		System.out.println("recruitJoinDaoImpl");
		return sqlSession.update("recruit.recruitUpdate", recruitVo);
	}
	
	@Override
	public int educationUpdate(EducationVo educationVo) throws Exception{
		return sqlSession.update("recruit.educationUpdate", educationVo);
	}
	
	@Override
	public int careerUpdate(CareerVo careerVo) throws Exception{
		return sqlSession.update("recruit.careerUpdate", careerVo);
	}
	
	@Override
	public int certificateUpdate(CertificateVo certificateVo) throws Exception {
		return sqlSession.update("recruit.certificateUpdate", certificateVo);
	}
	



	@Override
	public int educationInsert(EducationVo educationVo, RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("educationVo", educationVo);
		map.put("recruitVo", recruitVo);
		
		return sqlSession.insert("recruit.educationInsert", map);
	}



	@Override
	public int careerInsert(CareerVo careerVo, RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("careerVo", careerVo);
		map.put("recruitVo", recruitVo);
		
		return sqlSession.insert("recruit.careerInsert", map);
	}



	@Override
	public int certificateInsert(CertificateVo certificateVo, RecruitVo recruitVo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("certificateVo", certificateVo);
		map.put("recruitVo", recruitVo);
		return sqlSession.insert("recruit.certificateInsert", map);
	}





	
	
	
	
}
