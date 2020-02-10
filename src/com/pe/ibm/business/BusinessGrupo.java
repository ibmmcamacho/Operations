package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanGrupo;
import com.pe.ibm.dao.DaoGrupoImpl;
import com.pe.ibm.interfac.DaoGrupo;

public class BusinessGrupo {

	public List<BeanGrupo> listGrupo(BeanGrupo pBeanGrupo, SqlSessionFactory ssf) {
		List<BeanGrupo> lstBeanGrupo = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoGrupo objDaoGrupoImpl = new DaoGrupoImpl();
			lstBeanGrupo = objDaoGrupoImpl.listGrupo(pBeanGrupo, session);
		} catch (Exception ex) {
			lstBeanGrupo = null;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return lstBeanGrupo;
	}
}
