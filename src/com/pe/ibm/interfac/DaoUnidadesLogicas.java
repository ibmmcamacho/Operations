package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.bean.BeanUnidadesLogicas;


public interface DaoUnidadesLogicas {

	public List<BeanUnidadesLogicas> listar(BeanUnidadesLogicas bean, SqlSession sqlSession);
	
	public List<BeanUnidadesLogicas> listarcomboresource(BeanUnidadesLogicas bean, SqlSession sqlSession);
	
	public int insertUdpate(BeanUnidadesLogicas bean, SqlSession sqlSession);
}
