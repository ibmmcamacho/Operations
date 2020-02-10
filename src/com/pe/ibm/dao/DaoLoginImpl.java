package com.pe.ibm.dao;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.interfac.DaoLogin;

public class DaoLoginImpl implements DaoLogin{

	@Override
	public BeanSession validarLogin(BeanEmpleado pobjBeanPersonal, SqlSession session) {
		BeanSession objBeanSession = new BeanSession();
		try{
			BeanEmpleado objBeanPersonal = new BeanEmpleado();	
				objBeanPersonal = session.selectOne("Login.getLogin",pobjBeanPersonal);
				objBeanSession.setObjBeanPersonal(objBeanPersonal);
			}
			catch(Exception ex){
				System.out.println(ex.getCause().getMessage());
			}
		return objBeanSession;
	}

	@Override
	public BeanSession validarLoginCliente(BeanEmpleado pobjBeanPersonal, SqlSession session) {
		BeanSession objBeanSession = new BeanSession();
		try{
			BeanEmpleado objBeanPersonal = new BeanEmpleado();
				objBeanPersonal = session.selectOne("Login.getLoginCliente",pobjBeanPersonal);
				objBeanSession.setObjBeanPersonal(objBeanPersonal);
			}
			catch(Exception ex){
				System.out.println(ex.getCause().getMessage());
			}
		return objBeanSession;
	}
}
