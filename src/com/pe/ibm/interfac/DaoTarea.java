package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanTarea;
import com.pe.ibm.bean.BeanTareaAsignada;
import com.pe.ibm.bean.BeanTareaBacklog;


public interface DaoTarea {
	
	public int insertUdpate(BeanTarea beanTarea, SqlSession sqlSession);
	
	public List<BeanTarea> listar(SqlSession sqlSession, BeanTarea objBeanTarea);
	
	public List<BeanTarea> listarGestor(SqlSession sqlSession, BeanTarea objBeanTarea);
	
	public int insertUdpateTareaAsignada(BeanTareaAsignada beanTareaAsignada, SqlSession sqlSession);
	
	public List<BeanTareaAsignada> listarTareasAsignadas(BeanTareaAsignada beanTareaAsignada, SqlSession sqlSession);
	
	public List<BeanTareaAsignada> listarTareasGeneradas(BeanTarea objBeanTarea, SqlSession sqlSession);
	
	public BeanTareaAsignada buscarTareaAsignada(BeanTareaAsignada beanTareaAsignada, SqlSession sqlSession);

	public int insertUdpateGestor(BeanTarea beanTarea, SqlSession sqlSession);
	
	public List<BeanTareaBacklog> listarBacklog(SqlSession sqlSession);
	
	
	
}
