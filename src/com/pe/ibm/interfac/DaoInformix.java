package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanInformix;


public interface DaoInformix {

	public List<BeanInformix> listar(BeanInformix beanInformix,SqlSession sqlSession);

}
