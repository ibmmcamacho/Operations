package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanHorarioEmpleado;

public interface DaoHorarioEmpleado {
	
	public List<BeanHorarioEmpleado> listHorarioEmpleado(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSession session);
	public int saveHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSession session);
	public int updateHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSession session);
	public int deleteHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSession session);
	
}
