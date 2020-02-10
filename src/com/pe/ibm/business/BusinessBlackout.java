package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanBlackout;
import com.pe.ibm.dao.DaoBlackoutImpl;
import com.pe.ibm.interfac.DaoBlackout;

public class BusinessBlackout {
	
	public List<BeanBlackout> listar(BeanBlackout bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoBlackout dao = new DaoBlackoutImpl();
		List<BeanBlackout> lista = new ArrayList<BeanBlackout>();
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
