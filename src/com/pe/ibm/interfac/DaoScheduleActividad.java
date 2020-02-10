package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanSchedule;
import com.pe.ibm.bean.BeanScheduleActividad;


public interface DaoScheduleActividad {

	public int insertUdpate(BeanScheduleActividad beanScheduleActividad, SqlSession sqlSession);
	public List<BeanScheduleActividad> listar(BeanScheduleActividad bean, SqlSession sqlSession);
	public BeanScheduleActividad buscarScheduleActividad(BeanScheduleActividad bean, SqlSession sqlSession);
	public List<BeanScheduleActividad> listarMonitoreoIndia(BeanScheduleActividad bean, SqlSession sqlSession);
	
}
