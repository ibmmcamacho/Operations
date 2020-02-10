package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanActividad;
import com.pe.ibm.bean.BeanEmpleado;


public interface DaoActividad {

	public int insertUdpate(BeanActividad beanActividad, SqlSession sqlSession);
	
	public List<BeanActividad> listar(BeanEmpleado beanEmpleado,SqlSession sqlSession);
	
	public BeanActividad listarPorID(BeanActividad bean, SqlSession sqlSession);
	
	public List<BeanActividad> listarHistorial(BeanActividad bean, SqlSession sqlSession);
	
}
