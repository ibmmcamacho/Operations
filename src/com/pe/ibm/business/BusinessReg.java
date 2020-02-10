package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.dao.DaoRegImpl;
import com.pe.ibm.interfac.DaoReg;

public class BusinessReg {
	
	public BeanSession reg(BeanParameters objParameters, SqlSessionFactory ssf)
	{
		BeanSession objBeanSession = new BeanSession();
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReg objDaoRegImpl = new DaoRegImpl();
			objBeanSession = objDaoRegImpl.reg(objParameters, session);
		}
		catch(Exception e)
		{
			objBeanSession = null;
		}finally {
			session.close();
		}
		return objBeanSession;
	}
	
	public BeanParameters getHorarioEmpleado(BeanParameters objParameters, SqlSessionFactory ssf)
	{
		BeanParameters objBeanParameters = new BeanParameters();
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReg objDaoRegImpl = new DaoRegImpl();
			objBeanParameters = objDaoRegImpl.getHorarioEmpleado(objParameters, session);
		}
		catch(Exception e)
		{
			objBeanParameters = null;
		}finally {
			session.close();
		}
		return objBeanParameters;
	}
	
	public List<BeanParameters> listHours(BeanParameters objParameters, SqlSessionFactory ssf)
	{
		List<BeanParameters> lstBeanParameters;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReg objDaoRegImpl = new DaoRegImpl();
			lstBeanParameters = objDaoRegImpl.listHours(objParameters, session);
		}
		catch(Exception e)
		{
			lstBeanParameters = null;
		}finally {
			session.close();
		}
		return lstBeanParameters;
	}
	
	public List<BeanParameters> listUsersConnect(BeanParameters objParameters, SqlSessionFactory ssf)
	{
		List<BeanParameters> lstBeanParameters;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReg objDaoRegImpl = new DaoRegImpl();
			lstBeanParameters = objDaoRegImpl.listUsuariosConectados(objParameters, session);
		}
		catch(Exception e)
		{
			lstBeanParameters = null;
		}finally {
			session.close();
		}
		return lstBeanParameters;
	}

}
