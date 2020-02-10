package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanActividad;
import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanInformix;
import com.pe.ibm.interfac.DaoActividad;
import com.pe.ibm.interfac.DaoInformix;

public class DaoInformixImpl implements DaoInformix{

	@Override
	public List<BeanInformix> listar(BeanInformix beanInformix, SqlSession sqlSession) {
		List<BeanInformix> lista = new ArrayList<BeanInformix>();
		
		try {
			if(sqlSession!=null){
				lista = sqlSession.selectList("informix.listar");
			}else{
				System.err.println("no hay conexi�n");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
	
	return lista;
	}

}
