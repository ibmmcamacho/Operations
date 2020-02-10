package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanSla;
import com.pe.ibm.interfac.DaoSla;

public class DaoSlaImpl implements DaoSla{


	
	@Override
	public List<BeanSla> listar(BeanSla bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanSla> lista = new ArrayList<BeanSla>();
		
			try {
				if(sqlSession!=null){				
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSla.listarticketsla", bean );
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}

}
