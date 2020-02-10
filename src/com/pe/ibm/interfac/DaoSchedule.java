package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSchedule;

public interface DaoSchedule {
	
	public int insertUdpate(BeanSchedule beanSchedule, SqlSession sqlSession);
	public List<BeanSchedule> listar(BeanEmpleado beanEmpleado, SqlSession sqlSession);
	public List<BeanSchedule> listar_schedules_activos(SqlSession sqlSession);
	public String generarSchedule(SqlSession sqlSession, BeanParameters pBeanParameters);
	public List<BeanSchedule> listar_mis_schedules(BeanSchedule beanSchedule, SqlSession sqlSession);
}
