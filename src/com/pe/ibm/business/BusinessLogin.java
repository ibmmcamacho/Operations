package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanMenu;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.dao.DaoLoginImpl;
import com.pe.ibm.dao.DaoMenuImpl;
import com.pe.ibm.interfac.DaoLogin;
import com.pe.ibm.interfac.DaoMenu;

public class BusinessLogin {
	
	public List<BeanMenu> obtenerMenuUsuario(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMenu> lstBeanMenu = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMenu objDaoMenuImpl = new DaoMenuImpl();
			lstBeanMenu = objDaoMenuImpl.obtenerMenuUsuario(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMenu = null;
		}finally {
				session.close();
		}
		return lstBeanMenu;
	};
	
	public BeanSession validarLogin(BeanEmpleado objBeanPersonal, SqlSessionFactory ssf){
		BeanSession objBeanSession = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoLogin objDaoLoginImpl = new DaoLoginImpl();
			objBeanSession = objDaoLoginImpl.validarLogin(objBeanPersonal,session);
		}catch(Exception ex){
			objBeanSession = null;
		}finally {
				session.close();
		}
		return objBeanSession;
	};
	
	public BeanSession validarLoginCliente(BeanEmpleado objBeanPersonal, SqlSessionFactory ssf){
		BeanSession objBeanSession = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoLogin objDaoLoginImpl = new DaoLoginImpl();
			objBeanSession = objDaoLoginImpl.validarLoginCliente(objBeanPersonal,session);
		}catch(Exception ex){
			objBeanSession = null;
		}finally {
				session.close();
		}
		return objBeanSession;
	};
}
