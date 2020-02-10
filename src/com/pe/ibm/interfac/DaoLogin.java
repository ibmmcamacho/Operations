package com.pe.ibm.interfac;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanSession;

public interface DaoLogin {
	
	public BeanSession validarLogin(BeanEmpleado objBeanPersonal, SqlSession session);
	public BeanSession validarLoginCliente(BeanEmpleado objBeanPersonal, SqlSession session);
	

}
