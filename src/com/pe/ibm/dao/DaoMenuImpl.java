package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanMenu;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.interfac.DaoMenu;

public class DaoMenuImpl implements DaoMenu {

	@Override
	public List<BeanMenu> obtenerMenuUsuario(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMenu> lstBeanMenu = null;
		try{
				lstBeanMenu =session.selectList("Login.getMenuUsuario",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMenu;
	}
}
