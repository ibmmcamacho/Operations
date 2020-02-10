package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanMenu;
import com.pe.ibm.bean.BeanParameters;

public interface DaoMenu {
	
	public List<BeanMenu> obtenerMenuUsuario(BeanParameters pobjBeanParameters, SqlSession session);
	
}
