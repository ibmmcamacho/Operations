package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanGrupo;
import com.pe.ibm.interfac.DaoGrupo;

public class DaoGrupoImpl implements DaoGrupo {

	@Override
	public List<BeanGrupo> listGrupo(BeanGrupo pBeanGrupo, SqlSession session) {
		
		List<BeanGrupo> lstGrupo = null;
		try{
			lstGrupo = session.selectList("grupo.getGrupo",pBeanGrupo);
		}
		catch(Exception ex){
			lstGrupo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstGrupo;
	}

}
