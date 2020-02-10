package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanMenu;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.dao.DaoMenuImpl;
import com.pe.ibm.interfac.DaoMenu;

public class BusinessMenu {

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
	
}
