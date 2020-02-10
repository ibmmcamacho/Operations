package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;

public interface DaoReg {

	public BeanSession reg(BeanParameters objParameters, SqlSession session);
	public List<BeanParameters> listHours(BeanParameters objParameters, SqlSession session);
	public List<BeanParameters> listUsuariosConectados(BeanParameters objParameters, SqlSession session);
	public BeanParameters getHorarioEmpleado(BeanParameters objParameters, SqlSession session);
}
