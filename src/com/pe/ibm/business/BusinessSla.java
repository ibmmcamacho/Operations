package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanSla;

import com.pe.ibm.dao.DaoSlaImpl;
import com.pe.ibm.interfac.DaoSla;

public class BusinessSla {
	
	public List<BeanSla> listar(BeanSla bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoSla dao = new DaoSlaImpl();
		List<BeanSla> lista = new ArrayList<BeanSla>();
			try {
				lista = dao.listar(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
}
