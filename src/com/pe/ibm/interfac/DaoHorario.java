package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanHorario;
import com.pe.ibm.bean.BeanParameters;

public interface DaoHorario {

	public List<BeanHorario> listHorario(BeanHorario pBeanHorario, SqlSession session);
	public int saveHorario(BeanHorario pBeanHorario, SqlSession session);
	public int updateHorario(BeanHorario pBeanHorario, SqlSession session);
	public int deleteHorario(BeanHorario pBeanHorario, SqlSession session);
	public BeanParameters getValidateHorario(BeanParameters pBeanParameters, SqlSession session);

	//Asignación de Horario
	public List<BeanParameters> listHorarioAsignacion(BeanParameters pBeanParameters, SqlSession session);
	public int saveHorarioAsignacion(BeanParameters pBeanParameters, SqlSession session);
	public int updateHorarioAsignacion(BeanParameters pBeanParameters, SqlSession session);
	public int deleteHorarioAsignacion(BeanParameters pBeanParameters, SqlSession session);
	
}
