package com.pe.ibm.dao;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanFeedBack;
import com.pe.ibm.interfac.DaoFeedBack;

public class DaoFeedBackImpl implements DaoFeedBack{

	@Override
	public int insert(BeanFeedBack beanFeedBack, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		System.out.println(beanFeedBack.toString());
			try {
				if(sqlSession!=null){
					resultado = sqlSession.insert("feedBack.saveFeedBack",beanFeedBack);
					sqlSession.commit();
					System.out.println(resultado);
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				resultado = 0;
				System.out.println(e.getCause().getMessage());
				e.printStackTrace();
				sqlSession.rollback();
			}	
		return resultado;
	}

	

}
