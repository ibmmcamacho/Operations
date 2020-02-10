package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBackups;


public interface DaoBackups {

	public List<BeanBackups> listar(BeanBackups bean, SqlSession sqlSession);
	
	public List<BeanBackups> listarcomboresource(BeanBackups bean, SqlSession sqlSession);
	
	public int insertUdpate(BeanBackups bean, SqlSession sqlSession);
}
