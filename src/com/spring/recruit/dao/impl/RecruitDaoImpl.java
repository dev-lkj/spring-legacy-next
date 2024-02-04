package com.spring.recruit.dao.impl;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.vo.RecruitVo;


@Repository
public class RecruitDaoImpl implements RecruitDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int recruitLogin(RecruitVo recruitVo) throws Exception {
		System.out.println("RecruitDaoImpl");
		if(sqlSession.selectOne("recruit.recruitLogin",recruitVo)==1) {
			System.out.println("dao true");
		}else {
			System.out.println("dao false");
		}
		return sqlSession.selectOne("recruit.recruitLogin", recruitVo);
	}
	
	
	
	
	
}
