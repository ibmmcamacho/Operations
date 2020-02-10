package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanActividad;
import com.pe.ibm.bean.BeanInformix;
import com.pe.ibm.dao.DaoInformixImpl;
import com.pe.ibm.interfac.DaoInformix;

public class BusinessInformix {
	
	public List<BeanInformix> listarInformix(BeanInformix beanInformix,SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoInformix dao = new DaoInformixImpl();
		List<BeanInformix> lista = new ArrayList<BeanInformix>();
			try {
				lista = dao.listar(beanInformix,sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
}
