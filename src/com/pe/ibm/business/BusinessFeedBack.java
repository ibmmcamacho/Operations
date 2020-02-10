package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanFeedBack;
import com.pe.ibm.dao.DaoFeedBackImpl;
import com.pe.ibm.interfac.DaoFeedBack;



public class BusinessFeedBack {
	
	public int insertar(BeanFeedBack beanFeedBack, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoFeedBack dao = new DaoFeedBackImpl();
		int resultado = 0;
			try {
				resultado = dao.insert(beanFeedBack, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
		
	}
	
	
	


}
