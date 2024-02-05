package com.spring.recruit.dao.impl;


import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.vo.RecruitVo;


@Repository
public class RecruitDaoImpl implements RecruitDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public RecruitVo recruitLogin(RecruitVo recruitVo) throws Exception {
		System.out.println("RecruitDaoImpl");
//		if(sqlSession.selectOne("recruit.recruitLogin",recruitVo).toString()) {
//			System.out.println("dao true");
//		}else {
//			System.out.println("dao false");
//		}
		System.out.println("dao내부 sql체크:::"+sqlSession.selectOne("recruit.selectLogin", recruitVo));
		return sqlSession.selectOne("recruit.selectLogin",recruitVo);
	}
	
	
	
	
	
}
